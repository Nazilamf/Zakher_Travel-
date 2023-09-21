using DocumentFormat.OpenXml.InkML;
using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace Final_Project_Travel.Controllers
{
    public class TourShopController : Controller
    {
        private readonly ZakherDbContext _context;

        public TourShopController(ZakherDbContext context)
        {
            _context=context;
        }

        
        public IActionResult Index(int ? categoryId = null, List<int> destinationId = null, int? month = null, decimal? minPrice = null, decimal? maxPrice = null, string sort = "A_to_Z")

        {
            var query = _context.Tours.Where(x => x.IsDeleted ==false).Include(x => x.TourImages.Where(x => x.PosterStatus ==true)).Include(x => x.Category).Include(x => x.Destination).AsQueryable();


            TourShopViewModel vm = new TourShopViewModel();
            vm.MaxPrice=query.Max(x => x.DiscountPrice);
            vm.MinPrice=query.Min(x => x.DiscountPrice);

            if (categoryId != null)
            {
                query =query.Where(x => x.CategoryId == categoryId);
            }
            if (destinationId.Count>0)
            {
                query = query.Where(x => destinationId.Contains(x.DestinationId));
            }

            if (month != null)
            {


                query=query.Where(x => x.StartDate.Month == month || x.EndDate.Month == month);
            }



            if (minPrice != null && maxPrice!=null)
            {
                query =query.Where(x => x.SalePrice>=minPrice && x.SalePrice<=maxPrice);
            }

            switch (sort)
            {
                case "Z_to_A":
                    query=query.OrderByDescending(x => x.Name);
                    break;
                case "Low_to_High":
                    query=query.OrderBy(x => x.DiscountPrice);
                    break;
                case "High_to_Low":
                    query=query.OrderByDescending(x => x.DiscountPrice);
                    break;

                default:
                    query = query.OrderBy(x => x.Name);
                    break;
            }
            vm.Tours= query.ToList();
            vm.Categories = _context.Categories.Include(x => x.Tours).ToList();
            vm.Destinations = _context.Destinations.Include(x => x.Tours).ToList();

            vm.Months= _context.Months.ToList();

            
            vm.SelectedCategoryId= categoryId;
            vm.SelectedDestinationId= destinationId;
           
            vm.SelectedMonth = month;
            vm.SelectedMinPrice = minPrice==null ? vm.MinPrice : (decimal)minPrice;
            vm.SelectedMaxPrice =maxPrice==null ? vm.MaxPrice : (decimal)maxPrice;


            vm.SortItems =new List<SelectListItem>
            {
                new SelectListItem("Name(A-Z)","A_to_Z",sort=="A_to_Z"),
                new SelectListItem("Name(Z-A)","Z_to_A",sort=="Z_to_A"),
                new SelectListItem("Price(Low>High)","LowToHigh",sort=="Low_to_High"),
                new SelectListItem("Price(high-Low)","HighToLow",sort=="High_to_Low")

            };

            return View(vm);
        }
    }
}
