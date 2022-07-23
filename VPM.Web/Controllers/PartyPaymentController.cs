using System.Web.Mvc;
using VPM.Web.DAL;
using VPM.Web.Models;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class PartyPaymentController : Controller
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
            return Json(PartyPaymentDB.GetItem(UserManager.User.Code, Id));
        }

        [HttpPost]
        public JsonResult Save(PartyPaymentModel model)
        {
            model.CreatedBy = UserManager.User.Code;
            return Json(PartyPaymentDB.AddPartyPayment(model));
        }

        [HttpPost]
        public JsonResult GetPartyPaymentGrid()
        {
            return Json(PartyPaymentDB.GetPartyPayment(UserManager.User.Code,0));
        }
    }
}