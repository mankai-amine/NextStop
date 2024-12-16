using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages
{
    public class TripEditModel : PageModel
    {
        private NextStopContext context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<TripEditModel> _logger;

        public TripEditModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<TripEditModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        public Trip Trip { get; set; }
        
        [BindProperty, Required, Display(Name = "Bus")]
        public int NewBusId { get; set; }

        // [BindProperty, Required, Display(Name = "Driver")]
        // public ApplicationUser NewDriver { get; set; }

        [BindProperty, Required, Display(Name = "Origin")]
        public string NewOrigin { get; set; }

        [BindProperty, Required, Display(Name = "Destination")]
        public string NewDestination { get; set; }

        [BindProperty, Required, Display(Name = "Weekday of Trip")]
        public DayOfWeek NewDepartureDay { get; set; }

        [BindProperty, Required, Display(Name = "Departure Time")]
        public TimeSpan NewDepartureTime { get; set; }

        [BindProperty, Required, Display(Name = "Arrival Time")]
        public TimeSpan NewArrivalTime { get; set; }

        [BindProperty, Required, Display(Name = "Price")]
        [Range(0.01, 1000.00, ErrorMessage = "Price must be greater than 0, but lower than 1000.")]
        public decimal NewPrice { get; set; }

        public List<SelectListItem> BusOptions { get; set; }

        public async Task<IActionResult> OnGetAsync(int? tripId)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!User.IsInRole("Admin"))
            {
                _logger.LogError("TripEdit page, a non-admin user attempted to access this page");
                return RedirectToPage("/Index");
            }
            Trip = await context.Trips.FindAsync(tripId);
            if (Trip == null)
            {
                _logger.LogError("TripEdit page, null Id value");
                return RedirectToPage("/TripAdmin");
            }

            BusOptions = await context.Buses.Select(b =>
                new SelectListItem
                {
                    Value = b.Id.ToString(),
                    Text = b.Model,
                    Selected = b.Id == Trip.BusId
                }).ToListAsync();
            
            NewBusId = Trip.BusId;
            NewOrigin = Trip.Origin;
            NewDestination = Trip.Destination;
            NewDepartureDay = Trip.DepartureDay;
            NewDepartureTime = Trip.DepartureTime;
            NewArrivalTime = Trip.ArrivalTime;
            NewPrice = Trip.Price;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? tripId)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!User.IsInRole("Admin"))
            {
                _logger.LogError("TripEdit page, a non-admin user attempted to post this page");
                return RedirectToPage("/Index");
            }
            if (ModelState.IsValid)
            {
                Trip = await context.Trips.FindAsync(tripId);
                if (Trip == null)
                {
                    _logger.LogError("TripEdit page, null Id value");
                    return RedirectToPage("/TripAdmin");
                }
                Trip.BusId = NewBusId;
                Trip.Origin = NewOrigin;
                Trip.Destination = NewDestination;
                Trip.DepartureDay = NewDepartureDay;
                Trip.DepartureTime = NewDepartureTime;
                Trip.ArrivalTime = NewArrivalTime;
                Trip.Price = NewPrice;

                await context.SaveChangesAsync();
                TempData["Confirmation"] = "Trip edited successfully.";
                return RedirectToPage("/TripAdmin");
            }
            return Page();
        }
    }
}
