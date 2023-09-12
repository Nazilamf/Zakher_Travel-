using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.ViewModels
{
    public class ContactViewModel
    {
        [Required]
        [MaxLength(35)]
        public string FullName { get; set; }
        [Required]
        [MaxLength(35)]
        public string Email { get; set; }

        [Required]
        [MaxLength(15)]
        public string Phone { get; set; }

        [MaxLength(300)]

        public string Text { get; set; }
        [MaxLength(35)]
        public string Subject { get; set; }
    }
}
