using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Destination
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(25)]
        public string Name { get; set; }

        [MaxLength(50)]
        public string ImageName { get; set; }

        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }


        public List<Tour> Tours { get; set; } = new List<Tour>();

        

    }
}
