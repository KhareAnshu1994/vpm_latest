using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VPM.Web.DAL;
using VPM.Web.Models;

namespace VPM.Web.Controllers
{
    public class PartyPaymentMultipleSchemeController : Controller
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
            return Json(PartyPaymentMultipleSchemeDB.GetItem(UserManager.User.Code, Id));
        }

        [HttpPost]
        public JsonResult Save(PartyPaymentMultipleSchemeModel model)
        {
            model.CreatedBy = UserManager.User.Code;
            return Json(PartyPaymentMultipleSchemeDB.AddPartyPaymentMultipleScheme(model));
        }

        [HttpPost]
        public JsonResult SavePMultipleScheme(PaymentMultipleSchemeModel model)
        {
            return Json(PaymentMultipleSchemeDB.AddPaymentMultipleScheme(model));
        }

        [HttpPost]
        public JsonResult GetPMultipleSchemeList(string BillNo)
        {
            return Json(PaymentMultipleSchemeDB.GetPaymentMultipleSchemeList(BillNo));
        }

        [HttpPost]
        public JsonResult DeleteTempPMS(int Id)
        {
            return Json(PaymentMultipleSchemeDB.DeleteTempPMS(Id));
        }

        [HttpPost]
        public JsonResult GetPaymentMultipleScheme(string BillNo)
        {
            return Json(PaymentMultipleSchemeDB.GetPaymentMultipleScheme(BillNo));
        }

        [HttpPost]
        public JsonResult GetPartyPaymentMultipleSchemeGrid()
        {
            return Json(PartyPaymentMultipleSchemeDB.GetPartyPaymentMultipleScheme(UserManager.User.Code, 0));
        }
    }
}