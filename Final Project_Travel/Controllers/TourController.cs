using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data;
using System.Security.Claims;

namespace Final_Project_Travel.Controllers
{
    public class TourController : Controller
    {
        private readonly ZakherDbContext _context;

        public TourController(ZakherDbContext context)
        {
            _context = context;
        }

        public IActionResult GetDetail(int id)
        {

            Tour tour = _context.Tours.Include(x => x.Category).Include(x => x.Destination).Include(x => x.DepartureLocation).Include(x => x.TourImages).FirstOrDefault(x => x.Id==id);

            return PartialView("_TourModalPartial", tour);
        }

        public IActionResult AddToWishlist(int id)
        {
            WishlistViewModel wishlistVM = new WishlistViewModel();
            if (User.Identity.IsAuthenticated)
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var wishlistitems = _context.WishlistItems.Where(x => x.AppUserId ==userId);

                var wishlistitem = wishlistitems.FirstOrDefault(x => x.TourId==id);
                if (wishlistitem ==null)
                {
                    wishlistitem = new WishlistItem
                    {
                        TourId = id,
                        AppUserId =userId

                    };
                    _context.WishlistItems.Add(wishlistitem);
                }
                else
                {
                    _context.WishlistItems.Remove(wishlistitem);
                }


                _context.SaveChanges();

                var items = _context.WishlistItems.Include(x => x.Tour).ThenInclude(x => x.TourImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId ==userId);
                foreach (var wishlist in items)
                {
                    WishlistItemViewModel item = new WishlistItemViewModel()
                    {
                        Tour = wishlist.Tour,
                    };

                    wishlistVM.Items.Add(item);


                }
            }
            else
            {
                var wishliststr = Request.Cookies["wishlist"];
                List<WishlistCookieItemViewModel> cookieitems = null;
                if (wishliststr== null)
                {

                    cookieitems = new List<WishlistCookieItemViewModel>();
                }
                else
                {
                    cookieitems= JsonConvert.DeserializeObject<List<WishlistCookieItemViewModel>>(wishliststr);

                }

                WishlistCookieItemViewModel cookieitem = cookieitems.FirstOrDefault(x => x.TourId== id);
                if (cookieitem==null)
                {
                    cookieitem = new WishlistCookieItemViewModel()
                    {
                        TourId= id,
                    };
                    cookieitems.Add(cookieitem);
                }
                else
                {
                    cookieitems.Remove(cookieitem);
                }


                HttpContext.Response.Cookies.Append("wishlist", JsonConvert.SerializeObject(cookieitems));


                foreach (var ci in cookieitems)
                {
                    WishlistItemViewModel wishlistItem = new WishlistItemViewModel()
                    {

                        Tour = _context.Tours.Include(x => x.TourImages.Where(x => x.PosterStatus==true)).FirstOrDefault(x => x.Id == ci.TourId)
                    };

                    wishlistVM.Items.Add(wishlistItem);
                }



            }

            return RedirectToAction("wishlist");

        }

        public IActionResult Wishlist()
        {
            WishlistViewModel vm = new WishlistViewModel
            {
                Wishlist = _context.WishlistItems.Include(x => x.Tour).ThenInclude(x => x.TourImages).ToList()
            };
            return View(vm);
        }



        public IActionResult ShowWishlist()
        {
            var datastr = HttpContext.Request.Cookies["wishlist"];
            var data = JsonConvert.DeserializeObject<List<WishlistCookieItemViewModel>>(datastr);
            return Json(data);
        }


        public IActionResult Detail(int id)
        {
            var vm = _getTourDetailVm(id);
            if (vm.Tour == null)
            {
                return View("error");
            }

            return View(vm);
        }

        [Authorize(Roles = "Member")]
        [HttpPost]
        public IActionResult Review(TourReview tourReview)
        {


            if (!ModelState.IsValid)
            {
                var vm = _getTourDetailVm(tourReview.TourId);
                vm.tourReview = tourReview;

                return View("Detail", vm);
            }
            Tour tour = _context.Tours.Include(x => x.TourReviews).FirstOrDefault(x => x.Id == tourReview.TourId);
            if (tour== null) { return View("error"); }


            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            tourReview.AppUserId= userId;
            tourReview.ReviewDate = DateTime.UtcNow.AddHours(4);
            tour.TourReviews.Add(tourReview);
            tour.Rate =(byte)Math.Ceiling(tour.TourReviews.Average(x => x.Rate));
            _context.SaveChanges();
            return RedirectToAction("detail", new { id = tourReview.TourId });


        }

        private TourDetailViewModel _getTourDetailVm(int id)
        {
            var tour = _context.Tours.Include(x => x.TourReviews).ThenInclude(x => x.AppUser).Include(x => x.Category).Include(x => x.Destination).Include(x => x.DepartureLocation).Include(x => x.TourImages).FirstOrDefault(x => x.Id == id);

            var vm = new TourDetailViewModel
            {
                Tour = tour,
                tourReview = new TourReview
                {
                    TourId = id,
                }
            };

            return vm;
        }



    }
}
