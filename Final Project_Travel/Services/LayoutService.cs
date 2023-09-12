using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using Final_Project_Travel.ViewModels;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Security.Claims;

namespace Final_Project_Travel.Services
{
    public class LayoutService
    {

        private readonly ZakherDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LayoutService(ZakherDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }


        public Dictionary<string, string> GetSettings()
        {
            return _context.Settings.ToDictionary(x => x.Key, x => x.Value);
        }



        public WishlistViewModel GetWishlist()
        {

            var WishlistVM = new WishlistViewModel();
            if (_httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
            {
                string userId = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
                var dbitems = _context.WishlistItems.Include(x => x.Tour).ThenInclude(x => x.TourImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId ==userId).ToList();

                foreach (var dbitem in dbitems)
                {
                    WishlistItemViewModel item = new WishlistItemViewModel()
                    {
                      
                        Tour = _context.Tours.Include(x => x.TourImages).FirstOrDefault(x => x.Id == dbitem.TourId)


                    };
                    WishlistVM.Items.Add(item);
                }
            }
            else
            {
                var wishliststr = _httpContextAccessor.HttpContext.Request.Cookies["wishlist"];

                List<WishlistCookieItemViewModel> cookieItems = null;
                if (wishliststr== null)
                {
                    cookieItems= new List<WishlistCookieItemViewModel>();
                }
                else
                {
                    cookieItems=JsonConvert.DeserializeObject<List<WishlistCookieItemViewModel>>(wishliststr);
                }

                WishlistVM.Items = new List<WishlistItemViewModel>();
                foreach (var cookieItem in cookieItems)
                {
                    WishlistItemViewModel item = new WishlistItemViewModel()
                    {
                        Tour = _context.Tours.Include(x => x.TourImages).FirstOrDefault(x => x.Id == cookieItem.TourId)


                    };
                    WishlistVM.Items.Add(item);
                }
            }


            return WishlistVM;
        }
    }
}

       