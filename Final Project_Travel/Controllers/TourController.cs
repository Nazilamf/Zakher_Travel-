using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Final_Project_Travel.Controllers
{
    public class TourController : Controller
    {
        private readonly ZakherDbContext _context;

        public TourController(ZakherDbContext context)
        {
            _context = context;
        }

        public IActionResult GetDetail(int id)
        {

            Tour tour = _context.Tours.Include(x => x.Category).Include(x => x.Destination).Include(x => x.DepartureLocation).Include(x => x.TourImages).FirstOrDefault(x => x.Id==id);
            
            return PartialView("_TourModalPartial", tour);
        }
    }
}
