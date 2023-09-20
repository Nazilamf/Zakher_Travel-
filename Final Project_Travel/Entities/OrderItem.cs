using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class OrderItem
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        [MaxLength(35)]
        public string TourName { get; set; }
        public int TourId { get; set; }
        public decimal UnitDiscountPrice { get; set; }
        public decimal UnitCostPrice { get; set; }

        public decimal UnitSalePrice { get; set; }

        public Tour Tours { get; set; }
        public Order Order { get; set; }

    }
}
