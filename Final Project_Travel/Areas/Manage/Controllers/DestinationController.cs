using ClosedXML.Excel;
using DocumentFormat.OpenXml.Drawing.Charts;
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class DestinationController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly IWebHostEnvironment _env;

        public DestinationController(ZakherDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Destinations.Include(x => x.Tours).AsQueryable();

            if (search!=null) query = query.Where(x => x.Name.Contains(search));
            var vm = PaginatedList<Destination>.Create(query, page, 4);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);

        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Destination destination)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Destinations.Any(x => x.Name == destination.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }

            if (destination.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (destination.ImageFile.ContentType!="image/jpeg" && destination.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            destination.ImageName = FileManager.Save(destination.ImageFile, _env.WebRootPath, "manage/assets/uploads/destination");

            _context.Destinations.Add(destination);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Destination destination = _context.Destinations.Find(id);

            if (destination == null) return View("Error");

            return View(destination);
        }

        [HttpPost]
        public IActionResult Edit(Destination destination)
        {
            if (!ModelState.IsValid) { return View(destination); }

            Destination existDestination= _context.Destinations.Find(destination.Id);

            if (existDestination == null) return View("Error");


            string removableImageName = null;

            if (destination.ImageFile != null)
            {
                if (destination.ImageFile.ContentType != "image/jpeg" && destination.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(destination);
                }

                removableImageName = existDestination.ImageName;
                existDestination.ImageName = FileManager.Save(destination.ImageFile, _env.WebRootPath, "manage/assets/uploads/destination");
            }
            existDestination.ImageName = destination.ImageName;
          

            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/destination", removableImageName);

            return RedirectToAction("index");
        }


        public IActionResult Delete(int id)
        {
            Destination destination = _context.Destinations.Find(id);

            if (destination == null) return StatusCode(404);

            _context.Destinations.Remove(destination);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        [HttpGet]
        public async Task<FileResult> ExportExcel()
        {
            var report = await _context.Destinations.ToListAsync();
            var fileName = "report.xlsx";
            return GenerateExcel(fileName, report);
        }

        private FileResult GenerateExcel(string filename, IEnumerable<Destination> destinations)
        {
            System.Data.DataTable dataTable = new System.Data.DataTable("Destinations");
            dataTable.Columns.AddRange(new DataColumn[]
             {
                 new DataColumn("Id"),
                 new DataColumn("Name")
            });

            foreach (var item in destinations)
            {
                dataTable.Rows.Add(item.Id, item.Name);
            }

            using (XLWorkbook wb = new XLWorkbook()) 
            {
                wb.Worksheets.Add(dataTable);
                using (MemoryStream stream= new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(),
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", filename);
                }
            }
        }
    }
}
