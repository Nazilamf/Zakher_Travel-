using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Areas.Manage.ViewModels
{
    public class AdminViewModel
    {
        [Required]
        [MaxLength(20)]
        public string UserName { get; set; }

        [Required]
        [MaxLength(20)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

    }
}
