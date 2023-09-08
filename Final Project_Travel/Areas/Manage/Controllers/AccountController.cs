using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Travel.Areas.Manage.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
