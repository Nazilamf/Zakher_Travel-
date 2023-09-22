using Final_Project_Travel.Areas.Manage.ViewModels;
using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Drawing;

namespace Final_Project_Travel.ViewModels
{
    public class TourShopViewModel
    {
        public List<Tour> Tours { get; set; }
        public List<Category> Categories { get; set; }

        public List<Destination> Destinations { get; set; }

        public List<Month>Months { get; set; }


        public int? SelectedCategoryId { get; set; }
        public List<int> SelectedDestinationId { get; set; }

        public int? SelectedMonth { get; set; }
       
        public decimal MinPrice { get; set; }
        public decimal MaxPrice { get; set; }
        public decimal SelectedMinPrice { get; set; }
        public decimal SelectedMaxPrice { get; set; }
        public List<SelectListItem> SortItems { get; set; }
        public List<WishlistItem> WishlistItems { get; set; }
       
    }


}

