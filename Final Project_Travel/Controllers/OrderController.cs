using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Controllers
{
    public class OrderController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public OrderController(ZakherDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;

        }
    }
}