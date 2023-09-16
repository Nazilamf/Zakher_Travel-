
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Data;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ZakherDbContext _context;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, ZakherDbContext context)
        {
            _userManager= userManager;
            _signInManager=signInManager;
            _roleManager=roleManager;
            _context=context;

        }

        [Authorize(Roles = "SuperAdmin")]
        public IActionResult Admin()
        {
            var Admins = _userManager.Users.Where(x => x.IsAdmin==true).ToList();

            List<AdminUserViewModel> admins = new List< AdminUserViewModel>();
            foreach (var item in Admins)
            {
                AdminUserViewModel vm  = new AdminUserViewModel
                {
                    FullName=item.FullName,
                    UserId=item.Id,
                    UserName=item.UserName,

                };
                admins.Add(vm);
            }
            return View(admins);
        }

        [Authorize(Roles = "SuperAdmin")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "SuperAdmin")]
        public async Task<IActionResult> Create( AdminUserViewModel admin)
        {
            if (!ModelState.IsValid) return View();
            AppUser user = new AppUser
              
                {
                    FullName= admin.FullName,
                    UserName = admin.UserName,
                    IsAdmin = true


                };
            var result = await _userManager.CreateAsync(user, admin.Password);

            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                    ModelState.AddModelError("", item.Description);

                return View();
            }

            await _userManager.AddToRoleAsync(user, "Admin");

            return RedirectToAction("admin");
            }

        public async Task<IActionResult> Delete(string userid)
        {
            AppUser user = await _userManager.FindByIdAsync(userid);

            if (user == null) return StatusCode(404);

            await _userManager.DeleteAsync(user);

            return RedirectToAction("admin");
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
        //        IsAdmin = false



        //    };
        //    var result = await _userManager.CreateAsync(admin, "Admin123");
        //    await _userManager.AddToRoleAsync(admin, "SuperAdmin");

        //    return Content("Created");
        //}


        public IActionResult Login()
        {
            return View();
        }


    

    [HttpPost]
    public async Task<IActionResult> Login(AdminViewModel adminVM, string returnUrl = null)
    {

        AppUser admin = await _userManager.FindByNameAsync(adminVM.UserName);
        if (admin == null)
        {
            ModelState.AddModelError("", "Sifre ve ya username yalnisdir!");
            return View();
        }

        var result = await _signInManager.PasswordSignInAsync(admin, adminVM.Password, false, false);
        if (!result.Succeeded)
        {
            ModelState.AddModelError("", "Sifre ve ya username yalnisdir!");
            return View();
        }
        return returnUrl== null ? RedirectToAction("Index", "Dashboard") : RedirectToAction(returnUrl);
    }




        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("login", "account");
        }
    }

}

