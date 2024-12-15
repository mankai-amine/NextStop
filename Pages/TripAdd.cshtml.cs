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
    public class TripAddModel : PageModel
    {
        private NextStopContext context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<TripAddModel> _logger;

        public TripAddModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<TripAddModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        [BindProperty, Required, Display(Name = "Bus")]
        public int NewBusId { get; set; }

        // [BindProperty, Required, Display(Name = "Driver")]
        // public ApplicationUser NewDriver { get; set; }

        [BindProperty, Required, Display(Name = "Origin")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "An origin is required and may not exceed 50 characters.")]
        public string NewOrigin { get; set; }

        [BindProperty, Required, Display(Name = "Destination")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "A destination is required and may not exceed 50 characters.")]
        public string NewDestination { get; set; }

        [BindProperty, Required, Display(Name = "Weekday of Trip")]
        public DayOfWeek NewDepartureDay { get; set; }

        [BindProperty, Required, Display(Name = "Departure Time")]
        [DataType(DataType.Time)]
        public TimeSpan NewDepartureTime { get; set; }

        [BindProperty, Required, Display(Name = "Arrival Time")]
        [DataType(DataType.Time)]
        public TimeSpan NewArrivalTime { get; set; }

        [BindProperty, Required, Display(Name = "Price")]
        [Range(0.01, 1000.00, ErrorMessage = "Price must be greater than 0, but lower than 1000.")]
        public decimal NewPrice { get; set; }

        public List<SelectListItem> BusOptions { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!User.IsInRole("Admin"))
            {
                _logger.LogError("TripAdd page, a non-admin user attempted to access this page");
                return RedirectToPage("/Index");
            }
            BusOptions = await context.Buses.Select(b =>
                new SelectListItem
                {
                    Value = b.Id.ToString(),
                    Text = b.Model
                }).ToListAsync();

            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!User.IsInRole("Admin"))
            {
                _logger.LogError("TripAdd page, a non-admin user attempted to post this page");
                return RedirectToPage("/Index");
            }
            if (ModelState.IsValid)
            {
                Trip newTrip = new Trip
                {
                    BusId = NewBusId,
                    Driver = null,
                    Origin = NewOrigin,
                    Destination = NewDestination,
                    DepartureDay = NewDepartureDay,
                    DepartureTime = NewDepartureTime,
                    ArrivalTime = NewArrivalTime,
                    Price = NewPrice
                };
                context.Trips.Add(newTrip);
                await context.SaveChangesAsync();
                TempData["Confirmation"] = "Trip added successfully.";
                return RedirectToPage("/TripAdmin");
            }
            return Page();
        }
    }
}
