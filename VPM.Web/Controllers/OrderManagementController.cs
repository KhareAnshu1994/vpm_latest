using Cylsys.Common;
using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VPM.Web.Controllers
{
    public class OrderManagementController : Controller
    {
        // GET: OrderManagement
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
            OrderManagement bll = new OrderManagement();
            return new JsonNetResult(bll.GetItem(id));
        }

        public ActionResult GetOrderManagementGrid()
        {
            OrderManagement bll = new OrderManagement();
            return new JsonNetResult(bll.GetOrderManagementGrid());

        }
        public ActionResult Save(OrderManagementModel model)
        {
            //UserModel modelObj = Helper.Deserialize<UserModel>(model);
            OrderManagement bll = new OrderManagement();
            return new JsonNetResult(bll.Save(model));
        }
    }
}