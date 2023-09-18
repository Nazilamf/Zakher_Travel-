using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Branch
    {
        public int Id { get; set; }

        [MaxLength(50)]
        public string Name { get; set; }
        [MaxLength(100)]
        public string ImageName { get; set; }

        [NotMapped]
        [MaxFileLength(4194304)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }
    }
}
