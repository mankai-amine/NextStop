using Microsoft.AspNetCore.Identity; 

namespace NextStop.Models
{
    /*public enum UserRole
    {
        Customer,
        Driver,
        Admin
    }*/

    public class ApplicationUser : IdentityUser
    {
        public string? ProfilePic { get; set; } = null;
        public string? Name { get; set; } = null;
        //public UserRole Role { get; set; } 
    }
}