using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Worker
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(25)]
        public string FullName { get; set; }

        [MaxLength(25)]
        public string Position { get; set; }    

        [MaxLength(300)]
        public string ImageName { get; set; }

        [NotMapped]
        [MaxFileLength(4194304)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }
    }
}
