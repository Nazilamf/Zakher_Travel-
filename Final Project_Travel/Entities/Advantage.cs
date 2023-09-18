using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Advantage
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(25)]
        public string Title { get; set; }
        [MaxLength(50)]
        public string Desc { get; set; }
        [MaxLength(50)]
        public string Icon { get; set; }

        [NotMapped]
        [MaxFileLength(4194304)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }

        
    }
}
