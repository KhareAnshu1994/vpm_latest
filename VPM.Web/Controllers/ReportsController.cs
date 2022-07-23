﻿using VPM.Web.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VPM.Web.Models;
using System.Net.Http;
using System.Net;
using System.Data;
using MicroORM;
using ClosedXML.Excel;
using System.IO;
using System.Data.SqlClient;
using System.Globalization;

namespace VPM.Web.Controllers
{
    [CustomAuthorize]
    public class ReportsController : Controller
    {
        public ActionResult SAP_Voucher_Report()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SAP_Voucher_Report_Grid(DateTime? fromDate, DateTime? toDate, int? PayableAt)
        {
            return Json(ReportDB.GetSAPVoucherReport(fromDate, toDate, PayableAt));
        }

        public ActionResult Bank_Letter_Report()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Bank_Letter_Repor_Grid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetBankLetterReport(fromDate, toDate));
        }

        public ActionResult Cheque_Issued_Report()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Cheque_Issued_ReportGrid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetChqIssuedReport(fromDate, toDate));
        }

        public ActionResult TDS_Deposited_Report()
        {
            return View();
        }
        [HttpPost]
        public JsonResult TDS_Deposited_ReportGrid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetTDSDepositedReport(fromDate, toDate));
        }
        public ActionResult TDS_Under_GST_Report()
        {
            return View();
        }
        public JsonResult TDS_Under_GSTReportGrid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetTDSUnderGSTReport(fromDate, toDate));
        }
        public ActionResult GST_Payment_Report()
        {
            return View();
        }
        public JsonResult GST_Payment_ReportGrid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetGSTPaymentReport(fromDate, toDate));
        }

        public ActionResult ETDS_Filling_Report()
        {
            return View();
        }
        public JsonResult ETDS_Filling_ReportGrid(DateTime? fromDate, DateTime? toDate)
        {
            return Json(ReportDB.GetETDSFillingReport(fromDate, toDate));
        }
        //[Route("Reports/DownloadSAPVOUCHERExcel/{name}")]
        public ActionResult DownloadSAPVOUCHERExcel(ExportParaModel paramodel)
        {
            int temp_payableat = 0;

            switch (paramodel.PayableAt)
            {
                case "NEFT":
                    {
                        temp_payableat = 5;
                        break;
                    }
                case "RTGS":
                    {
                        temp_payableat = 6;
                        break;
                    }
                case "Cheque":
                    {
                        temp_payableat = 7;
                        break;
                    }
                case "Direct Deposit":
                    {
                        temp_payableat = 8;
                        break;
                    }
                case "Select":
                    {
                        temp_payableat = 0;
                        break;
                    }
                default:
                    {
                        temp_payableat = 0;
                        break;
                    }
            }
            int rowcount = 2;
            decimal Total = 0;
            Stream spreadsheetStream = new MemoryStream();
            string FileName = string.Empty;
            DataTable DT = new DataTable("Grid");
            Report bll = new Report();

            SqlParameter[] parameters = {
                new SqlParameter("@fromDate",paramodel.fromDate),
                new SqlParameter("@todate",paramodel.toDate),
                new SqlParameter("@PayableAtId",temp_payableat),

            };
            string fileNM = "OMS Report_" + paramodel.fromDate.ToString("dd_MM_yyyy") + "_To_" + paramodel.toDate.ToString("dd_MM_yyyy"); //+ "_To_" + val_PayableAt

            DT = CommonDB.GetRecord("vpm_sp_report_sap_voucher", parameters);
            DT.Columns.Remove("InwardDate");
            DT.Columns.Remove("PostDate");
            DT.Columns.Remove("ValueDate");
            DT.Columns.Remove("VoucherDate");

            if (DT.Rows.Count > 0)
            {

                //DateTime VoucherDate = string.IsNullOrWhiteSpace(DT.Rows[0]["VoucherDate"].ToString()) ? Convert.ToDateTime(DateTime.Now.ToString("1900-01-01")) : Convert.ToDateTime(DT.Rows[0]["VoucherDate"]);
                string Voucher_Date1 = string.IsNullOrWhiteSpace(DT.Rows[0]["Voucher_Date1"].ToString()) ? "" : DT.Rows[0]["Voucher_Date1"].ToString();
               
                string Post_Date1 = string.IsNullOrWhiteSpace(DT.Rows[0]["Post_Date1"].ToString()) ? "" : DT.Rows[0]["Post_Date1"].ToString();
                string ValueDate1 = string.IsNullOrWhiteSpace(DT.Rows[0]["ValueDate1"].ToString()) ? "" : DT.Rows[0]["ValueDate1"].ToString();
                foreach (DataRow dr in DT.Rows)
                {
                    string SAPCode = string.IsNullOrWhiteSpace(dr["SAPCode"].ToString()) ? "" : dr["SAPCode"].ToString();
                    decimal Amount = string.IsNullOrWhiteSpace(dr["Amount"].ToString()) ? 0 : Convert.ToDecimal(dr["Amount"]);

                    
                    if (SAPCode == "1001013")
                    {
                        Total = Total + Amount;
                    }
                }

                var sheetNames = new List<string>() { "Annexure" };

                FileName = "SAP_VOUCHER" + "_" + DateTime.Now.ToString("dd-MM-yyyy") + ".xlsx";
                XLWorkbook wbook = new XLWorkbook();
                IXLWorksheet Sheet = wbook.Worksheets.Add(sheetNames[0]);

                Sheet.Cell(1, (1)).Value = "VoucherNo";
                Sheet.Cell(1, (1)).Style.Font.Bold = true;
                Sheet.Cell(1, (2)).Value = "VoucherDate";
                Sheet.Cell(1, (2)).Style.Font.Bold = true;
                Sheet.Cell(1, (3)).Value = "SchemeCode";
                Sheet.Cell(1, (3)).Style.Font.Bold = true;
                Sheet.Cell(1, (4)).Value = "PostDT";
                Sheet.Cell(1, (4)).Style.Font.Bold = true;
                Sheet.Cell(1, (5)).Value = "VoucherType";
                Sheet.Cell(1, (5)).Style.Font.Bold = true;
                Sheet.Cell(1, (6)).Value = "BillNo";
                Sheet.Cell(1, (6)).Style.Font.Bold = true;
                Sheet.Cell(1, (7)).Value = "Department";
                Sheet.Cell(1, (7)).Style.Font.Bold = true;
                Sheet.Cell(1, (8)).Value = "PK";
                Sheet.Cell(1, (8)).Style.Font.Bold = true;
                Sheet.Cell(1, (9)).Value = "SAPCode";
                Sheet.Cell(1, (9)).Style.Font.Bold = true;
                Sheet.Cell(1, (10)).Value = "CONTRASCH";
                Sheet.Cell(1, (10)).Style.Font.Bold = true;
                Sheet.Cell(1, (11)).Value = "BillAmount";
                Sheet.Cell(1, (11)).Style.Font.Bold = true;
                Sheet.Cell(1, (12)).Value = "BA";
                Sheet.Cell(1, (12)).Style.Font.Bold = true;
                Sheet.Cell(1, (13)).Value = "ValueDT";
                Sheet.Cell(1, (13)).Style.Font.Bold = true;
                Sheet.Cell(1, (14)).Value = "FIL1";
                Sheet.Cell(1, (14)).Style.Font.Bold = true;
                Sheet.Cell(1, (15)).Value = "Naration";
                Sheet.Cell(1, (15)).Style.Font.Bold = true;



                for (int i = 0; i < DT.Rows.Count; i++)

                {

                    for (int j = 0; j < DT.Columns.Count; j++)

                    {

                        if (j == 0 || j == 2 || j == 9 || j == 11)

                        {

                            Sheet.Cell((rowcount), (j + 1)).Value = "'" + DT.Rows[i][j].ToString();

                        }

                        else

                        {

                            Sheet.Cell((rowcount), (j + 1)).Value = DT.Rows[i][j].ToString();

                        }


                    }

                    rowcount++;

                }

                Sheet.Cell(rowcount, 1).Value = "99";
                Sheet.Cell(rowcount, 1).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 1).Value = "99";
                Sheet.Cell(rowcount + 1, 1).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 2).Value = Voucher_Date1;
                Sheet.Cell(rowcount, 2).Style.Font.Bold = true;
               
                Sheet.Cell(rowcount + 1, 2).Value = Voucher_Date1;
                Sheet.Cell(rowcount + 1, 2).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 3).Value = "'001";
                Sheet.Cell(rowcount, 3).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 4).Value = Post_Date1;
                Sheet.Cell(rowcount, 4).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 5).Value = "AV";
                Sheet.Cell(rowcount, 5).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 4).Value = Post_Date1;
                Sheet.Cell(rowcount + 1, 4).Style.Font.Bold = true;

                Sheet.Cell(rowcount, 7).Value = " FUND PROV";
                Sheet.Cell(rowcount, 7).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 8).Value = "40";
                Sheet.Cell(rowcount, 8).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 9).Value = "1001013";
                Sheet.Cell(rowcount, 9).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 11).Value = Total;
                Sheet.Cell(rowcount, 11).Style.Font.Bold = true;


                Sheet.Cell(rowcount + 1, 8).Value = "50";
                Sheet.Cell(rowcount + 1, 8).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 9).Value = "8080015";
                Sheet.Cell(rowcount + 1, 9).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 11).Value = Total;
                Sheet.Cell(rowcount + 1, 11).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 12).Value = "'001";
                Sheet.Cell(rowcount, 12).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 12).Value = "'001";
                Sheet.Cell(rowcount + 1, 12).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 13).Value = ValueDate1;

               // Sheet.Cell(rowcount, 12).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 13).Value = ValueDate1;
                Sheet.Cell(rowcount, 13).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 13).Value = ValueDate1;
                Sheet.Cell(rowcount + 1, 13).Style.Font.Bold = true;
                Sheet.Cell(rowcount, 15).Value = "FUND PROVIDED IN UTI BANK 6491";
                Sheet.Cell(rowcount, 15).Style.Font.Bold = true;
                Sheet.Cell(rowcount + 1, 15).Value = "FUND PROVIDED IN UTI BANK 6491";
                Sheet.Cell(rowcount + 1, 15).Style.Font.Bold = true;
                Sheet.Columns("A", "o").AdjustToContents();
                Sheet.Columns("o").Style.NumberFormat.Format = "* #,##0.00";

                Sheet.Range("A1:o" + rowcount).Style.Border.InsideBorder = XLBorderStyleValues.Thin;
                Sheet.Range("A1:o" + rowcount).Style.Border.OutsideBorder = XLBorderStyleValues.Medium;
                Sheet.Range("A1:o" + rowcount).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Right;

                wbook.SaveAs(spreadsheetStream);
                spreadsheetStream.Position = 0;
            }
            return new FileStreamResult(spreadsheetStream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") { FileDownloadName = FileName };

        }
    }
}