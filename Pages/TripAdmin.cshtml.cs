using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages
{
    public class TripAdminModel : PageModel
    {
        private NextStopContext context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<TripAdminModel> _logger;

        public TripAdminModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<TripAdminModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        public IList<Trip> Trips { get; set; } = new List<Trip>();

        public async Task<IActionResult> OnGetAsync()
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!User.IsInRole("Admin"))
            {
                _logger.LogError("TripAdmin page, a non-admin user attempted to access this page");
                return RedirectToPage("/Index");
            }
            Trips = await context.Trips.ToListAsync();

            return Page();
        }
    }
}
