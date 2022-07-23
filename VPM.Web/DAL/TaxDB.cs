using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VPM.Web.Models;
using VPM.Web.DAL;
using Cylsys.Common;

namespace VPM.Web.DAL
{
    public class TaxDB
    {
        public static string Func_AddTax(TaxModel objTax)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
                new SqlParameter("@TaxName",objTax.TaxName)
            };
            RStatus = CommonDB.DMLOperation("vpm_sp_Insert_update_Tax_Details", parameters);
            if (RStatus == 1)
            {
                Response = MessageHelper.Success;
            }
            else if (RStatus == 2)
            {
                Response = MessageHelper.DuplicateRecord;
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


        public static string Func_AddTaxation(TaxationModel objTaxation)
        {
            int RStatus;
            string Response;
            if (objTaxation.Status == "ITemptbl")
            {
                SqlParameter[] parameters = {
                new SqlParameter("@TaxId",objTaxation.TaxId),
                new SqlParameter("@TaxPercentage",objTaxation.TaxPercentage),
                new SqlParameter("@Remark",objTaxation.Remark),
                new SqlParameter("@CreatedBy",objTaxation.Createdby),
                new SqlParameter("@Status",objTaxation.Status),
                };
                RStatus= CommonDB.DMLOperation("vpm_sp_Insert_update_TaxationMaster", parameters);
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
            else if (objTaxation.Status == "IMaintbl")
            {
                SqlParameter[] parameters = {
                new SqlParameter("@TaxId",objTaxation.TaxId),
                new SqlParameter("@TaxPercentage",objTaxation.TaxPercentage),
                new SqlParameter("@Remark",objTaxation.Remark),
                new SqlParameter("@CreatedBy",objTaxation.Createdby),
                new SqlParameter("@Status","IMaintbl")
                };
                RStatus = CommonDB.DMLOperation("vpm_sp_Insert_update_TaxationMaster", parameters);
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
            else
            {
                Response = MessageHelper.Fail;
            }
            return Response;

        }

        public static string Func_DeleteTempTaxation(int Id)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
                new SqlParameter("@Id",Id)
                };
            RStatus = CommonDB.DMLOperation("vpm_sp_delete_TempTaxation_Records", parameters);
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
        
        public static List<SelectListItem> Func_GetTaxRateDetails(int Id)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            SqlParameter[] parameters = {
            new SqlParameter("@TaxId",Id)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_Get_TaxRateDetails", parameters);
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new SelectListItem
                {
                    Text = dr["TaxPercentage"].ToString(),
                    Value = dr["TaxPercentage"].ToString()
                });
            }
            return items;
        }

        public static string EditTaxation(TaxationModel objTaxation)
        {
                int RStatus;
                string Response;
                SqlParameter[] parameters = {
                new SqlParameter("@Id",objTaxation.Id),
                new SqlParameter("@TaxId",objTaxation.TaxId),
                new SqlParameter("@TaxPercentage",objTaxation.TaxPercentage),
                new SqlParameter("@Remark",objTaxation.Remark),
                new SqlParameter("@CreatedBy",objTaxation.Createdby),
                };
                RStatus = CommonDB.DMLOperation("vpm_sp_Edit_Taxation_record_by_Id", parameters);
                if (RStatus == 1)
                {
                    Response = MessageHelper.Success;
                }
                else
                {
                    Response = MessageHelper.Internal_DB_Error;
                }
                return Response;

       }
        public static List<TaxationModel> Func_GetTaxationRecords(string CreatedBy,string Status)
        {
            
            SqlParameter[] parameters = {
             new SqlParameter("@CreatedBy",CreatedBy),
             new SqlParameter("@Status",Status),
            };
            DataTable dt= CommonDB.GetRecord("vpm_sp_Get_TaxationRecords", parameters);
            List<TaxationModel> items=new List<TaxationModel>();
            if (dt.Rows.Count>0)
            {
                items = GetTaxationList(dt);
            }
            return items;
        }
        public static TaxationModel GetTaxationRecordsById(int Id)
        {
            SqlParameter[] parameters = {
             new SqlParameter("@Id",Id)
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_get_Taxation_record_by_Id", parameters);
            TaxationModel obj = new TaxationModel();
            if (dt.Rows.Count > 0)
            {
                List<TaxationModel> list = GetTaxationById(dt);
                if (list.Count > 0)
                    obj = list[0];
            }
            return obj;
        }
        public static string DeleteTaxationRecordsById(int Id)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
             new SqlParameter("@Id",Id)
            };
            RStatus = CommonDB.DMLOperation("vpm_sp_delete_Taxation_record_by_Id", parameters);
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
        public static List<TaxationModel> GetTaxationList(DataTable dt)
        {
            List<TaxationModel> items = new List<TaxationModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new TaxationModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    TaxName = Convert.ToString(dr["TaxName"]),
                    TaxPercentage = Convert.ToDecimal(dr["TaxPercentage"]),
                    Remark = Convert.ToString(dr["Remark"]),
                    Createdby = Convert.ToString(dr["Createdby"])
                });

            }
            return items;
        }

        public static List<TaxationModel> GetTaxationById(DataTable dt)
        {
            List<TaxationModel> items = new List<TaxationModel>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new TaxationModel
                {
                    Id = Convert.ToInt32(dr["Id"]),
                    TaxId = Convert.ToInt32(dr["TaxId"]),
                    TaxPercentage = Convert.ToDecimal(dr["TaxPercentage"]),
                    Remark = Convert.ToString(dr["Remark"]),
                    Createdby = Convert.ToString(dr["Createdby"])
                });

            }
            return items;
        }
    }
}