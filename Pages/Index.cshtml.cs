using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;

namespace NextStop.Pages;

public class IndexModel : PageModel
{
    private NextStopContext context;
    private readonly UserManager<IdentityUser> _userManager;
    private readonly ILogger<IndexModel> _logger;

    public IndexModel(NextStopContext context, UserManager<IdentityUser> userManager, ILogger<IndexModel> logger)
    {
        this.context = context;
        _userManager = userManager;
        _logger = logger;
    }

    public bool SearchWasRequested {get; private set; }

    [BindProperty, Display(Name = "Origin")]
    public string NewOrigin {get; set; }

    [BindProperty, Display(Name = "Destination")]
    public string NewDestination {get; set; }

    [BindProperty, Display(Name = "Weekday of Trip")]
    public DayOfWeek? NewDepartureDay {get; set; }

    public IList<Trip> Trips {get; set; } = new List<Trip>();

    public async Task<IActionResult> OnGetAsync(string? origin,
                                                string? destination,
                                                DayOfWeek? day)
    {
        var curUser = await _userManager.GetUserAsync(User);
        if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }

        SearchWasRequested = Request.QueryString.Value?.Length > 1;

        if (SearchWasRequested)
        {
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
        }

        return Page();
    }

}
