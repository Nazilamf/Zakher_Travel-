using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class ReviewController : Controller
    {
        private readonly ZakherDbContext _context;

        public ReviewController(ZakherDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.TourReviews.AsQueryable();

            if (search!=null) query = query.Where(x => x.Text.Contains(search));
            var vm = PaginatedList<TourReview>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }

        public IActionResult Delete(int id)
        {
            TourReview review = _context.TourReviews.Find(id);

            if (review == null) return StatusCode(404);

            if (_context.TourReviews.Any(x => x.Id == id)) return StatusCode(400);

            _context.TourReviews.Remove(review);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
