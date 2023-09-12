using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class ContactUsController : Controller
    {
        private readonly ZakherDbContext _context;

        public ContactUsController(ZakherDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.ContactUs.AsQueryable();

            if (search!=null) query = query.Where(x => x.Subject.Contains(search));
            var vm = PaginatedList<ContactUs>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }
    }
}
