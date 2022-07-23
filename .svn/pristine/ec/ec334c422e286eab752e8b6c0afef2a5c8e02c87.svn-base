using VPM.Web.DAL;
using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class PartyMasterController : Controller
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
            return Json(PartyMasterDB.GetItem(UserManager.User.Code, Id));
        }

        [HttpPost]
        public JsonResult Save(PartyMasterModel model)
        {
            PartyMasterModel objPartyMaster = new PartyMasterModel();
            objPartyMaster.Id = model.Id;
            objPartyMaster.PartyName = model.PartyName;
            objPartyMaster.AccountNo = model.AccountNo;
            objPartyMaster.Address1 = model.Address1;
            objPartyMaster.Address2 = model.Address2;
            objPartyMaster.Address3 = model.Address3;
            objPartyMaster.State = model.State;
            objPartyMaster.Pincode = model.Pincode;
            objPartyMaster.BankId = model.BankId;
            objPartyMaster.CreatedBy = UserManager.User.Code;
            objPartyMaster.GSTNO = model.GSTNO;
            objPartyMaster.PANNO = model.PANNO;
            objPartyMaster.IFSCCODE = model.IFSCCODE;
            objPartyMaster.Location = model.Location;
            objPartyMaster.Remark = model.Remark;
            objPartyMaster.CreatedDate = DateTime.Now;
            objPartyMaster.IsActive = model.IsActive;
            return Json(PartyMasterDB.AddPartyMaster(objPartyMaster));
        }

        [HttpPost]
        public JsonResult GetPartyMasterGrid()
        {
            return Json(PartyMasterDB.GetPartyMasterGrid(UserManager.User.Code, 0));
        }
    }
}