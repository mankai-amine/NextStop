using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using System.IO;
using Stripe;
using Stripe.Checkout; 
using NextStop.Data; 
using NextStop.Models; 


[ApiController]
[Route("webhook")]
public class StripeWebhookController : ControllerBase
{
    private readonly NextStopContext _context;
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly IConfiguration _configuration;
    private readonly ILogger<StripeWebhookController> _logger;

    public StripeWebhookController(NextStopContext context, UserManager<ApplicationUser> userManager, IConfiguration configuration, ILogger<StripeWebhookController> logger)
    {
        _context = context;
        _userManager = userManager;
        _configuration = configuration;
        _logger = logger;
    }

    [HttpPost]
    public async Task<IActionResult> HandleWebhook()
    {
        // Read and validate the webhook payload
        var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();

        try
        {
            var webhookSecret = _configuration["Stripe:WebhookSecret"];

            var stripeEvent = EventUtility.ConstructEvent(
                json,
                Request.Headers["Stripe-Signature"],
                webhookSecret,
                throwOnApiVersionMismatch: false
            );

            // Handle 'checkout.session.completed' event
            //if (stripeEvent.Type == "checkout.session.completed")
            if (stripeEvent.Type == "checkout.session.completed" || stripeEvent.Type == "payment_intent.succeeded")
            {
                var session = stripeEvent.Data.Object as Session;

                // Extract metadata
                var tripId = int.Parse(session.Metadata["TripId"]);
                var numOfPassengers = int.Parse(session.Metadata["NumOfPassengers"]);
                var numOfDiscounts = int.Parse(session.Metadata["NumOfDiscounts"]);
                var dateOfTravel = DateTime.Parse(session.Metadata["DateOfTravel"]);
                var userId = session.Metadata["UserId"];

                // Retrieve the user
                //var user = await _userManager.GetUserAsync(User);
                var user = await _userManager.FindByIdAsync(userId);
                if (user == null)
                {
                    _logger.LogError("User not found");
                    return BadRequest("User not found"); 
                }

                // Retrieve the trip
                var trip = await _context.Trips.FindAsync(tripId);

                // Create and save the order
                var order = new Order
                {
                    Trip = trip,
                    Customer = user,
                    NumOfPassengers = numOfPassengers,
                    NumOfDiscounts = numOfDiscounts,
                    DateOfTravel = dateOfTravel,
                    BookingTime = DateTime.UtcNow.AddMilliseconds(-DateTime.UtcNow.Millisecond)
                };

                _context.Orders.Add(order);
                await _context.SaveChangesAsync();
            }

            return Ok();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error processing webhook");
            return BadRequest(new { error = ex.Message });
        }
    }
}
