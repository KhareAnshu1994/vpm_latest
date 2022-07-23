using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using VPM.Web.Models;
using VPM.Web.DAL;
using System;
using Cylsys.Common;

namespace VPM.Web.Models
{
    public class LovDB
    {
        public static LovModel GetItem(int Id)
        {
            LovModel obj = new LovModel();
            if (Id == 0)
            {
                obj = new LovModel();
            }
            else
            {
                SqlParameter[] paramenters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id)
                };
                DataTable DT = CommonDB.GetRecord("vpm_sp_get_Lov_details", paramenters);
                if (DT.Rows.Count > 0)
                {
                    List<LovModel> list = GetLovList(DT);
                    if (list.Count > 0)
                        obj = list[0];
                 }
            }
            return obj;
        }


      
        public static string Save(LovModel model)
        {
            int RStatus;
            string Response;
            SqlParameter[] Params = {
            new SqlParameter("@PId",model.ID),
            new SqlParameter("@PCategoryId",model.CategoryId),
            new SqlParameter("@PCode",model.Code),
            new SqlParameter("@PName",model.Name),
            new SqlParameter("@PIsActive",model.Isactive),
            };
            RStatus = CommonDB.DMLOperation("vpm_sp_insert_update_Lov", Params);
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
        public static List<LovModel> GetLovGrid()
        {
            int Id = 0;
            List<LovModel> LIST = new List<LovModel>();
            SqlParameter[] paramenters = {
            new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id)
            };
            DataTable DT = CommonDB.GetRecord("vpm_sp_get_Lov_details", paramenters);
            if (DT.Rows.Count > 0)
            {
                LIST = GetLovList(DT);
            }
            return LIST;

        }

        public static string DeleteItem(int id)
        {
            int rstatus;
            string Response;
            SqlParameter[] Params = {
            new SqlParameter("@PId",id),
            };
            rstatus = CommonDB.DMLOperation("amefricash_admin_sp_delete_lov_records", Params);
            if (rstatus == 1)
            {
                Response = MessageHelper.DeleteRecord;
            }
            else if (rstatus == 3)
            {
                Response = MessageHelper.Exists_Sub_Record;
            }
            else
            {
                Response = MessageHelper.Internal_DB_Error;
            }
            return Response;
        }

        public static List<LovModel> GetLovList(DataTable dt)
        {
            List<LovModel> list = new List<LovModel>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new LovModel
                {
                    ID = Convert.ToInt32(dr["Id"]),
                    Code = Convert.ToString(dr["SubCode"]),
                    Name = Convert.ToString(dr["Name"]),
                    Isactive = Convert.ToBoolean(dr["Is_Active"]),
                    CategoryId= Convert.ToInt32(dr["Category_Id"]),
                    Category_Code = Convert.ToString(dr["CategoryCode"]),
                });
            }
            return list;
        }
    }
}