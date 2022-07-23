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
    public class PartyPaymentDB
    {
        public static PartyPaymentModel GetItem(string CreatedBy, int Id)
        {
            PartyPaymentModel obj = new PartyPaymentModel();
            if (Id == 0)
            {
                obj = new PartyPaymentModel();
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@CreatedBy",CreatedBy),
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_get_PartyPaymentRecords", parameters);
                if (dt.Rows.Count > 0)
                {
                    List<PartyPaymentModel> list = PartyPaymentList(dt);
                    if (list.Count > 0)
                        obj = list[0];
                }
            }
            return obj;
        }
        public static string AddPartyPayment(PartyPaymentModel objPartyPayment)
        {
            int RStatus;
            //DateTime InwardDate, PVDate, BillDate, PayableAtDate;
            //InwardDate =;
            //PVDate =;
            //BillDate =;
            //PayableAtDate=;
            string Response;
                SqlParameter[] parameters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(objPartyPayment.Id.ToString()) ? 0 : objPartyPayment.Id),
                new SqlParameter("@ETYPE",objPartyPayment.ETYPE),
                new SqlParameter("@InwardDate",Convert.ToDateTime(objPartyPayment.InwardDate)),
                new SqlParameter("@Department",objPartyPayment.Department),
                new SqlParameter("@PartyId",objPartyPayment.PartyId),
                new SqlParameter("@PartyAddress",objPartyPayment.PartyAddress),
                new SqlParameter("@PANNO",objPartyPayment.PANNO),
                new SqlParameter("@GSTRNo",objPartyPayment.GSTRNo),
                new SqlParameter("@PVDate",Convert.ToDateTime(objPartyPayment.PVDate)),
                new SqlParameter("@PVNO",Convert.ToString(objPartyPayment.PVNO)),
                new SqlParameter("@VoucherTypeId",objPartyPayment.VoucherTypeId),
                new SqlParameter("@PK",objPartyPayment.PK),
                new SqlParameter("@SchCode",objPartyPayment.SchCode),
                new SqlParameter("@GLCode",objPartyPayment.GLCode),
                new SqlParameter("@BillDate",Convert.ToDateTime(objPartyPayment.BillDate)),
                new SqlParameter("@BillNo",Convert.ToString(objPartyPayment.BillNo)),
                new SqlParameter("@BillAmount",Convert.ToDecimal(objPartyPayment.BillAmount)),
                new SqlParameter("@GLCODE_SGST",Convert.ToString(objPartyPayment.GLCODE_SGST)),
                new SqlParameter("@SGSTRate",Convert.ToDecimal(objPartyPayment.SGSTRate)),
                new SqlParameter("@GLCODE_CGST",Convert.ToString(objPartyPayment.GLCODE_CGST)),
                new SqlParameter("@CGSTRate",Convert.ToDecimal(objPartyPayment.CGSTRate)),
                new SqlParameter("@GLCODE_IGST",Convert.ToString(objPartyPayment.GLCODE_IGST)),
                new SqlParameter("@IGSTRate",Convert.ToDecimal(objPartyPayment.IGSTRate)),
                new SqlParameter("@TotalBill",Convert.ToDecimal(objPartyPayment.TotalBill)),
                new SqlParameter("@GLCODE_INCOMETAX",Convert.ToString(objPartyPayment.GLCODE_INCOMETAX)),
                new SqlParameter("@IncomeTaxRate",Convert.ToDecimal(objPartyPayment.IncomeTaxRate)),
                new SqlParameter("@GLCODE_TDSUnderSGST",Convert.ToString(objPartyPayment.GLCODE_TDSUnderSGST)),
                new SqlParameter("@TDSUnderSGSTRate",Convert.ToDecimal(objPartyPayment.TDSUnderSGSTRate)),
                new SqlParameter("@GLCODE_TDSUnderCGST",Convert.ToString(objPartyPayment.GLCODE_TDSUnderCGST)),
                new SqlParameter("@TDSUnderCGSTRate",Convert.ToDecimal(objPartyPayment.TDSUnderCGSTRate)),
                new SqlParameter("@GLCODE_TDSUnderIGST",Convert.ToString(objPartyPayment.GLCODE_TDSUnderIGST)),
                new SqlParameter("@TDSUnderIGSTRate",Convert.ToDecimal(objPartyPayment.TDSUnderIGSTRate)),
                new SqlParameter("@GLCODE_BANK_NETAMOUNT",Convert.ToString(objPartyPayment.GLCODE_BANK_NETAMOUNT)),
                new SqlParameter("@NetAmount",Convert.ToDecimal(objPartyPayment.NetAmount)),
                new SqlParameter("@PayableAtId",objPartyPayment.PayableAtId),
                new SqlParameter("@PayableAtNumber",string.IsNullOrWhiteSpace(objPartyPayment.PayableAtNumber)?"":objPartyPayment.PayableAtNumber),
                new SqlParameter("@PayableAtDate",Convert.ToDateTime(objPartyPayment.PayableAtDate)),
                new SqlParameter("@HSNCode",objPartyPayment.HSNCode),
                new SqlParameter("@CreatedBy",objPartyPayment.CreatedBy)
             };

            foreach (SqlParameter sp in parameters)
            {
                if (sp.Value == null)
                {
                    sp.Value = DBNull.Value;
                }
            }
                RStatus = CommonDB.DMLOperation("vpm_sp_insert_update_PartyPayment", parameters);
                if (RStatus == 1)
                {
                    Response = MessageHelper.Success;
                }
                else if (RStatus == 2)
                {
                    Response = MessageHelper.DuplicateRecord;
                }
                else
                {
                    Response = MessageHelper.Internal_DB_Error;
                }
                return Response;
           }


        public static List<PartyPaymentModel> GetPartyPayment(string CreatedBy, int Id)
        {
                SqlParameter[] parameters = {
                new SqlParameter("@CreatedBy",CreatedBy),
                new SqlParameter("@Id",Id)
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_get_PartyPaymentRecords", parameters);
                List<PartyPaymentModel> items = PartyPaymentList(dt);
               return items;
        }
        public static List<PartyPaymentModel> PartyPaymentList(DataTable dt)
            {
            List<PartyPaymentModel> items = new List<PartyPaymentModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new PartyPaymentModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    ETYPE = Convert.ToString(dr["ETYPE"]),
                    InwardDate = Convert.ToDateTime(dr["InwardDate"]),
                    Department = Convert.ToString(dr["Department"]),
                    PartyId = Convert.ToInt32(dr["PartyId"]),
                    PVDate = Convert.ToDateTime(dr["PVDate"]),
                    PVNO = Convert.ToString(dr["PVNo"]),
                    VoucherTypeId = Convert.ToInt32(dr["VoucherTypeId"]),
                    PK = Convert.ToString(dr["PK"]),
                    SchCode = Convert.ToString(dr["SchCode"]),
                    GLCode = Convert.ToString(dr["GLCode"]),
                    BillDate = Convert.ToDateTime(dr["BillDate"]),
                    BillNo = Convert.ToString(dr["BillNo"]),
                    BillAmount = Convert.ToInt32(dr["BillAmount"]),
                    SGSTRate = Convert.ToDecimal(dr["SGSTRate"]),
                    CGSTRate = Convert.ToDecimal(dr["CGSTRate"]),
                    IGSTRate = Convert.ToDecimal(dr["IGSTRate"]),
                    TotalBill = Convert.ToDecimal(dr["TotalBill"]),
                    IncomeTaxRate = Convert.ToDecimal(dr["IncomeTaxRate"]),
                    TDSUnderSGSTRate = Convert.ToDecimal(dr["TDSUnderSGSTRate"]),
                    TDSUnderCGSTRate = Convert.ToDecimal(dr["TDSUnderCGSTRate"]),
                    TDSUnderIGSTRate = Convert.ToDecimal(dr["TDSUnderIGSTRate"]),
                    NetAmount = Convert.ToDecimal(dr["NetAmount"]),
                    PayableAtId = Convert.ToInt32(dr["PayableAtId"]),
                    HSNCode = Convert.ToString(dr["HSNCode"]),
                    PartyName= Convert.ToString(dr["PartyName"]),
                    GSTRNo= Convert.ToString(dr["GSTRNo"]),
                    PartyAddress= Convert.ToString(dr["PartyAddress"]),
                    PANNO = Convert.ToString(dr["PANNO"]),
                    PayableAtNumber = Convert.ToString(dr["PayableAtNumber"]),
                    PayableAtDate = (dr["PayableAtDate"] == DBNull.Value) ? (DateTime?)null : ((DateTime)dr["PayableAtDate"]),
                    GLCODE_SGST= Convert.ToString(dr["GLCODE_SGST"]),
                    GLCODE_CGST = Convert.ToString(dr["GLCODE_CGST"]),
                    GLCODE_IGST = Convert.ToString(dr["GLCODE_IGST"]),
                    GLCODE_INCOMETAX = Convert.ToString(dr["GLCODE_INCOMETAX"]),
                    GLCODE_TDSUnderSGST = Convert.ToString(dr["GLCODE_TDSUnderSGST"]),
                    GLCODE_TDSUnderCGST = Convert.ToString(dr["GLCODE_TDSUnderCGST"]),
                    GLCODE_TDSUnderIGST = Convert.ToString(dr["GLCODE_TDSUnderIGST"]),
                    GLCODE_BANK_NETAMOUNT = Convert.ToString(dr["GLCODE_BANK_NETAMOUNT"]),
                });
            }
            
            return items;
            
        }

    }
}