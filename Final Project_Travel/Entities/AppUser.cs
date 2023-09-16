using Microsoft.AspNetCore.Identity;

namespace Final_Project_Travel.Entities
{
    public class AppUser:IdentityUser
    {
        public string FullName { get; set; }
        public bool IsAdmin { get; set; }   
    }
}
