using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
   
        [Area("manage")]
        public class AdvantageController : Controller
        {
            private readonly ZakherDbContext _context;
            private readonly IWebHostEnvironment _env;

            public AdvantageController(ZakherDbContext context, IWebHostEnvironment env)
            {
                _context = context;
                _env = env;
            }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Advantages.AsQueryable();

            if (search!=null) query = query.Where(x => x.Title.Contains(search));
            var vm = PaginatedList<Advantage>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }

        public IActionResult Create()
            {
                return View();
            }

            [HttpPost]
            public IActionResult Create(Advantage advantage)
            {
                if (!ModelState.IsValid) return View();

                if (advantage.ImageFile == null)
                {
                    ModelState.AddModelError("ImageFile", "ImageFile is required");
                    return View();
                }

                if (advantage.ImageFile.ContentType!="image/jpeg" && advantage.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View();
                }

                advantage.Icon = FileManager.Save(advantage.ImageFile, _env.WebRootPath, "manage/assets/uploads/icon");

                _context.Advantages.Add(advantage);
                _context.SaveChanges();

                return RedirectToAction("index");
            }

            public IActionResult Edit(int id)
            {
                Advantage advantage = _context.Advantages.Find(id);

                if (advantage == null) return View("Error");

                return View(advantage);
            }

            [HttpPost]
            public IActionResult Edit(Advantage advantage)
            {
                if (!ModelState.IsValid) { return View(advantage); }

                Advantage existAdvantage = _context.Advantages.Find(advantage.Id);

                if (existAdvantage == null) return View("Error");


                string removableImageName = null;

                if (advantage.ImageFile != null)
                {
                    if (advantage.ImageFile.ContentType != "image/jpeg" && advantage.ImageFile.ContentType != "image/png")
                    {
                        ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                        return View(advantage);
                    }

                    removableImageName = existAdvantage.Icon;
                    existAdvantage.Icon = FileManager.Save(advantage.ImageFile, _env.WebRootPath, "manage/assets/uploads/icon");
                }
                existAdvantage.Title = advantage.Title;
                existAdvantage.Desc = advantage.Desc;

                _context.SaveChanges();

                if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/icon", removableImageName);

                return RedirectToAction("index");
            }


            public IActionResult Delete(int id)
            {
                Advantage advantage = _context.Advantages.Find(id);

                if (advantage == null) return StatusCode(404);

                _context.Advantages.Remove(advantage);
                _context.SaveChanges();

                return RedirectToAction("index");
            }
        }
}
