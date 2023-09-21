using Final_Project_Travel.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.X509Certificates;

namespace Final_Project_Travel.DAL
{
    public class ZakherDbContext:IdentityDbContext
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

        public DbSet <AppUser> AppUsers { get; set; }

        public DbSet<OrderItem> OrderItems { get; set; }

        public DbSet<Order> Orders { get; set; }

        public DbSet<WishlistItem> WishlistItems { get; set; }

        public DbSet<ContactUs> ContactUs { get; set; }

        public DbSet<Branch> Branches { get; set; }

        public DbSet<TourReview> TourReviews { get; set; }

        public DbSet<Admin> Admins { get; set; }    

        public DbSet<Month> Months { get; set; }
    }
}
