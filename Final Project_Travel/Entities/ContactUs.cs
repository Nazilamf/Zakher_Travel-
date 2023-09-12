using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class ContactUs
    {
        public int Id { get; set; }
        public string? AppUserId { get; set; }
        [MaxLength(35)]
        public string FullName { get; set; }
        [MaxLength(35)]
        public string Email { get; set; }

        [MaxLength(15)]
        public string Phone { get; set; }
        [MaxLength(200)]
        public string Text { get; set; }
        [MaxLength(35)]
        public string Subject { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.UtcNow.AddHours(4);

    }
}
