using Final_Project_Travel.Entities;

namespace Final_Project_Travel.ViewModels
{
    public class HomeViewModel
    {
        public List<Slider> Sliders { get; set; }
        public List<Destination> Destinations { get; set; }

        public List <Tour>PopularTours { get; set; }
        public List <Advantage> Advantages { get; set; }
        public List <Tour> DiscountTours { get; set; }
        public List <Tour> Tours { get; set; }

        

        
    }
}
