using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Final_Project_Travel.ViewModels
{
    public class MemberLoginViewModel 
    {
        [Required]
        [MaxLength(50)]
        public string UserName { get; set; }
        [Required]
        [MaxLength(30)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
