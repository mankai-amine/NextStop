using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;
namespace NextStop.Services;


public class StripeService
{
    private readonly string _publishableKey;

    public StripeService(IConfiguration configuration)
    {
        // Set Stripe's secret key globally (for server-side API calls)
        StripeConfiguration.ApiKey = configuration["Stripe:SecretKey"];
        
        // Store publishable key (for client-side use, e.g., in scripts)
        _publishableKey = configuration["Stripe:PublishableKey"];
    }

    // Expose the publishable key if needed
    public string GetPublishableKey()
    {
        return _publishableKey;
    }

    // Create a Stripe Checkout Session
    public async Task<string> CreateStripeCheckoutSessionAsync(decimal amount, int tripId)
    {
        try
        {
            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<string> { "card" },
                LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                    {
                        PriceData = new SessionLineItemPriceDataOptions
                        {
                            Currency = "usd", // Adjust currency if needed
                            ProductData = new SessionLineItemPriceDataProductDataOptions
                            {
                                Name = $"Trip #{tripId}"
                            },
                            UnitAmount = (long)(amount * 100) // Convert to cents
                        },
                        Quantity = 1
                    }
                },
                Mode = "payment",
                SuccessUrl = "https://yourwebsite.com/success",
                CancelUrl = "https://yourwebsite.com/cancel",
            };

            var service = new SessionService();
            var session = await service.CreateAsync(options);
            return session.Id;
        }
        catch (Exception ex)
        {
            // Log error for debugging
            Console.WriteLine($"Stripe Error: {ex.Message}");
            return null;
        }
    }
}
