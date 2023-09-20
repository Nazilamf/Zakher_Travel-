using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.ViewModels
{
    public class ResetPasswordViewModel
    {
        [Required]
        [MaxLength(25)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required]
        [MaxLength(25)]
        [DataType(DataType.Password)]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Token { get; set; }

    }
}
