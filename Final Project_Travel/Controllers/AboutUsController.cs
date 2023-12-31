﻿using Final_Project_Travel.DAL;
using Final_Project_Travel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing;

namespace Final_Project_Travel.Controllers
{
    public class AboutUsController : Controller
    {
        private readonly ZakherDbContext _context;
        public AboutUsController(ZakherDbContext context)

        {
            _context = context;
        }
        public IActionResult Index()
        {
            AboutUsViewModel vm = new AboutUsViewModel
            {
                Branches = _context.Branches.ToList(),
                Workers= _context.Workers.ToList(),
            };
            return View(vm);
        }
    }
}
