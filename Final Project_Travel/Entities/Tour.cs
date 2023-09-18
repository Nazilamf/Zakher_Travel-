using Final_Project_Travel.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_Project_Travel.Entities
{
    public class Tour
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]

        public string Name { get; set; }
     
        [MaxLength(20)]
        public string Code { get; set; }

        [MaxLength(1000)]
        public string Desc { get; set; }


        [Column(TypeName = "decimal(18,2)")]
        public decimal CostPrice { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal SalePrice { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountPrice { get; set; }    
        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public byte Rate { get; set; }

        public int PersonCount { get; set; }
        public bool Transfer { get; set; }  
        public bool Insurance { get; set; }

        public int CategoryId { get; set; }

        public Category Category { get; set; }  

        public int DestinationId { get; set; }

        public Destination Destination { get; set; }

        public int DepartureLocationId { get; set; }
        public DepartureLocation DepartureLocation { get; set; }

        [NotMapped]
        [MaxFileLength(4194304)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile PosterFile { get; set; }
        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public List<IFormFile> ImageFiles { get; set; } = new List<IFormFile>();
        [NotMapped]
        public List<int> TourImageIds { get; set; } = new List<int>();
        public List<TourImage> TourImages { get; set; } = new List<TourImage>();

        public bool IsDeleted { get; set; }

        public ICollection<WishlistItem> WishlistItems { get; set; }
        public ICollection<TourReview> TourReviews { get; set; } = new List<TourReview>();

    }
}
