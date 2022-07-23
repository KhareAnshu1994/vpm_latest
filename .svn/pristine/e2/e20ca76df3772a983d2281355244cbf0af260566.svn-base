using Cylsys.Common;
using VPM.Web.DAL;
using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class TaxController : Controller
    {
        public List<DDLModel> ListModel { get; private set; }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Item()
        {
            return View();
        }

        public ActionResult GetTaxationById()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveTax(TaxModel model)
        {
            TaxModel obj = new TaxModel();
            obj.TaxName = model.TaxName;
            return Json(TaxDB.Func_AddTax(obj));
        }
        [HttpPost]
        public ActionResult GetTaxNames()
        {
            ListModel = new List<DDLModel>();
            SqlParameter[] Params = { };
            DataTable dt = CommonDB.GetRecord("vpm_sp_get_TaxNames", Params);
            if (dt.Rows.Count > 0)
            {
                ListModel = CommonDB.LOAD_DROPDOWNLIST(dt);
            }
            return Json(ListModel);
        }

        [HttpPost]
        public JsonResult SaveTempTaxation(TaxationModel model)
        {
            model.Status = "ITemptbl";
            model.Createdby = UserManager.User.Code;
            return Json(TaxDB.Func_AddTaxation(model));
        }

        [HttpPost]
        public JsonResult GetTempTaxationRecords()
        {
            return Json(TaxDB.Func_GetTaxationRecords(UserManager.User.Code, "ITemptbl"));
        }

        [HttpPost]
        public JsonResult getTaxationMasterGrid()
        {
            return Json(TaxDB.Func_GetTaxationRecords(UserManager.User.Code, "IMaintbl"));
        }
        [HttpPost]
        public JsonResult DeleteTempTaxationRecord(int Id)
        {
            return Json(TaxDB.Func_DeleteTempTaxation(Id));
            //return Json(TaxDB.Func_GetTaxationRecords(UserManager.User.Code, "ITemptbl"));
        }

        [HttpPost]
        public ActionResult GetTaxationById(int Id)
        {
            return Json(TaxDB.GetTaxationRecordsById(Id));
        }
        [HttpPost]
        public ActionResult EditTaxation(TaxationModel model)
        {
            return Json(TaxDB.EditTaxation(model));
        }

        [HttpPost]
        public JsonResult SaveTaxation()
        {
            TaxationModel model = new TaxationModel();
            model.TaxName = "";
            model.Remark = "";
            model.TaxPercentage = 0;
            model.Status = "IMaintbl";
            model.Createdby = UserManager.User.Code;
            return Json(TaxDB.Func_AddTaxation(model));
        }

        [HttpPost]
        public ActionResult DeleteTaxationById(int Id)
        {
            return Json(TaxDB.DeleteTaxationRecordsById(Id));
        }
    }
}