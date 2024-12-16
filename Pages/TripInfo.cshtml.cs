using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;
using NextStop.Services;
using Stripe;
using Stripe.Checkout;

namespace NextStop.Pages
{
    public class TripInfoModel : PageModel
    {
        private NextStopContext context;

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<TripInfoModel> _logger;
        private readonly StripeService _stripeService;

        private readonly decimal Discount = 0.8m;

        public TripInfoModel(NextStopContext context, UserManager<ApplicationUser> userManager, StripeService stripeService, ILogger<TripInfoModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _stripeService = stripeService;
            _logger = logger;
        }

        public Trip Trip;
        [BindProperty]
        public DateTime DateOfTravel { get; set; }
        [BindProperty]
        public int NumberOfPassengers { get; set; }
        [BindProperty]
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




        // Handle Stripe payment session creation (on POST)
        public async Task<IActionResult> OnPostAsync(decimal amount, int tripId)
        {
            // Get the current user
            var curUser = await _userManager.GetUserAsync(User);

            if (curUser == null)
            {
                TempData["ErrorMessage"] = "User not authenticated.";
                return RedirectToPage("/Account/Login", new { area = "Identity" });
            }

            // Validate the trip ID
            var trip = await context.Trips.FindAsync(tripId);
            if (trip == null)
            {
                TempData["ErrorMessage"] = "Trip not found.";
                return RedirectToPage("Error");
            }

            // Create a Stripe Checkout session
            var sessionUrl = await _stripeService.CreateStripeCheckoutSessionAsync(
                amount,
                tripId,
                DateOfTravel,
                NumberOfPassengers, 
                NumberOfDiscounts,
                curUser.Id
            );

            if (string.IsNullOrEmpty(sessionUrl))
            {
                TempData["ErrorMessage"] = "Failed to create Stripe checkout session.";
                return RedirectToPage("Error");
            }

            // Redirect the user to the Stripe Checkout page
            return Redirect(sessionUrl);
        }
    }
}
