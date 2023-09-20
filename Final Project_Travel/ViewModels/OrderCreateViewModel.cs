using Final_Project_Travel.Entities;
using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.ViewModels
{
    public class OrderCreateViewModel
    {
        [Required]
        [MaxLength(35)]
        public string FullName { get; set; }
        [Required]
        [MaxLength(35)]
        public string Email { get; set; }
        [Required]
        [MaxLength(50)]
        public string Adress { get; set; }
        [Required]
        [MaxLength(15)]
        public string Phone { get; set; }

        [MaxLength(300)]
        public string Note { get; set; }
        public int TourId { get; set; }
        public string TourName { get; set; }    
        public decimal TotalAmount { get; set; }

        public CheckOutItemViewModel CheckOutItemViewModel { get; set; }
    }
}
