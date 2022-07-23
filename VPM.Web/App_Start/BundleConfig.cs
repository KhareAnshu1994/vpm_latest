using System.Web;
using System.Web.Optimization;

namespace VPM.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                    "~/Scripts/jquery-ui.min.js",
                    "~/Content/Js/bootstrap.min.js",
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/custom").Include(
                      "~/Scripts/angular.min.js",
                      "~/Scripts/angular-animate.min.js",
                      "~/Scripts/toaster.js",
                      "~/Assets/app.js",
                       "~/Scripts/ng/angular-validator.js",
                      "~/Scripts/ng/angular-validator-rules.js",
                      "~/Scripts/ng/ui-bootstrap-tpls-2.1.3.js",
                      "~/Assets/menu.js",
                      "~/Assets/common.js",
                      "~/Assets/fileUploadStatus.js",
                      "~/Scripts/moment.js",
                      "~/Assets/scheme.js",
                      "~/Assets/user.js",
                      "~/Assets/role.js",
                      "~/Assets/orderManagement.js",
                      "~/Assets/roleMenuMapping.js",
                      "~/Assets/report.js"
                    , "~/Assets/Login.js"
                    , "~/Assets/LovCategory.js"
                    , "~/Assets/Lov.js"
                    , "~/Assets/PartyMaster.js"
                    , "~/Assets/Tax.js"
                    , "~/Assets/PartyPayment.js"
                    , "~/Assets/SAPVoucherReport.js"
                    , "~/Assets/TDSDepositedReport.js"
                    , "~/Assets/BankLetterReport.js"
                    , "~/Assets/ETDSFillingReport.js"
                    , "~/Assets/GSTPaymentReport.js"
                    , "~/Assets/TDSUnderGSTReport.js"
                    , "~/Assets/ChqIssuedReport.js"
                    , "~/Assets/PartyPaymentMultipleScheme.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      //"~/Content/bootstrap.min.css",
                      "~/Content/toaster.css"
                      ));
        }
    }
}
