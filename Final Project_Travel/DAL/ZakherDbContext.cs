using Final_Project_Travel.Entities;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.X509Certificates;

namespace Final_Project_Travel.DAL
{
    public class ZakherDbContext:DbContext
    {
        public ZakherDbContext(DbContextOptions<ZakherDbContext> options) : base(options)
        {
            
        }

        public DbSet<Advantage> Advantages { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Destination> Destinations { get; set; }    


        public DbSet<DepartureLocation> DepartureLocations { get; set; }    
        public DbSet<Slider> Sliders { get; set; }

        public DbSet <TourImage > TourImages { get; set; }  

        public DbSet<Tour> Tours { get; set; }

        public DbSet <Worker> Workers { get; set; } 

        public DbSet<Setting> Settings { get; set; }    
    }
}
