using ClosedXML.Excel;
using Cylsys.Common;
using MicroORM;
using VPM.Web.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetGridDetail(DateTime FROM_DATE, DateTime TO_DATE)
        {
            Report bll = new Report();

            return new JsonNetResult(bll.GetGridDetail(FROM_DATE, TO_DATE));
        }
        public ActionResult DownloadSAPVOUCHERExcel(ExportParaModel epmodel)
        {
            DataTable dt = new DataTable();

            int rowcount = 2;
            decimal Total = 0;
            Stream spreadsheetStream = new MemoryStream();

            string FileName = string.Empty;

            Report bll = new Report();
            string fileNM = "OMS Report_" + epmodel.FromDate.ToString("dd_MMM_yyyy") + "_To_" + epmodel.ToDate.ToString("dd_MMM_yyyy");

            SqlParameter[] parameters = {
                new SqlParameter("@from_date",epmodel.FromDate),
                new SqlParameter("@to_date",epmodel.ToDate)

            };
            DataTable DT = new DataTable("Grid");
            DT = DataAccess.ExecuteProcedure("oms_sp_get_report_excel", parameters);

            if (DT.Rows.Count > 0)
            {
                var sheetNames = new List<string>() { "Annexure" };
                // string fileName = "Employee_wise_Annexure" + ".xlsx";
                FileName = "SAP_VOUCHER" + "_" + DateTime.Now.ToString("dd-MM-yyyy") + ".xlsx";
                XLWorkbook wbook = new XLWorkbook();
                IXLWorksheet Sheet = wbook.Worksheets.Add(sheetNames[0]);

                Sheet.Cell(1, (1)).Value = "VoucherNo";
                Sheet.Cell(1, (1)).Style.Font.Bold = true;
                Sheet.Cell(1, (1)).Value = "VoucherDate";
                Sheet.Cell(1, (1)).Style.Font.Bold = true;
                Sheet.Cell(1, (2)).Value = "SchemeCode";
                Sheet.Cell(1, (2)).Style.Font.Bold = true;
                Sheet.Cell(1, (3)).Value = "PostDT";
                Sheet.Cell(1, (3)).Style.Font.Bold = true;
                Sheet.Cell(1, (4)).Value = "VoucherType";
                Sheet.Cell(1, (4)).Style.Font.Bold = true;
                Sheet.Cell(1, (5)).Value = "BillNo";
                Sheet.Cell(1, (5)).Style.Font.Bold = true;
                Sheet.Cell(1, (6)).Value = "Department";
                Sheet.Cell(1, (6)).Style.Font.Bold = true;
                Sheet.Cell(1, (7)).Value = "PK";
                Sheet.Cell(1, (7)).Style.Font.Bold = true;
                Sheet.Cell(1, (8)).Value = "SAPCode";
                Sheet.Cell(1, (8)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "CONTRASCH";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "BillAmount";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "BA";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "ValueDT";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "Naration";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;

                var sapcode = 1001013;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 1; j < dt.Columns.Count; j++)
                    {
                        if (j == 1|| j == 0 )
                        {
                            Sheet.Cell((rowcount), (j + 1)).Value = "'" + dt.Rows[i][j].ToString();
                            //  Sheet.Cell((rowcount), (j + 1)).Value = dt.Rows[i][j].ToString();
                        }
                        else
                        {
                            Sheet.Cell((rowcount), (j + 1)).Value = dt.Rows[i][j].ToString();
                        }
                        //if (SAPCode = 1001013)

                    }
                    Total = Total + Convert.ToDecimal(dt.Rows[i][3].ToString());
                    rowcount++;
                }
                Sheet.Cell(rowcount, 8).Value = "Grand Total";
                Sheet.Cell(rowcount, 8).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 9).Value = Total;
                Sheet.Cell(rowcount, 9).Style.Font.Bold = true;
                Sheet.Columns("A", "D").AdjustToContents();
                Sheet.Columns("D").Style.NumberFormat.Format = "* #,##0.00";

                Sheet.Range("A1:D" + rowcount).Style.Border.InsideBorder = XLBorderStyleValues.Thin;
                Sheet.Range("A1:D" + rowcount).Style.Border.OutsideBorder = XLBorderStyleValues.Medium;
                Sheet.Range("A1:D" + rowcount).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Right;

                wbook.SaveAs(spreadsheetStream);
                spreadsheetStream.Position = 0;
            }
            return new FileStreamResult(spreadsheetStream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") { FileDownloadName = FileName };

        }
        public ActionResult GetExportToExcel(ExportParaModel epmodel)
        {
            Report bll = new Report();
            string fileNM = "OMS Report_" + epmodel.FromDate.ToString("dd_MMM_yyyy") + "_To_" + epmodel.ToDate.ToString("dd_MMM_yyyy");

            SqlParameter[] parameters = {
                new SqlParameter("@from_date",epmodel.FromDate),
                new SqlParameter("@to_date",epmodel.ToDate)

            };
            DataTable DT = new DataTable("Grid");
            DT = DataAccess.ExecuteProcedure("oms_sp_get_report_excel", parameters);

            using (XLWorkbook wb = new XLWorkbook())
            {
                try
                {
                    wb.Worksheets.Add(DT, "sheet1");
                }
                catch (Exception exx)
                {
                    Helper.WriteLog("error export to excel :" + exx);
                }
                using (MemoryStream stream = new MemoryStream())
                {

                    wb.SaveAs(stream);

                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileNM + ".xlsx");
                    //return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileNm + ".xlsx");
                }
            }
        }
    }
}