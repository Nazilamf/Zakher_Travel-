using Final_Project_Travel.DAL;
using Final_Project_Travel.Email;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Final_Project_Travel.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly ZakherDbContext _context;
        private readonly IMailService _mailService;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, ZakherDbContext context,IMailService mailService)
        {
            _userManager=userManager;
            _signInManager=signInManager;
            _context=context;
            _mailService =mailService;
        }
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(MemberRegisterViewModel memberVM)
        {

            if (!ModelState.IsValid) { return View(); }
            AppUser user = new AppUser()
            {
                FullName= memberVM.FullName,
                Email= memberVM.Email,
                UserName= memberVM.UserName,
                PhoneNumber = memberVM.Phone,
                IsAdmin =false,

            };

            var result = await _userManager.CreateAsync(user, memberVM.Password);
            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                    return View();
                }
            }

            await _userManager.AddToRoleAsync(user, "Member");
            return RedirectToAction("Login");
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(MemberLoginViewModel memberVm, string returnUrl = null)
        {
            if (!ModelState.IsValid) { return View(); }

            AppUser member = await _userManager.FindByNameAsync(memberVm.UserName);

            if (member == null)
            {
                ModelState.AddModelError(" ", "Shifre ve ya username yalnisdir");
                return View();
            }

            var result = await _signInManager.PasswordSignInAsync(member, memberVm.Password, false, false);

            if (!result.Succeeded)
            {
                ModelState.AddModelError(" ", "Shifre ve ya username yalnisdir");
                return View();
            }

            return returnUrl== null ? RedirectToAction("index", "home") : RedirectToAction(returnUrl);
        }

        [Authorize(Roles = "Member")]
        public async Task<IActionResult> Profile(string tab = "profile")
        {
            ViewBag.Tab = tab;
            if (User.Identity.IsAuthenticated)
            {
                AppUser member = await _userManager.FindByNameAsync(User.Identity.Name);

                ProfileViewModel vm = new ProfileViewModel()
                {

                    Member = new MemberUpdateViewModel
                    {
                        FullName= member.FullName,
                        UserName=member.UserName,
                        Email=member.Email,
                        Phone=member.PhoneNumber

                    },



                    Orders= _context.Orders.Include(x => x.OrderItem).Where(x => x.AppUserId == member.Id).ToList()
                };
                return View(vm);


            }


            else return Content("User Logged out");
        }

        public async Task<IActionResult> MemberUpdate(MemberUpdateViewModel memberVM)
        {
            if (!ModelState.IsValid)
            {
                ProfileViewModel vm = new ProfileViewModel() { Member= memberVM };
                return View("profile", vm);

            }
            AppUser member = await _userManager.FindByNameAsync(User.Identity.Name);
            member.FullName= memberVM.FullName;
            member.UserName= memberVM.UserName;
            member.Email= memberVM.Email;
            member.PhoneNumber= memberVM.Phone;

            var result = await _userManager.UpdateAsync(member);

            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                    ModelState.AddModelError("", item.Description);
                ProfileViewModel vm = new ProfileViewModel() { Member= memberVM };
                return View("profile", vm);

            }

            await _signInManager.SignInAsync(member, false);

            return RedirectToAction("profile");


        }



        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("index", "home");
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string email)
        {
            AppUser user = await _userManager.FindByEmailAsync(email);

            if (user == null) return View("error");

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);

            var url = Url.Action("verifytoken", "account", new { email = email, token = token }, Request.Scheme);
            await _mailService.SendEmailAsync(new MailRequest { ToEmail=user.Email,Subject="ResetPassword",Body=$"<a href={url}>Click Here</a>"
            });
            TempData["Message"] = "Please Check Your Email";
            return RedirectToAction("login");
        }

        public async Task<IActionResult> VerifyToken(string email, string token)
        {
            AppUser user = await _userManager.FindByEmailAsync(email);

            if (await _userManager.VerifyUserTokenAsync(user, _userManager.Options.Tokens.PasswordResetTokenProvider, "ResetPassword", token))
            {
                TempData["Email"] = email;
                TempData["Token"] = token;
                return RedirectToAction("ResetPassword");
            }

            return View("error");
        }

        public async Task<IActionResult> ResetPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(ResetPasswordViewModel resetPassword)
        {
            AppUser user = await _userManager.FindByEmailAsync(resetPassword.Email);

            var result = await _userManager.ResetPasswordAsync(user, resetPassword.Token, resetPassword.Password);

            if (!result.Succeeded)
                return View("error");


            return RedirectToAction("login");
        }

    }
}

