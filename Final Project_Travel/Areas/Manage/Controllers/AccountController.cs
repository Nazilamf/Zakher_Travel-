using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager)
        {
            _userManager= userManager;
            _signInManager=signInManager;
            _roleManager=roleManager;
        }

        //public async Task<IActionResult>CreateRoles()
        //{
        //    await _roleManager.CreateAsync(new IdentityRole("SuperAdmin"));

        //    await _roleManager.CreateAsync(new IdentityRole("Admin"));

        //    await _roleManager.CreateAsync(new IdentityRole("Member"));

        //    return Content("Created");
        //}


        //public async Task<IActionResult> CreateAdmin()
        //{
        //    AppUser admin = new AppUser
        //    {
        //        FullName= "SuperAdmin",
        //        UserName = "SuperAdmin",

        //    };
        //    var result = await _userManager.CreateAsync(admin, "Admin123");
        //    await _userManager.AddToRoleAsync(admin, "SuperAdmin");

        //    return Content("Created");
        //}




    }
}
