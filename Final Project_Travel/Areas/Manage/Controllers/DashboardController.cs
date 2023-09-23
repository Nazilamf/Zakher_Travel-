using DocumentFormat.OpenXml.Drawing;
using DocumentFormat.OpenXml.Spreadsheet;
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Globalization;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    [Area("manage")]
    public class DashboardController : Controller
    {
        private readonly ZakherDbContext _context;

        public DashboardController(ZakherDbContext context)
        {
            _context = context;
            
        }
        public IActionResult Index()
        {
         string month = DateTime.UtcNow.AddMonths(1).ToString("MMMM");
             List<string> labels = new List<string>();
             labels.Add(month);
            DashboardChartsViewModel vm = new DashboardChartsViewModel()
            {
                AcceptedOrderCount=_context.Orders.Where(x => x.Status==Enums.OrderStatus.Accepted).Count(),
                RejectedOrderCount=_context.Orders.Where(x => x.Status==Enums.OrderStatus.Rejected).Count(),
                PendingOrderCount=_context.Orders.Where(x => x.Status==Enums.OrderStatus.Pending).Count(),
                Labels= labels,
                ToursCount =_context.Tours.Count(),
                TotalOrders = _context.Orders.Count(),
                TotalProfit = _context.Tours.Sum(x => x.SalePrice),
                AverageTourPrice =(int)Math.Round(_context.Tours.Average(x => x.SalePrice)), 
        };
            return View(vm);
        }
    }
}
