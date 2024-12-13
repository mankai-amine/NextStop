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

    // [BindProperty, Display(Name = "Weekday of Trip")]
    public DayOfWeek? NewDepartureDay {get; set; }

    public IList<Trip> Trips {get; set; } = new List<Trip>();

    public async Task<IActionResult> OnGetAsync(string? origin,
                                                string? destination,
                                                DateTime? date)
    {
        var curUser = await _userManager.GetUserAsync(User);
        if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }

        SearchWasRequested = Request.QueryString.Value?.Length > 1;

        if (SearchWasRequested)
        {
            var query = context.Trips.AsQueryable();

            if (!string.IsNullOrEmpty(origin))
            {
                query = query.Where(t => t.Origin.Contains(origin));
            }

            if (!string.IsNullOrEmpty(destination))
            {
                query = query.Where(t => t.Destination.Contains(destination));
            }

            if (date.HasValue)
            {
                try
                {
                    DateTime today = DateTime.Today;
                    DateTime day = (DateTime)date;
                    if (today < day)
                    {
                        NewDepartureDay = day.DayOfWeek;
                        query = query.Where(t => t.DepartureDay == NewDepartureDay.Value);
                        // TODO logic for searching Orders
                    }
                    else
                    {
                        ModelState.AddModelError("NewDateOfTravel", "Unable to search for past trips, please select a date starting from today.");
                        NewDateOfTravel = DateTime.Now.AddDays(1);
                        return Page();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    // _logger.Log(e);
                }
            }

            Trips = await query.ToListAsync();
        }
        NewDateOfTravel = DateTime.Now.AddDays(1);
        return Page();
    }

}
