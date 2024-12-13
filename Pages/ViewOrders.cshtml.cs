using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NextStop.Data;
using NextStop.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;


namespace NextStop.Pages;

[Authorize]
public class ViewOrdersModel : PageModel
{
    private readonly NextStopContext context;
    private readonly UserManager<ApplicationUser> userManager;

    public ViewOrdersModel (NextStopContext context, UserManager<ApplicationUser> userManager)
    {
        this.context = context;
        this.userManager = userManager;
    }
    
    public List<Order> Orders { get; set; } = new ();
    
    public async Task<IActionResult> OnGetAsync()
    {
        var user = await userManager.GetUserAsync(User);
        if (user == null)
        {
            return RedirectToPage("/Account/Login");
        }
        Orders = await context.Orders
        .Where(o => o.Customer.UserName == user.UserName) 
        .Include(o => o.Trip) 
        .ToListAsync();

        return Page();
    }
        
}
