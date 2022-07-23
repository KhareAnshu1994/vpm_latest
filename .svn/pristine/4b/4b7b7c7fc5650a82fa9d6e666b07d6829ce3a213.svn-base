using Cylsys.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using VPM.Web.Models;

namespace VPM.Web.DAL
{
    public class PaymentMultipleSchemeDB
    {
        public static PaymentMultipleSchemeModel GetPaymentMultipleScheme(string BillNo)
        {
            PaymentMultipleSchemeModel obj = new PaymentMultipleSchemeModel();
            if (BillNo=="")
            {
                obj = new PaymentMultipleSchemeModel();
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@BillNo",string.IsNullOrEmpty(BillNo)?"":BillNo),
                };
                DataTable dt = CommonDB.GetRecord("vpm_sp_get_payment_multiple_scheme_by_BillNo", parameters);
                if (dt.Rows.Count > 0 && (dt.Rows[0][0].ToString().Length> 0) && (dt.Rows[0][1].ToString().Length>0))
                {
                    obj.NetBillAmount =Convert.ToDecimal(dt.Rows[0][0].ToString());
                    obj.NetTotalBill= Convert.ToDecimal(dt.Rows[0][1].ToString());
                }
                else
                {
                    obj.NetBillAmount =0;
                    obj.NetTotalBill = 0;
                }
            }
            return obj;
        }

        public static string DeleteTempPMS(int Id)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id)
                };
            RStatus = CommonDB.DMLOperation("vpm_sp_delete_payment_multiple_scheme", parameters);
            if (RStatus == 4)
            {
                Response = MessageHelper.DeleteRecord;
            }
            else if (RStatus == 3)
            {
                Response = MessageHelper.IdNotValid;
            }
            else
            {
                Response = MessageHelper.Internal_DB_Error;
            }
            return Response;

        }
        public static string AddPaymentMultipleScheme(PaymentMultipleSchemeModel objPartyPayment)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(objPartyPayment.Id.ToString()) ? 0 : objPartyPayment.Id),
                new SqlParameter("@BillNo",Convert.ToString(objPartyPayment.BillNo)),
                new SqlParameter("@BillDate",Convert.ToDateTime(objPartyPayment.BillDate)),
                new SqlParameter("@SchCode",objPartyPayment.SchCode),
                new SqlParameter("@GLCode",objPartyPayment.GLCode),
                new SqlParameter("@BillAmount",Convert.ToDecimal(objPartyPayment.BillAmount)),
                new SqlParameter("@GLCODE_SGST",Convert.ToString(objPartyPayment.GLCODE_SGST)),
                new SqlParameter("@SGSTRate",Convert.ToDecimal(objPartyPayment.SGSTRate)),
                new SqlParameter("@GLCODE_CGST",Convert.ToString(objPartyPayment.GLCODE_CGST)),
                new SqlParameter("@CGSTRate",Convert.ToDecimal(objPartyPayment.CGSTRate)),
                new SqlParameter("@GLCODE_IGST",Convert.ToString(objPartyPayment.GLCODE_IGST)),
                new SqlParameter("@IGSTRate",Convert.ToDecimal(objPartyPayment.IGSTRate)),
                new SqlParameter("@TotalBill",Convert.ToDecimal(objPartyPayment.TotalBill)),
                };

            foreach (SqlParameter sp in parameters)
            {
                if (sp.Value == null)
                {
                    sp.Value = DBNull.Value;
                }
            }
            RStatus = CommonDB.DMLOperation("vpm_sp_insert_update_temp_payment_multiple_scheme", parameters);
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


        public static List<PaymentMultipleSchemeModel> GetPaymentMultipleSchemeList(string BillNo)
        {
            SqlParameter[] parameters = {
                new SqlParameter("@BillNo",BillNo)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_get_payment_multiple_scheme_List_by_BillNo", parameters);
            List<PaymentMultipleSchemeModel> items = PaymentMultipleSchemeList(dt);
            return items;
        }

        //public static string GetPMSSumOfTotalBill(string BillNo)
        //{
        //    SqlParameter[] parameters = {
        //        new SqlParameter("@BillNo",BillNo)
        //    };
        //    string sumOftotalBill= CommonDB.ReturnsingleValue("vpm_sp_get_sum_of_totalbill_payment_multiple_scheme", parameters);
        //    return sumOftotalBill;
        //}

        public static List<PaymentMultipleSchemeModel> PaymentMultipleSchemeList(DataTable dt)
        {
            List<PaymentMultipleSchemeModel> items = new List<PaymentMultipleSchemeModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new PaymentMultipleSchemeModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    SchCode = Convert.ToString(dr["SchCode"]),
                    GLCode = Convert.ToString(dr["GLCode"]),
                    BillDate = Convert.ToDateTime(dr["BillDate"]),
                    BillNo = Convert.ToString(dr["BillNo"]),
                    BillAmount = Convert.ToInt32(dr["BillAmount"]),
                    SGSTRate = Convert.ToDecimal(dr["SGSTRate"]),
                    CGSTRate = Convert.ToDecimal(dr["CGSTRate"]),
                    IGSTRate = Convert.ToDecimal(dr["IGSTRate"]),
                    TotalBill = Convert.ToDecimal(dr["TotalBill"]),
                    GLCODE_SGST = Convert.ToString(dr["GLCODE_SGST"]),
                    GLCODE_CGST = Convert.ToString(dr["GLCODE_CGST"]),
                    GLCODE_IGST = Convert.ToString(dr["GLCODE_IGST"]),
                });
            }

            return items;

        }
    }
}