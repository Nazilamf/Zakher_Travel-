using ClosedXML.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Email;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Security.Policy;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class OrderController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly IMailService _mailService;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;


        public OrderController(ZakherDbContext context, IMailService mailService, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _context = context;
            _mailService=mailService;
            _userManager=userManager;
            _signInManager=signInManager;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.Orders.Include(x => x.OrderItem).AsQueryable();


            return View(PaginatedList<Order>.Create(query, page, 4));
        }

        public IActionResult Edit(int id)
        {
            Order order = _context.Orders.Include(x => x.OrderItem).ThenInclude(x => x.Tours).FirstOrDefault(x => x.Id == id);

            if (order == null) return View("error");

            return View(order);
        }

        public async Task<IActionResult >Accept(int id)
        {
            
            Order order = _context.Orders.Find(id);
              
            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Accepted;
            
          
            
                await _mailService.SendEmailAsync(new MailRequest
                {
                    ToEmail=order.Email,
                    Subject="TourBooking",
                    Body=$"<h2>Sizin{order.OrderItem.TourName} adli Tur rezervasiyanız qebul olundu <h2>"
                });

            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Reject(int id)
        {
            Order order = _context.Orders.Find(id);

            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Rejected;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<FileResult> ExportExcel()
        {
            var report = await _context.Orders.Include(x=>x.OrderItem).ThenInclude(x=>x.Tours).ToListAsync();
            var fileName = "report.xlsx";
            return GenerateExcel(fileName, report);
        }

        private FileResult GenerateExcel(string filename, IEnumerable<Order> Orders)
        {
            System.Data.DataTable dataTable = new System.Data.DataTable("Orders");
            dataTable.Columns.AddRange(new DataColumn[]
             {
                 new DataColumn("Id"),
                 new DataColumn("AppUserFullNameme"),
                 new DataColumn("TourName"),
                 new DataColumn("CreatedDate"),
                 new DataColumn("Status")
            });

            foreach (var item in Orders)
            {
                dataTable.Rows.Add(item.Id, item.FullName,item.OrderItem.TourName,item.CreatedDate,item.Status);
            }

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dataTable);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(),
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", filename);
                }
            }
        }

    }
}