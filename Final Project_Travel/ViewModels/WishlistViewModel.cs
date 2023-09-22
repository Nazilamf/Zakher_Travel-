using Final_Project_Travel.Entities;

namespace Final_Project_Travel.ViewModels
{
    public class WishlistViewModel
    {
        public List<WishlistItemViewModel> Items { get; set; } = new List<WishlistItemViewModel>();
        public List<WishlistItem> Wishlist { get; set; }
    }
}