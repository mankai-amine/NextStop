using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages
{
    public class ResultsModel : PageModel
    {
        private readonly NextStopContext context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<ResultsModel> _logger;

        public ResultsModel(NextStopContext context, UserManager<IdentityUser> userManager, ILogger<ResultsModel> logger)
        {
            this.context = context;
            _userManager = userManager;
            _logger = logger;
        }

        [BindProperty, Display(Name = "Origin")]
        public string NewOrigin {get; set; }

        [BindProperty, Display(Name = "Destination")]
        public string NewDestination {get; set; }

        [BindProperty, Display(Name = "Weekday of Trip")]
        public DayOfWeek? NewDepartureDay {get; set; }

        public IList<Trip> Trips {get; set; } = new List<Trip>();

        public async Task<IActionResult> OnGetAsync(string? origin = null,
                                                    string? destination = null,
                                                    DayOfWeek? day = null)
        {
            var curUser = await _userManager.GetUserAsync(User);
            if (curUser == null) {
                    return RedirectToPage("/Account/Login", new {area = "Identity" });
                }
            
            var query = context.Trips.AsQueryable();

            if (!string.IsNullOrEmpty(origin))
            {
                query = query.Where(t => t.Origin.Contains(origin));
            }

            if (!string.IsNullOrEmpty(destination))
            {
                query = query.Where(t => t.Destination.Contains(destination));
            }

            if (day.HasValue)
            {
                query = query.Where(t => t.DepartureDay == day.Value);
            }

            Trips = await query.ToListAsync();
            return Page();
        }
    }
}
