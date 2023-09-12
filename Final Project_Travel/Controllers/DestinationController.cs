using Final_Project_Travel.DAL;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Final_Project_Travel.Controllers
{
    public class DestinationController : Controller
    {
        private readonly ZakherDbContext _context;
        public DestinationController(ZakherDbContext context)

        {
            _context = context;
        }
        public IActionResult Index()
        {
            DestinationViewModel vm = new DestinationViewModel
            {

                Destinations = _context.Destinations.Include(x=>x.Tours).ToList(),

            };

            return View(vm);
        }
    }
}
