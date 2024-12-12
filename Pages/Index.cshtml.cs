using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
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

    [BindProperty, Required, Display(Name = "Origin")]
    [StringLength(40, MinimumLength = 1, ErrorMessage = "Please enter an origin that does not exceed 40 characters.")]
    public string NewOrigin {get; set; }

    [BindProperty, Required, Display(Name = "Destination")]
    [StringLength(40, MinimumLength = 1, ErrorMessage = "Please enter a destination that does not exceed 40 characters.")]
    public string NewDestination {get; set; }

    [BindProperty, Required, Display(Name = "Weekday of Trip")]
    public DayOfWeek? NewDepartureDay {get; set; }

    public async Task<IActionResult> OnGetAsync()
    {
        var curUser = await _userManager.GetUserAsync(User);
        if (curUser == null) {
                return RedirectToPage("/Account/Login", new {area = "Identity" });
            }

        return Page();
    }

}
