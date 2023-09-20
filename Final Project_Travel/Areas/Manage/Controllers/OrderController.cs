using DocumentFormat.OpenXml.Spreadsheet;
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Email;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Policy;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class OrderController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly IMailService _mailService;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;


        public OrderController(ZakherDbContext context, IMailService mailService, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _context = context;
            _mailService=mailService;
            _userManager=userManager;
            _signInManager=signInManager;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.Orders.Include(x => x.OrderItem).AsQueryable();


            return View(PaginatedList<Order>.Create(query, page, 4));
        }

        public IActionResult Edit(int id)
        {
            Order order = _context.Orders.Include(x => x.OrderItem).ThenInclude(x => x.Tours).FirstOrDefault(x => x.Id == id);

            if (order == null) return View("error");

            return View(order);
        }

        public async Task<IActionResult >Accept(int id,string email)
        {
            AppUser user = await _userManager.FindByEmailAsync(email);

            if (user == null) return View("error");

            Order order = _context.Orders.Find(id);
              
            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Accepted;
            
          
            
                await _mailService.SendEmailAsync(new MailRequest
                {
                    ToEmail=order.Email,
                    Subject="TourBooking",
                    Body=$"<h2>Sizin{order.OrderItem.TourName} adli Tur rezervasiyanız qebul olundu <h2>"
                });

            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Reject(int id)
        {
            Order order = _context.Orders.Find(id);

            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Rejected;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}