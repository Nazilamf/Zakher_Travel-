using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
   
    [Area("manage")]
    public class TourController : Controller
    {

        private readonly ZakherDbContext _context;
        private readonly IWebHostEnvironment _env;

        public TourController(ZakherDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            var query = _context.Tours.Include(x => x.Category).Include(x => x.Destination).Include(x => x.DepartureLocation).Include(x => x.TourImages).Where(x => !x.IsDeleted);

            if (search!=null) query = query.Where(x => x.Name.Contains(search));
            var vm = PaginatedList<Tour>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(PaginatedList<Tour>.Create(query, page, 4));
        }

        public IActionResult Create()
        {
            ViewBag.Categories = _context.Categories.ToList();
            ViewBag.Destinations = _context.Destinations.ToList();
            ViewBag.DepartureLocations = _context.DepartureLocations.ToList();


            return View();
        }

        [HttpPost]
        public IActionResult Create(Tour tour)
        {
            if (tour.PosterFile == null)
                ModelState.AddModelError("PosterFile", "PosterFile is required");



            if (!ModelState.IsValid)
            {
                ViewBag.Categories = _context.Categories.ToList();
                ViewBag.Destinations = _context.Destinations.ToList();
                ViewBag.DepartureLocations = _context.DepartureLocations.ToList();
                return View();
            }

            if (!_context.Categories.Any(x => x.Id == tour.CategoryId))
                return View("error");

            if (!_context.Destinations.Any(x => x.Id == tour.DestinationId))
                return View("error");

            if (!_context.DepartureLocations.Any(x => x.Id == tour.DepartureLocationId))
                return View("error");

            TourImage poster = new TourImage
            {
                PosterStatus = true,
                ImageName = FileManager.Save(tour.PosterFile, _env.WebRootPath, "manage/assets/uploads/tours"),
            };
            tour.TourImages.Add(poster);




            foreach (var file in tour.ImageFiles)
            {
                TourImage tourImage = new TourImage
                {
                    PosterStatus = false,
                    ImageName = FileManager.Save(file, _env.WebRootPath, "manage/assets/uploads/tours"),
                };
                tour.TourImages.Add(tourImage);
            }

            

            _context.Tours.Add(tour);

            _context.SaveChanges();

            return RedirectToAction("index");
        }


        public IActionResult Edit(int id)
        {


            Tour tour = _context.Tours.Include(x => x.TourImages).FirstOrDefault(x => x.Id == id);

            if (tour == null) return View("error");

            ViewBag.Categories = _context.Categories.ToList();
            ViewBag.Destinations = _context.Destinations.ToList();
            ViewBag.DepartureLocations = _context.DepartureLocations.ToList();

            return View(tour);
        }

        [HttpPost]
        public IActionResult Edit(Tour tour)
        {
            Tour existTour = _context.Tours.Include(x => x.TourImages).FirstOrDefault(x => x.Id == tour.Id);
            if (existTour == null) return View("Error");

            if (!_context.Categories.Any(x => x.Id == tour.CategoryId))
                return View("error");

            if (!_context.Destinations.Any(x => x.Id == tour.DestinationId))
                return View("error");

            if (!_context.DepartureLocations.Any(x => x.Id == tour.DepartureLocationId))
                return View("error");


            existTour.Name = tour.Name;
            existTour.Code = tour.Code;
            existTour.Desc = tour.Desc;
            existTour.CategoryId = tour.CategoryId; 
            existTour.DestinationId = tour.DestinationId;
            existTour.DepartureLocationId = tour.DepartureLocationId;
            existTour.SalePrice = tour.SalePrice;
            existTour.CostPrice = tour.CostPrice;
            existTour.DiscountPrice =tour.DiscountPrice;
            existTour.StartDate= tour.StartDate;
            existTour.EndDate= tour.EndDate;    
            existTour.Rate= tour.Rate;
            existTour.PersonCount= tour.PersonCount;
            existTour.Transfer = tour.Transfer; 
            existTour.Insurance= tour.Insurance;

            List<string> removableImageNames = new List<string>();

            if (tour.PosterFile != null)
            {
                TourImage poster = existTour.TourImages.FirstOrDefault(x => x.PosterStatus == true);
                removableImageNames.Add(poster.ImageName);
                poster.ImageName = FileManager.Save(tour.PosterFile, _env.WebRootPath, "manage/assets/uploads/tours");
            }


            var removableImages = existTour.TourImages.FindAll(x => x.PosterStatus==null && !tour.TourImageIds.Contains(x.Id));
            _context.TourImages.RemoveRange(removableImages);

            removableImageNames.AddRange(removableImages.Select(x => x.ImageName).ToList());


            foreach (var file in tour.ImageFiles)
            {
                TourImage image = new TourImage
                {
                    PosterStatus = false,
                    ImageName = FileManager.Save(file, _env.WebRootPath, "manage/assets/uploads/tours")
                };

                existTour.TourImages.Add(image);
            }

            _context.SaveChanges();
            FileManager.DeleteAll(_env.WebRootPath, "manage/assets/uploads/tours", removableImageNames);


            return RedirectToAction("index");
        }


        public IActionResult Delete(int id)
        {
            Tour tour = _context.Tours.Find(id);

            if (tour == null) return NotFound();

            tour.IsDeleted = true;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

    }
}
