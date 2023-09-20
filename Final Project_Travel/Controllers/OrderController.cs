using DocumentFormat.OpenXml.Office.CustomUI;
using DocumentFormat.OpenXml.Vml.Spreadsheet;
using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Security.Claims;

namespace Final_Project_Travel.Controllers
{
    public class OrderController : Controller
    {
        private readonly ZakherDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public OrderController(ZakherDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;

        }

        public IActionResult CheckOut(int id)
        {
            var tour = _context.Tours.FirstOrDefault(x => x.Id==id);

            CheckOutViewModel Vm = new CheckOutViewModel();
            {
                
                Vm.Order= new OrderCreateViewModel();
                Vm.Item = _generateCheckoutItem(id);
                Vm.TotalAmount = Vm.Item.Price;




                string userId = User.Identity.IsAuthenticated ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;


                if (userId != null)
                {

                    AppUser user = _userManager.FindByIdAsync(userId).Result;
                    Vm.Order.FullName = user.FullName;
                    Vm.Order.Email = user.Email;
                    Vm.Order.Phone =user.PhoneNumber;



                }
                return View(Vm);

            }
        }

        [HttpPost]
        public async Task<IActionResult> Create(OrderCreateViewModel orderVm)
        {
            string userId = (User.Identity.IsAuthenticated && User.IsInRole("Member")) ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            AppUser user = (User.Identity.IsAuthenticated && User.IsInRole("Member")) ? await _userManager.FindByIdAsync(userId) : null;

            if (!ModelState.IsValid)
            {
                CheckOutViewModel vm = new CheckOutViewModel();
                vm.Order = orderVm;
                vm.TotalAmount=vm.Item.Price;
                return View("Checkout", vm);
            }


            Order order = new Order();

            order.FullName=user== null ? orderVm.FullName : user.FullName;
            order.Email=user== null ? orderVm.Email : user.Email;
            order.Phone=user== null ? orderVm.Phone : user.PhoneNumber;
            order.Adress=orderVm.Adress;
            order.CreatedDate=DateTime.UtcNow.AddHours(4);
            order.Status=Enums.OrderStatus.Pending;
            order.Note=orderVm.Note;
            order.AppUserId=user.Id;
            order.OrderItem= new OrderItem()
            {
                TourId=orderVm.TourId,
                UnitSalePrice = orderVm.TotalAmount,
                TourName= orderVm.TourName
                

            };

           

            order.TotalAmount =order.OrderItem.UnitSalePrice;
           
          
            


            _context.Orders.Add(order);
            _context.SaveChanges();

            if (user!= null)
            {
                return RedirectToAction("profile", "account", new { tab = "order" });
            }
            return RedirectToAction("index", "home");
        }

        private OrderItem _generateOrderItem(int id)
        {
            OrderItem orderitem = new OrderItem(); {


                var tour = _context.Tours.Include(x => x.TourImages).FirstOrDefault(x => x.Id==id);

               
                    orderitem =  new OrderItem
                    {
                        TourId=tour.Id,
                        UnitDiscountPrice =tour.DiscountPrice,
                        UnitCostPrice =tour.CostPrice,
                        UnitSalePrice =tour.SalePrice,
                        TourName = tour.Name
                        

                    };
                   
                
               
            }
            return orderitem;
        }


        private CheckOutItemViewModel _generateCheckoutItem(int id)
        {
            var item = _context.Tours.FirstOrDefault(x => x.Id== id);


            var vm = new CheckOutItemViewModel
            {

                Tour=item,
                TourName=item.Name,
                Price=item.DiscountPrice
            };
            return vm;
        }
            
        

        
    }
}
