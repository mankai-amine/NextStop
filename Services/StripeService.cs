using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;
using Stripe;
using Stripe.Checkout;
namespace NextStop.Services;


public class StripeService
{
    private readonly string _publishableKey;
    private readonly string _secretKey;
    private readonly IConfiguration _configuration;

    public StripeService(IConfiguration configuration)
    {
        _configuration = configuration;
        _secretKey = _configuration["Stripe:SecretKey"];
        _publishableKey = _configuration["Stripe:PublishableKey"];

        if (string.IsNullOrWhiteSpace(_publishableKey))
        {
            throw new InvalidOperationException("Stripe Publishable Key is not configured.");
        }
        if (string.IsNullOrEmpty(_secretKey))
        {
            throw new InvalidOperationException("Stripe Secret Key is not configured.");
        }
        // Set Stripe's secret key globally (for server-side API calls)
        StripeConfiguration.ApiKey = _secretKey;
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
                            Currency = "cad", // Adjust currency if needed
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
                SuccessUrl = "https://localhost:5135/Index",
                CancelUrl = "https://localhost:5135/Index",
            };

            var service = new SessionService();
            var session = await service.CreateAsync(options);
            return session.Url;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Stripe Error: {ex.Message}");
            return null;
        }
    }
}
