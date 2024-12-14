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

        public Trip Trip;
        public DateTime DateOfTravel { get; set; }
        public int NumberOfPassengers { get; set; }
        public bool OrderButtonActive { get; set; } = false;

        public async Task<IActionResult> OnGetAsync(int? tripId, DateTime? date, int? numPassengers)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }
            if (!tripId.HasValue || !date.HasValue || !numPassengers.HasValue) {
                RedirectToPage("/Index");
                // DOESNT WORK PROPERLY
                // TODO Error message
            }
            Trip = await context.Trips
                .Include(t => t.Bus)
                .FirstOrDefaultAsync(t => t.Id == tripId);

            DateTime day = (DateTime) date;
            day = day.Date;
            DateOfTravel = day;

            int capacity = Trip.Bus.Capacity;

            int numCurrentPassengers = context.Orders
                .Where(o => o.Trip.Id == tripId && o.DateOfTravel.Date == day)
                .Select(o => o.NumOfPassengers)
                .DefaultIfEmpty()
                .Sum();

            if ((capacity - numCurrentPassengers) > numPassengers)
            {
                OrderButtonActive = true;
            }
            
            return Page();
        }
    }
}
