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

        public TripInfoModel(NextStopContext context, UserManager<ApplicationUser> userManager, ILogger<TripInfoModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        [BindProperty(SupportsGet = true)]
        public int Id { get; set; }

        public Trip Trip;
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (id == null) {
                RedirectToPage("/Index");
                // TODO Error message
            }
            Trip = await context.Trips.FirstOrDefaultAsync(a => a.Id == Id);
            // TODO set variable for allowing order button activation
            return Page();
        }
    }
}
