using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
  
        [Area("manage")]
        public class SettingController : Controller
        {
            private readonly ZakherDbContext _context;

            public SettingController(ZakherDbContext context)
            {
                _context = context;
            }
            public IActionResult Index(int page = 1, string search = null)
            {
                ViewBag.Search = search;


                var query = _context.Settings.AsQueryable();
                if (search!=null) query = query.Where(x => x.Value.Contains(search));
                return View(PaginatedList<Setting>.Create(query, page, 4));
            }

            public IActionResult Create()
            {
                return View();
            }

            [HttpPost]
            public IActionResult Create(Setting setting)
            {
                if (!ModelState.IsValid)
                    return View();

                if (_context.Settings.Any(x => x.Value == setting.Value))
                {
                    ModelState.AddModelError("Value", "Value is already taken");
                    return View();
                }

                _context.Settings.Add(setting);

                _context.SaveChanges();

                return RedirectToAction("index");
            }
            public IActionResult Edit(int id)
            {

                //var existSetting = _context.Settings.FirstOrDefault(x => x.Key == id);

                var existSetting = _context.Settings.FirstOrDefault(x => x.Id== id);

                if (existSetting == null) return View("error");


                return View(existSetting);
            }

            [HttpPost]
            public IActionResult Edit(Setting setting)
            {
                if (!ModelState.IsValid)
                    return View();

                Setting existSetting = _context.Settings.FirstOrDefault(x => x.Key == setting.Key);

                if (existSetting == null) return View("error");


                existSetting.Value = setting.Value;
                _context.SaveChanges();

                return RedirectToAction("index");
            }
        }
}
