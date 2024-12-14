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
        private readonly NextStopContext context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly StripeService _stripeService;

        public OrderTripModel(NextStopContext context, UserManager<ApplicationUser> userManager, StripeService stripeService)
        {
            context = context;
            _userManager = userManager;
            _stripeService = stripeService;
        }

        public Trip Trip;
        public DateTime DateOfTravel { get; set; }
        public int NumberOfPassengers { get; set; }
        public decimal Total { get; set; }
        public string SessionId { get; set; }

        public async Task<IActionResult> OnGetAsync(int? tripId, DateTime? date, int? numPassengers)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (tripId.HasValue && date.HasValue && numPassengers.HasValue) {
                
                Trip = await context.Trips
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
                
                // Create Stripe Checkout Session
                var sessionId = await _stripeService.CreateStripeCheckoutSessionAsync(Total, Trip.Id);
                if (sessionId == null)
                {
                    TempData["ErrorMessage"] = "Failed to create Stripe checkout session.";
                    return RedirectToPage("Error");
                }

                // Store session ID to pass to the form
                SessionId = sessionId;

                return Page();
            }
            TempData["ErrorMessage"] = "An error occurred when loading the page";
            return RedirectToPage("/Index");
        }

        // Handle Stripe payment session creation (on POST)
        public async Task<IActionResult> OnPostAsync(decimal amount, int tripId)
        {
            // Create a Stripe checkout session using the passed parameters
            var sessionId = await _stripeService.CreateStripeCheckoutSessionAsync(amount, tripId);

            if (sessionId == null)
            {
                TempData["ErrorMessage"] = "Failed to create Stripe checkout session.";
                return RedirectToPage("Error");
            }

            // Redirect to Stripe checkout page
            return Redirect($"https://checkout.stripe.com/pay/{sessionId}");
        }

    }
}
