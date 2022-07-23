using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cylsys.Common;
using VPM.Web.Models;

namespace VPM.Web.Controllers
{
    public class SchemeController : Controller
    {
        // GET: Scheme
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Item()
        {
            return View();
        }
        public ActionResult GetItem(int id)
        {
           Scheme  bll = new Scheme();
            return new JsonNetResult(bll.GetItem(id));
        }

        public ActionResult GetSchemeGrid()
        {
            Scheme bll = new Scheme();
            return new JsonNetResult(bll.GetSchemeGrid());

        }
        public ActionResult Save(SchemeModel model)
        {
            //UserModel modelObj = Helper.Deserialize<UserModel>(model);
            Scheme bll = new Scheme();
            return new JsonNetResult(bll.Save(model));
        }
    }
}