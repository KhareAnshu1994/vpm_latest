using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VPM.Web.Models;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class HomeController : Controller
    {
        [CustomAuthorize]
        public ActionResult Index()
        {
            ViewBag.Title = "Home";
            return View();
        }
    }
}
