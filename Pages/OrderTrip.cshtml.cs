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
    public class OrderTripModel : PageModel
    {
        private readonly NextStopContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly StripeService _stripeService;

        public OrderTripModel(NextStopContext context, UserManager<ApplicationUser> userManager, StripeService stripeService)
        {
            _context = context;
            _userManager = userManager;
            _stripeService = stripeService;
        }

        public Trip Trip;
        [BindProperty]
        public DateTime DateOfTravel { get; set; }
        [BindProperty]
        public int NumberOfPassengers { get; set; }
        public decimal Total { get; set; }

        public async Task<IActionResult> OnGetAsync(int? tripId, DateTime? date, int? numPassengers)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (tripId.HasValue && date.HasValue && numPassengers.HasValue) {
                
                Trip = await _context.Trips
                    .Include(t => t.Bus)
                    .FirstOrDefaultAsync(t => t.Id == tripId);
                
                if (Trip == null)
                {
                    TempData["ErrorMessage"] = "No trip was found.";
                    return RedirectToPage("/Index");
                }

                DateTime day = (DateTime) date;
                day = day.Date;
                DateOfTravel = day;

                NumberOfPassengers = (int)numPassengers;
                Total = Trip.Price * NumberOfPassengers;

                return Page();
            }
            TempData["ErrorMessage"] = "An error occurred when loading the page";
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
            var trip = await _context.Trips.FindAsync(tripId);
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
