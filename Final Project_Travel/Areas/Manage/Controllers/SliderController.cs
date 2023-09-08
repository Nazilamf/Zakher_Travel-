using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{

    [Area("manage")]
    public class SliderController : Controller
    {

        private readonly ZakherDbContext _context;
        private readonly IWebHostEnvironment _env;

        public SliderController(ZakherDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
       

        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Sliders.AsQueryable();

            if (search!=null) query = query.Where(x => x.Title.Contains(search));
            var vm = PaginatedList<Slider>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Slider slider)
        {
            if (!ModelState.IsValid) return View();

            if (slider.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (slider.ImageFile.ContentType!="image/jpeg" && slider.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            slider.ImageName = FileManager.Save(slider.ImageFile, _env.WebRootPath, "manage/assets/uploads/slider");

            _context.Sliders.Add(slider);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Slider slider = _context.Sliders.Find(id);

            if (slider == null) return View("Error");

            return View(slider);
        }

        [HttpPost]
        public IActionResult Edit(Slider slider)
        {
            if (!ModelState.IsValid) { return View(slider); }

            Slider existSlider = _context.Sliders.Find(slider.Id);

            if (existSlider == null) return View("Error");


            string removableImageName = null;

            if (slider.ImageFile != null)
            {
                if (slider.ImageFile.ContentType != "image/jpeg" && slider.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(slider);
                }

                removableImageName = existSlider.ImageName;
                existSlider.ImageName = FileManager.Save(slider.ImageFile, _env.WebRootPath, "manage/assets/uploads/slider");
            }
            existSlider.Order = slider.Order;
            existSlider.Title = slider.Title;
            existSlider.ButtonText = slider.ButtonText;
            existSlider.ButtonUrl = slider.ButtonUrl;
            existSlider.Desc = slider.Desc;
            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/slider", removableImageName);

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Slider slider = _context.Sliders.Find(id);

            if (slider == null) return StatusCode(404);

            _context.Sliders.Remove(slider);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}

