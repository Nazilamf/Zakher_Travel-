using Final_Project_Travel.DAL;
using Final_Project_Travel.Entities;
using System.Security.Claims;

namespace Final_Project_Travel.Services
{
    public class LayoutService
    {

        private readonly ZakherDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LayoutService(ZakherDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }


        public Dictionary<string, string> GetSettings()
        {
            return _context.Settings.ToDictionary(x => x.Key, x => x.Value);
        }

        



        
    }
}
