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
                PopularTours = _context.Tours.Include(x=>x.TourImages.Where(x=>x.PosterStatus==true)).Where(x=>x.Rate>4).ToList(),
                

            };
            return View(vm);
        }
    }
}