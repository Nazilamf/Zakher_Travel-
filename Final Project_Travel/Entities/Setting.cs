using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.Entities
{
    public class Setting
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(25)]
        public string Key { get; set; }
        [Required]
        [MaxLength(100)]
        public string Value { get; set; }
    }
}
