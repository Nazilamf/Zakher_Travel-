using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class Category
    {
        public int Id { get; set; }

        [MaxLength(50)]
        public string Name { get; set; }
        public List<Tour> Tours { get; set; } = new List<Tour>();

    }
}
