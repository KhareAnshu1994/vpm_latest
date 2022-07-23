﻿using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class MenuCreationController : Controller
    {
       
        // GET: MenuCreation
        public ActionResult Index()
        {
            return View();
        }
    }
}