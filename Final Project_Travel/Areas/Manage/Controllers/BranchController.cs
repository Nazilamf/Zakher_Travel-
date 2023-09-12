using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class BranchController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly IWebHostEnvironment _env;

        public BranchController(ZakherDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Branches.AsQueryable();

            if (search!=null) query = query.Where(x => x.Name.Contains(search));
            var vm = PaginatedList<Branch>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Branch branch)
        {
            if (!ModelState.IsValid) return View();

            if (branch.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (branch.ImageFile.ContentType!="image/jpeg" && branch.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            branch.ImageName = FileManager.Save(branch.ImageFile, _env.WebRootPath, "manage/assets/uploads/branches");

            _context.Branches.Add(branch);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Branch branch = _context.Branches.Find(id);

            if (branch == null) return View("Error");

            return View(branch);
        }

        [HttpPost]
        public IActionResult Edit(Branch branch)
        {
            if (!ModelState.IsValid) { return View(branch); }

            Branch existBranch = _context.Branches.Find(branch.Id);

            if (existBranch == null) return View("Error");


            string removableImageName = null;

            if (branch.ImageFile != null)
            {
                if (branch.ImageFile.ContentType != "image/jpeg" && branch.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(branch);
                }

                removableImageName = existBranch.ImageName;
                existBranch.ImageName = FileManager.Save(branch.ImageFile, _env.WebRootPath, "manage/assets/uploads/branches");
            }
            existBranch.Name = branch.Name;

            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/branches", removableImageName);

            return RedirectToAction("index");
        }


        public IActionResult Delete(int id)
        {
            Branch branch = _context.Branches.Find(id);

            if (branch == null) return StatusCode(404);

            _context.Branches.Remove(branch);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
