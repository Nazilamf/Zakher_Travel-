using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Slider
    {
        public int Id { get; set; }

        public int Order { get; set; }
        [MaxLength(50)]
        public string Title { get; set; }

        [MaxLength(200)]
        public string Desc { get; set; }

        [MaxLength(150)]
        public string ButtonText { get; set; }
        [MaxLength(150)]
        public string ButtonUrl { get; set; }

        [MaxLength(30)]
        public string ButtonBackgroundColor { get; set; }

        [MaxLength(150)]
        [AllowedTypes("image/png", "image/jpeg")]
        public string ImageName { get; set; }

        [NotMapped]
        //[MaxFileLength(2097152)]

        public IFormFile ImageFile { get; set; }

    }
}
