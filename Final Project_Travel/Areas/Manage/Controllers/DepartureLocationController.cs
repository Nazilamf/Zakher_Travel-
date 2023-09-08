using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
   
        [Area("manage")]
        public class DepartureLocationController : Controller
        {
            private readonly ZakherDbContext _context;

            public DepartureLocationController(ZakherDbContext context)
            {
                _context = context;
            }
            public IActionResult Index(int page = 1, string search = null)
            {
                ViewBag.Search = search;

                var query = _context.DepartureLocations.Include(x => x.Tours).AsQueryable();

                if (search!=null) query = query.Where(x => x.Name.Contains(search));
                var vm = PaginatedList<DepartureLocation>.Create(query, page, 4);
                if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

                return View(vm);

            }


            public IActionResult Create()
            {
                return View();
            }

            [HttpPost]
            public IActionResult Create(DepartureLocation departureLocation)
            {
                if (!ModelState.IsValid)
                    return View();

                if (_context.DepartureLocations.Any(x => x.Name == departureLocation.Name))
                {
                    ModelState.AddModelError("Name", "Name is already taken");
                    return View();
                }

                _context.DepartureLocations.Add(departureLocation);

                _context.SaveChanges();

                return RedirectToAction("index");
            }

            public IActionResult Edit(int id)
            {
                DepartureLocation departureLocation = _context.DepartureLocations.FirstOrDefault(x => x.Id == id);

                if (departureLocation == null) return View("error");


                return View(departureLocation);
            }

            [HttpPost]
            public IActionResult Edit(DepartureLocation departureLocation)
            {
                if (!ModelState.IsValid)
                    return View();

                DepartureLocation existDepartureLocation = _context.DepartureLocations.FirstOrDefault(x => x.Id == departureLocation.Id);

                if (existDepartureLocation == null) return View("error");

                if (departureLocation.Name!=existDepartureLocation.Name &&  _context.DepartureLocations.Any(x => x.Name==departureLocation.Name))
                {
                    ModelState.AddModelError("Name", "Name is already taken");
                    return View();
                }


                existDepartureLocation.Name = departureLocation.Name;
                _context.SaveChanges();

                return RedirectToAction("index");
            }

            public IActionResult Delete(int id)
            {
                DepartureLocation departureLocation = _context.DepartureLocations.Find(id);

                if (departureLocation == null) return StatusCode(404);

                if (_context.Tours.Any(x => x.DepartureLocationId == id)) return StatusCode(400);

                _context.DepartureLocations.Remove(departureLocation);
                _context.SaveChanges();

                return RedirectToAction("index");
            }
        }
}
