using Final_Project_Travel.Entities;

namespace Final_Project_Travel.Areas.Manage.ViewModels
{
    public class DashboardChartsViewModel
    {
        public int AcceptedOrderCount { get; set; }
        public int RejectedOrderCount { get; set; }
        public int PendingOrderCount { get; set; }

        public List<string>Labels { get; set; }
        public List<Tour> Tours { get; set; }
        public int ToursCount { get; set; }

        public decimal TotalProfit { get; set; }
        public int TotalOrders { get; set; }

        public decimal AverageTourPrice { get; set; }
    
    }
}
