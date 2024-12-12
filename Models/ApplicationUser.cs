using Microsoft.AspNetCore.Identity; 

namespace NextStop.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string? ProfilePic { get; set; } = null;
        public string? Name { get; set; } = null;
    }
}