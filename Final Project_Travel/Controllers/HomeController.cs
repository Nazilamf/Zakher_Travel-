using DocumentFormat.OpenXml.Spreadsheet;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace Final_Project_Travel.Controllers
{
    public class HomeController : Controller
    {

        private readonly ZakherDbContext _context;

        public HomeController(ZakherDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            HomeViewModel vm = new HomeViewModel
            {
                Sliders = _context.Sliders.OrderBy(x => x.Order).ToList(),
                Destinations = _context.Destinations.ToList(),
                PopularTours = _context.Tours.Include(x => x.TourImages).Where(x => x.Rate>4).ToList(),
                Advantages = _context.Advantages.ToList(),
                DiscountTours = _context.Tours.Include(x => x.TourImages).Where(x => x.DiscountPrice>0).ToList(),
                Reviews=_context.TourReviews.Include(x => x.Tour).ThenInclude(x => x.TourImages).Include(x => x.AppUser).Where(x => x.Rate>3).Take(3).ToList(),
                Categories = _context.Categories.ToList(),
                WishlistItems = _context.WishlistItems.Include(x => x.Tour).ThenInclude(x => x.TourImages.Where(x => x.PosterStatus==true)).ToList(),

        };
            return View(vm);
        }
    }
}