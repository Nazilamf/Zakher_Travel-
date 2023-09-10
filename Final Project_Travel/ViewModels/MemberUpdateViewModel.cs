using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.ViewModels
{
    public class MemberUpdateViewModel
    {
        [Required]
        [MaxLength(50)]
        public string FullName { get; set; }
        [Required]
        [MaxLength(50)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [MaxLength(20)]
        public string UserName { get; set; }
        [Required]
        [MaxLength(20)]
        public string Phone { get; set; }

        [MaxLength(30)]
        [DataType(DataType.Password)]
        public string CurrentPassword { get; set; }
        [MaxLength(30)]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        [MaxLength(30)]
        [DataType(DataType.Password)]
        [Compare(nameof(NewPassword))]
        public string ConfirmNewPassword { get; set; }

    }
}
