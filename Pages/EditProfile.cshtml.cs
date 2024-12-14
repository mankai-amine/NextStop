using System.ComponentModel.DataAnnotations;
using NextStop.Data;
using NextStop.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;

namespace NextStop.Pages
{
    [Authorize]
    public class EditProfileModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public EditProfileModel(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        [BindProperty(SupportsGet = true)]
        public int Id { get; set; }

        [BindProperty]
        public ApplicationUser User { get; set; }

        [TempData]
        public string Confirmation { get; set; }
         
        public async Task<IActionResult> OnGetAsync(string Id)
        {
            if (string.IsNullOrEmpty(Id))
            {
                return NotFound("User ID is missing.");
            }

            User = await _userManager.FindByIdAsync(Id);

            if (User == null)
            {
                return NotFound("User not found.");
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync(string id)
        {
            /*if (!ModelState.IsValid)
            {
                return Page();
            }*/

            var userToUpdate = await _userManager.FindByIdAsync(id);

            if (userToUpdate == null)
            {
                return NotFound("User not found.");
            }

            // Update specific fields
            userToUpdate.Name = User.Name;
            userToUpdate.Email = User.Email;
            userToUpdate.ProfilePic = User.ProfilePic;

            // Update the user using UserManager
            var result = await _userManager.UpdateAsync(userToUpdate);

            if (!result.Succeeded)
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }

                return Page();
            }

            TempData["Confirmation"] = "Profile edited successfully";
            return RedirectToPage("/Index");
        }

        /*[BindProperty(SupportsGet = true)]
        public int Id { get; set; }

        [BindProperty]
        public ApplicationUser User { get; set;}

        [TempData]
        public string Confirmation { get; set;}

        
        public async Task OnGetAsync() =>  
            User = await context.Todos.FindAsync(Id);

        public async Task<IActionResult> OnPostAsync()
        {
            var TodoToUpdate = await context.Users.FindAsync(Id);
            TodoToUpdate.Task = Todo.Task;  
            TodoToUpdate.DueDate = Todo.DueDate;
            TodoToUpdate.IsDone = Todo.IsDone;
            await context.SaveChangesAsync();
            TempData["Confirmation"] = "Profile edited successfully";
            return RedirectToPage("/Index");
        }*/
    }
}