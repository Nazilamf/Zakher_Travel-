namespace Final_Project_Travel.Entities
{
    public class WishlistItem
    {
            public int Id { get; set; }
            public int TourId { get; set; }
            public string AppUserId { get; set; }

            public Tour Tour { get; set; }
            public AppUser AppUser { get; set; }

        
    }
}
