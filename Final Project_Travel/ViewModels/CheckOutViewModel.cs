using Final_Project_Travel.Entities;

namespace Final_Project_Travel.ViewModels
{
    public class CheckOutViewModel
    {

        public CheckOutItemViewModel Item { get; set; } = new CheckOutItemViewModel();
        public decimal TotalAmount { get; set; }

        public OrderCreateViewModel Order { get; set; }
    }
}
