using Cylsys.Common;
using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class LovCategoryController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Item()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetItem(int Id)
        {
            return Json(LovCategoryDB.GetItem(Id));
        }

        [HttpPost]
        public JsonResult Save(LovCategoryModel model)
        {
            LovCategoryModel obj = new LovCategoryModel();
            obj.ID = model.ID;
            obj.Code = model.Code;
            obj.Name = model.Name;
            obj.isactive = model.isactive;
            return Json(LovCategoryDB.Save(obj));
        }

        [HttpPost]
        public JsonResult GetLovCategoryGrid()
        {
            return Json(LovCategoryDB.GetLovCategoryGrid());
        }
        public ActionResult DeleteItem(int Id)
        {
            return Json(LovCategoryDB.DeleteItem(Id));
        }

        //public JsonResult Delete(int id)
        //{
        //    using (CustomersEntities entities = new CustomersEntities())
        //    {
        //        entities.Customers.Add(customer);
        //        entities.SaveChanges();
        //    }

        //    return Json(customer);
        //}

    }
}