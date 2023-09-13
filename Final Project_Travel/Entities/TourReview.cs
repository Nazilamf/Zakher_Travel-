using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class TourReview
    {
        public int Id { get; set; }
        public int TourId { get; set; }

        public string AppUserId { get; set; }

        [Range(1, 5)]
        public byte Rate { get; set; }
        [MaxLength(200)]
        public string Text { get; set; }

        public DateTime ReviewDate { get; set; }
        public Tour Tour { get; set; }

        public AppUser AppUser { get; set; }
    }
}
