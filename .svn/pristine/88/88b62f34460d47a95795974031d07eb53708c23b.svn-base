using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using VPM.Web.Models;
using VPM.Web.DAL;
using Cylsys.Common;
using System.Globalization;

namespace VPM.Web.DAL
{
    public class ExportParaModel
    {
        public DateTime fromDate { get; set; }
        public DateTime toDate { get; set; }
        public string PayableAt { get; set; }

    }
    public class ReportDB
    {
        /* SAPVoucherReport Start */
        public static List<SapVoucherReportModel> GetSAPVoucherReport(DateTime? fromDate, DateTime? toDate, int? PayableAt)
        {
            List<SapVoucherReportModel> list = new List<SapVoucherReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate),
                new SqlParameter("@PayableAtId",string.IsNullOrWhiteSpace(PayableAt.ToString()) ? 0 : PayableAt),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_sap_voucher", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = SAPVoucherReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value),
                new SqlParameter("@PayableAtId",string.IsNullOrWhiteSpace(PayableAt.ToString()) ? 0 : PayableAt),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_sap_voucher", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = SAPVoucherReportList(dt);
                }
            }
            return list;
        }
        public static List<SapVoucherReportModel> SAPVoucherReportList(DataTable dt)
        {
           

            string dateString = null;
            CultureInfo provider = CultureInfo.InvariantCulture;
            List<SapVoucherReportModel> items = new List<SapVoucherReportModel>();
            foreach (DataRow dr in dt.Rows)
               
            {
                items.Add(new SapVoucherReportModel
                {

                    InwardDate = (dr["InwardDate"] == DBNull.Value || dr["InwardDate"].ToString() == "") ? (DateTime?)null : Convert.ToDateTime(dr["InwardDate"]),
                    VoucherNo = Convert.ToInt32(dr["VoucherNo"]),
                    VoucherDate = (dr["VoucherDate"] == DBNull.Value || dr["VoucherDate"].ToString() == "") ? (DateTime?)null : Convert.ToDateTime(dr["VoucherDate"]),
                    //Voucher_Date1 = string.IsNullOrWhiteSpace(dr["Voucher_Date1"].ToString()) ? "" : Convert.ToString(dr["Voucher_Date1"]),
                    
                    SchCode = Convert.ToString(dr["SchCode"]),
                    PostDate = (dr["PostDate"] == DBNull.Value || dr["PostDate"].ToString() == "") ? (DateTime?)null : Convert.ToDateTime(dr["PostDate"]),
                   // Post_Date1 = string.IsNullOrWhiteSpace(dr["Post_Date1"].ToString()) ? "" : Convert.ToString(dr["Post_Date1"]),
                   
                    VoucherType = Convert.ToString(dr["Vouchertype"]),
                    BillNo = Convert.ToString(dr["BillNo"]),
                    Department = Convert.ToString(dr["Department"]),
                    PK = Convert.ToString(dr["PK"]),
                    SapCode = Convert.ToString(dr["SAPCODE"]),
                    CONTRASCH = Convert.ToString(dr["CONTRASCH"]),
                    BillAmount = Convert.ToDecimal(dr["Amount"]),
                    BA = Convert.ToString(dr["BA"]),


                    //ValueDate1 = string.IsNullOrWhiteSpace(dr["ValueDate1"].ToString()) ?"" : Convert.ToString(dr["ValueDate1"]),
                    // ValueDate = (dr["ValueDate"] == DBNull.Value || dr["ValueDate"].ToString() == "") ? (DateTime?)null : Convert.ToDateTime(dr["ValueDate"]),
                    ValueDate = (dr["ValueDate"] == DBNull.Value || dr["ValueDate"].ToString() == "") ? (DateTime?)null : Convert.ToDateTime(dr["ValueDate"]),
                    ValueDate1 = string.IsNullOrWhiteSpace(dr["ValueDate1"].ToString()) ? "" : Convert.ToString(dr["ValueDate1"]),
                    Voucher_Date1 = string.IsNullOrWhiteSpace(dr["Voucher_Date1"].ToString()) ? "" : Convert.ToString(dr["Voucher_Date1"]),
                    Post_Date1 = string.IsNullOrWhiteSpace(dr["Post_Date1"].ToString()) ? "" : Convert.ToString(dr["Post_Date1"]),

                    Naration = Convert.ToString(dr["Naration"])
                });
            }
            return items;

        }

        /* SAPVoucherReport End */

        /* Bank Letter Report Start */
        public static List<BankLetterReportModel> GetBankLetterReport(DateTime? fromDate, DateTime? toDate)
        {

            List<BankLetterReportModel> list = new List<BankLetterReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_Bank_Letter", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = BankLetterReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_Bank_Letter", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = BankLetterReportList(dt);
                }
            }
            return list;
        }
        public static List<BankLetterReportModel> BankLetterReportList(DataTable dt)
        {
            List<BankLetterReportModel> items = new List<BankLetterReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new BankLetterReportModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    PayableAtId = Convert.ToInt32(dr["PayableAtId"]),
                    PayableAt = Convert.ToString(dr["PayableAt"]),
                    NetAmount = Convert.ToDecimal(dr["NetAmount"])
                });
            }
            return items;

        }

        /* Bank Letter Report End */

        /* Chq Issued Report Start */
        public static List<ChqIssuedReportModel> GetChqIssuedReport(DateTime? fromDate, DateTime? toDate)
        {

            List<ChqIssuedReportModel> list = new List<ChqIssuedReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_Chq_Issued", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = ChqIssuedReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_Chq_Issued", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = ChqIssuedReportList(dt);
                }
            }
            return list;
        }
        public static List<ChqIssuedReportModel> ChqIssuedReportList(DataTable dt)
        {
            List<ChqIssuedReportModel> items = new List<ChqIssuedReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new ChqIssuedReportModel
                {
                    Department = Convert.ToString(dr["Department"]),
                    Id = Convert.ToInt32(dr["Id"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    PayableAtNumber = Convert.ToString(dr["ChequeNumber"]),
                    NetAmount = Convert.ToDecimal(dr["NetAmount"]),
                    PayableAtDate = (dr["ChequeDate"] == DBNull.Value) ? (DateTime?)null : ((DateTime)dr["ChequeDate"]),
                });
            }
            return items;

        }

        /* Chq Issued Report End */


        /* TDS Deposited Report Start */
        public static List<TDSDepositedReportModel> GetTDSDepositedReport(DateTime? fromDate, DateTime? toDate)
        {
            List<TDSDepositedReportModel> list = new List<TDSDepositedReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_TDS_Deposited", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = TDSDepositedReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_TDS_Deposited", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = TDSDepositedReportList(dt);
                }
            }
            return list;
        }
        public static List<TDSDepositedReportModel> TDSDepositedReportList(DataTable dt)
        {
            List<TDSDepositedReportModel> items = new List<TDSDepositedReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new TDSDepositedReportModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    BillAmount = Convert.ToDecimal(dr["BillAmount"]),
                    GLCODE_INCOMETAX = Convert.ToString(dr["GLCODE_INCOMETAX"]),
                    IncomeTaxRate = Convert.ToDecimal(dr["IncomeTaxRate"]),
                    IncomeTax = Convert.ToDecimal(dr["IncomeTax"]),
                    Surcharge = Convert.ToDecimal(dr["Surcharge"]),
                    CES = Convert.ToDecimal(dr["CES"]),
                    Total = Convert.ToDecimal(dr["Total"])
                });
            }
            return items;

        }

        /* TDS Deposited Report End */


        /* TDS Under GST Report Start */
        public static List<TDSUnderGSTReportModel> GetTDSUnderGSTReport(DateTime? fromDate, DateTime? toDate)
        {

            List<TDSUnderGSTReportModel> list = new List<TDSUnderGSTReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate)
                  };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_TDS_Under_GST", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = TDSUnderGSTReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_TDS_Under_GST", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = TDSUnderGSTReportList(dt);
                }
            }
            return list;
        }
        public static List<TDSUnderGSTReportModel> TDSUnderGSTReportList(DataTable dt)
        {
            List<TDSUnderGSTReportModel> items = new List<TDSUnderGSTReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new TDSUnderGSTReportModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    GSTRNo = Convert.ToString(dr["GSTRNo"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    BillAmount = Convert.ToDecimal(dr["BillAmount"]),
                    GLCODE_TDSUnderSGST = Convert.ToString(dr["GLCODE_TDSUnderSGST"]),
                    TDSUnderSGSTRate = Convert.ToDecimal(dr["TDSUnderSGSTRate"]),
                    TDSUnderSGST = Convert.ToDecimal(dr["TDSUnderSGST"]),
                    GLCODE_TDSUnderCGST = Convert.ToString(dr["GLCODE_TDSUnderCGST"]),
                    TDSUnderCGSTRate = Convert.ToDecimal(dr["TDSUnderCGSTRate"]),
                    TDSUnderCGST = Convert.ToDecimal(dr["TDSUnderCGST"]),
                    GLCODE_TDSUnderIGST = Convert.ToString(dr["GLCODE_TDSUnderIGST"]),
                    TDSUnderIGSTRate = Convert.ToDecimal(dr["TDSUnderIGSTRate"]),
                    TDSUnderIGST = Convert.ToDecimal(dr["TDSUnderIGST"]),
                    HSNCode = Convert.ToString(dr["HSNCode"]),
                });
            }
            return items;

        }

        /* TDS Under GST Report End */

        /* GST Payment Report Start */
        public static List<GSTPaymentReportModel> GetGSTPaymentReport(DateTime? fromDate, DateTime? toDate)
        {
            List<GSTPaymentReportModel> list = new List<GSTPaymentReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_GST_Payment", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = GSTPaymentReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_GST_Payment", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = GSTPaymentReportList(dt);
                }
            }
            return list;
        }
        public static List<GSTPaymentReportModel> GSTPaymentReportList(DataTable dt)
        {
            List<GSTPaymentReportModel> items = new List<GSTPaymentReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new GSTPaymentReportModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    GSTRNo = Convert.ToString(dr["GSTRNo"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    BillAmount = Convert.ToDecimal(dr["BillAmount"]),
                    GLCODE_SGST = Convert.ToString(dr["GLCODE_SGST"]),
                    SGSTRate = Convert.ToDecimal(dr["SGSTRate"]),
                    SGST = Convert.ToDecimal(dr["SGST"]),
                    GLCODE_CGST = Convert.ToString(dr["GLCODE_CGST"]),
                    CGSTRate = Convert.ToDecimal(dr["CGSTRate"]),
                    CGST = Convert.ToDecimal(dr["CGST"]),
                    GLCODE_IGST = Convert.ToString(dr["GLCODE_IGST"]),
                    IGSTRate = Convert.ToDecimal(dr["IGSTRate"]),
                    IGST = Convert.ToDecimal(dr["IGST"]),
                    HSNCode = Convert.ToString(dr["HSNCode"]),
                });
            }
            return items;

        }

        /* GST Payment Report End */

        /* ETDS Filling Report Start */
        public static List<ETDSFillingReportModel> GetETDSFillingReport(DateTime? fromDate, DateTime? toDate)
        {

            List<ETDSFillingReportModel> list = new List<ETDSFillingReportModel>();
            if (fromDate.HasValue && toDate.HasValue)
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",fromDate),
                new SqlParameter("@ToDate",toDate)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_ETDS_Filling", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = ETDSFillingReportList(dt);
                }
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@fromDate",DBNull.Value),
                new SqlParameter("@ToDate",DBNull.Value)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_report_ETDS_Filling", parameters);
                if (dt.Rows.Count > 0)
                {
                    list = ETDSFillingReportList(dt);
                }
            }
            return list;
        }
        public static List<ETDSFillingReportModel> ETDSFillingReportList(DataTable dt)
        {
            List<ETDSFillingReportModel> items = new List<ETDSFillingReportModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new ETDSFillingReportModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    Department = Convert.ToString(dr["Department"]),
                    InwardDate = Convert.ToDateTime(dr["InwardDate"]),
                    BillAmount = Convert.ToDecimal(dr["BillAmount"]),
                    GLCODE_INCOMETAX = Convert.ToString(dr["GLCODE_INCOMETAX"]),
                    IncomeTaxRate = Convert.ToDecimal(dr["IncomeTaxRate"]),
                    IncomeTax = Convert.ToDecimal(dr["IncomeTax"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PartyName = Convert.ToString(dr["PartyName"]),
                    PartyAddress = Convert.ToString(dr["PartyAddress"]),
                    PANNO = Convert.ToString(dr["PANNO"]),
                });
            }
            return items;

        }

        /* ETDS Filling Report End */

    }
}