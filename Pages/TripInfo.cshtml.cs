using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages
{
    public class TripInfoModel : PageModel
    {
        private NextStopContext context;

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<TripInfoModel> _logger;

        private readonly decimal Discount = 0.8m;

        public TripInfoModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<TripInfoModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        public Trip Trip;
        public DateTime DateOfTravel { get; set; }
        public int NumberOfPassengers { get; set; }
        public int NumberOfDiscounts { get; set; }
        public decimal Total { get; set; }
        public bool OrderButtonActive { get; set; } = false;

        public async Task<IActionResult> OnGetAsync(int? tripId,
                                                    DateTime? date,
                                                    int? passengers,
                                                    int? discounts)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (tripId.HasValue && date.HasValue && passengers.HasValue && discounts.HasValue) {
                
                Trip = await context.Trips
                    .Include(t => t.Bus)
                    .FirstOrDefaultAsync(t => t.Id == tripId);
                
                if (Trip == null)
                {
                    TempData["ErrorMessage"] = "No trip was found.";
                    _logger.LogError("TripInfo page, Trip ID search returned on valid trip");
                    return RedirectToPage("/Index");
                }
                if (discounts > passengers)
                {
                    TempData["ErrorMessage"] = "The number of passengers must be equal to or greather than the number of discounts.";
                    return RedirectToPage("/Index");
                }

                DateTime day = (DateTime) date;
                day = day.Date;
                DateOfTravel = day;

                int capacity = Trip.Bus.Capacity;

                int numCurrentPassengers = context.Orders
                    .Where(o => o.Trip.Id == tripId && o.DateOfTravel.Date == day)
                    .Select(o => o.NumOfPassengers)
                    .DefaultIfEmpty()
                    .Sum();

                if ((capacity - numCurrentPassengers) > passengers)
                {
                    OrderButtonActive = true;
                }
                NumberOfPassengers = (int)passengers;
                NumberOfDiscounts = (int)discounts;
                Total = (Trip.Price * (NumberOfPassengers - NumberOfDiscounts))
                    + (Discount * Trip.Price * NumberOfDiscounts);
                
                return Page();
            }
            TempData["ErrorMessage"] = "An error occurred when loading the page";
            _logger.LogError("TripInfo page, 1 or more parameters was missing a value");
            return RedirectToPage("/Index");
        }
    }
}
