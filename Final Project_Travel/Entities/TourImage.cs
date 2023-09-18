using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class TourImage
    {
        public int Id { get; set; }
        public int TourId { get; set; }
        [Required]
        [MaxLength(300)]
        public string ImageName { get; set; }
        public bool PosterStatus { get; set; }

        public Tour Tour { get; set; }
    }
}
