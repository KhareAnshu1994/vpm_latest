using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cylsys.Common;
using VPM.Web.Models;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class CommonController : Controller
    {
        // GET: Common

        /* Kapil Code*/
        public ActionResult GetCategoryTypes()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetCategoryTypes());
        }
        /* Kapil Code End*/
        public ActionResult GetSecurityTypes()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetSecurityTypes());
        }
        public ActionResult GetToggles()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetToggles());
        }
        public ActionResult GetPriceYields()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetPriceYields());
        }
        
        public ActionResult GetEmailFiles(DateTime from_date, DateTime to_date)
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetEmailfiles(from_date, to_date));
        }
        public ActionResult GetSchemes()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetSchemes());
        }
        public ActionResult GetMenus()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetMenus());
        }
        public ActionResult GetReportAccess()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetReportAccessByEmployeeCode());
        }
        public ActionResult GetRoles()
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetRoles());
        }
        public ActionResult GetEmpList(string q)
        {
            Common2 bll = new Common2();
            return new JsonNetResult(bll.GetEmpList(q));
        }
        //public ActionResult GetBatchNumbers(string QueryType)
        //{
        //    Common2 bll = new Common2();
        //    return new JsonNetResult(bll.GetBatchNumbers(QueryType));
        //}

        /* Added by Kapil for VPM Project  */
        public List<DDLModel> ListModel { get; private set; }
        public ActionResult GetAllDDL(string category_code)
        {
            ListModel = new List<DDLModel>();
            SqlParameter[] Params = {
                new SqlParameter("@category_code", category_code)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_generate_ddl", Params);
            if (dt.Rows.Count > 0)
            {
                ListModel = CommonDB.LOAD_DROPDOWNLIST(dt);
            }
            return Json(ListModel);
        }

        public ActionResult GetTaxPercentageDDL(int Id)
        {
            List<DDLTaxRateModel> taxpercentage = new List<DDLTaxRateModel>();
            SqlParameter[] Params = {
                new SqlParameter("@TaxId", Id)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_Get_TaxRateDetails", Params);
            if (dt.Rows.Count > 0)
            {
                taxpercentage = CommonDB.LOAD_TaxRatesDROPDOWNLIST(dt);
            }
            return Json(taxpercentage);
        }

        public ActionResult GetPartyNames()
        {
            ListModel = new List<DDLModel>();
            SqlParameter[] Params = {
                new SqlParameter("@CreatedBy", UserManager.User.Code)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_Get_PartyNames", Params);
            if (dt.Rows.Count > 0)
            {
                ListModel = CommonDB.LOAD_DROPDOWNLIST(dt);
            }
            return Json(ListModel);
        }
        /* Added by Kapil for VPM Project End  */
    }
}
