using Final_Project_Travel.Entities;
using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Areas.Manage.ViewModels
{
    public class AdminUserViewModel
    {
        public string UserId { get; set; }  
        [Required]
        [MaxLength(50)]
        public string FullName { get; set; }
        
        [Required]
        [MaxLength(50)]
        public string UserName { get; set; }
        [Required]
        [MaxLength(50)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
       
    }
}
