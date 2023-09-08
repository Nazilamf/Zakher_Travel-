using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
        [Area("manage")]
        public class WorkerController : Controller
        {
            private readonly ZakherDbContext _context;
            private readonly IWebHostEnvironment _env;

            public WorkerController(ZakherDbContext context, IWebHostEnvironment env)
            {
                _context = context;
                _env = env;
            }
            public IActionResult Index(int page = 1, string search = null)
            {
                ViewBag.Search = search;

                var query = _context.Workers.AsQueryable();

                if (search!=null) query = query.Where(x => x.FullName.Contains(search));
                var vm = PaginatedList<Worker>.Create(query, page, 4);
                if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

                return View(vm);

            }

            public IActionResult Create()
            {
                return View();
            }

            [HttpPost]
            public IActionResult Create(Worker worker)
            {
                if (!ModelState.IsValid) return View();

                if (worker.ImageFile == null)
                {
                    ModelState.AddModelError("ImageFile", "ImageFile is required");
                    return View();
                }

                if (worker.ImageFile.ContentType!="image/jpeg" && worker.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View();
                }

                worker.ImageName = FileManager.Save(worker.ImageFile, _env.WebRootPath, "manage/assets/uploads/workers");

                _context.Workers.Add(worker);
                _context.SaveChanges();

                return RedirectToAction("index");
            }

            public IActionResult Edit(int id)
            {
                Worker worker = _context.Workers.Find(id);

                if (worker == null) return View("Error");

                return View(worker);
            }

            [HttpPost]
            public IActionResult Edit(Worker worker)
            {
                if (!ModelState.IsValid) { return View(worker); }

                Worker existWorker = _context.Workers.Find(worker.Id);

                if (existWorker == null) return View("Error");


                string removableImageName = null;

                if (worker.ImageFile != null)
                {
                    if (worker.ImageFile.ContentType != "image/jpeg" && worker.ImageFile.ContentType != "image/png")
                    {
                        ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                        return View(worker);
                    }

                    removableImageName = existWorker.ImageName;
                    existWorker.ImageName = FileManager.Save(worker.ImageFile, _env.WebRootPath, "manage/assets/uploads/workers");
                }
                existWorker.FullName = worker.FullName;
                existWorker.Position = worker.Position;

                _context.SaveChanges();

                if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/workers", removableImageName);

                return RedirectToAction("index");
            }


            public IActionResult Delete(int id)
            {
                Worker worker = _context.Workers.Find(id);

                if (worker == null) return StatusCode(404);

                _context.Workers.Remove(worker);
                _context.SaveChanges();

                return RedirectToAction("index");
            }
        }
    }

