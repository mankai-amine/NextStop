using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages;

public class IndexModel : PageModel
{
    private NextStopContext context;
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly ILogger<IndexModel> _logger;

    public IndexModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<IndexModel> logger)
    {
        this.context = context;
        _userManager = userManager;
        _logger = logger;
    }

    public bool SearchWasRequested {get; private set; }

    [Display(Name = "Origin")]
    public string NewOrigin {get; set; }

    [Display(Name = "Destination")]
    public string NewDestination {get; set; }

    [Display(Name = "Day of Trip")]
    public DateTime NewDateOfTravel {get; set; }

    [Display(Name= "Total Passengers")]
    public int NewNumOfPassengers {get; set; }

    [Display(Name= "Children and Seniors")]
    public int NewNumOfDiscounts { get; set; }

    public DayOfWeek? NewDepartureDay {get; set; }

    public IList<Trip> Trips {get; set; } = new List<Trip>();

    public async Task<IActionResult> OnGetAsync(string? origin,
                                                string? destination,
                                                DateTime? date,
                                                int? passengers,
                                                int? discounts)
    {
        var curUser = await _userManager.GetUserAsync(User);
        if (curUser == null) 
        {
            return RedirectToPage("/Account/Login", new {area = "Identity" });
        }
        else if (await _userManager.IsInRoleAsync(curUser, "Admin"))
        {
            return RedirectToPage("/TripAdmin");
        }

        SearchWasRequested = Request.QueryString.Value?.Length > 1;

        if (SearchWasRequested)
        {
            var query = context.Trips.AsQueryable();

            if (!string.IsNullOrEmpty(origin))
            {
                query = query.Where(t => t.Origin.Contains(origin));
                NewOrigin = origin;
            }

            if (!string.IsNullOrEmpty(destination))
            {
                query = query.Where(t => t.Destination.Contains(destination));
                NewDestination = destination;
            }

            if (date.HasValue)
            {
                if (passengers <= 0 || discounts < 0 || discounts > passengers)
                    {
                        ModelState.AddModelError("NewNumOfPassengers", "You must book for at least one passenger");
                        NewNumOfPassengers = 1;
                        NewDateOfTravel = (DateTime) date;
                        return Page();
                    }
                try
                {
                    DateTime today = DateTime.Today;
                    DateTime day = (DateTime)date;
                    day = day.Date;
                    if (today <= day)
                    {
                        NewDepartureDay = day.DayOfWeek;

                        // Create a subquery to calculate available seats for each trip
                        var tripsWithAvailability = from t in query
                            where t.DepartureDay == NewDepartureDay.Value
                            select new
                            {
                                Trip = t,
                                AvailableSeats = t.Bus.Capacity - (
                                    context.Orders
                                        .Where(o => o.Trip.Id == t.Id && o.DateOfTravel.Date == day.Date)
                                        .Select(o => o.NumOfPassengers)
                                        .DefaultIfEmpty()
                                        .Sum()
                                    )
                            };

                        // Apply all filters including the capacity check
                        query = tripsWithAvailability
                            .Where(t => t.AvailableSeats >= passengers)
                            .Select(t => t.Trip);
                                    
                        NewDateOfTravel = (DateTime)date;
                        NewNumOfPassengers = (int)passengers;
                        NewNumOfDiscounts = (int)discounts;
                    }
                    else
                    {
                        ModelState.AddModelError("NewDateOfTravel", "Unable to search for past trips, please select a date starting from today.");
                        NewDateOfTravel = DateTime.Now.AddDays(1);
                        NewNumOfPassengers = (int)passengers;
                        NewNumOfDiscounts = (int)discounts;
                        return Page();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
            else
            {
                ModelState.AddModelError("NewDateOfTravel", "Please select a travel date.");
                NewDateOfTravel = DateTime.Now.AddDays(1);
                return Page();
            }

            Trips = await query.ToListAsync();
        }
        else
        {
            NewDateOfTravel = DateTime.Now.AddDays(1);
            NewNumOfPassengers = 1;
        }

        return Page();
    }

}
