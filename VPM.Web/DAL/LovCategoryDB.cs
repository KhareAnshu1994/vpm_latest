using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using VPM.Web.Models;
using VPM.Web.DAL;
using Cylsys.Common;
using System;


namespace VPM.Web.Models
{
    public class LovCategoryDB
    {
        public static LovCategoryModel GetItem(int Id)
        {
            LovCategoryModel obj = new LovCategoryModel();
            if (Id == 0)
            {
                obj = new LovCategoryModel();
            }
            else
            {
                SqlParameter[] paramenters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id)
                };
                DataTable DT = CommonDB.GetRecord("vpm_sp_get_Lov_Category_details", paramenters);
                if (DT.Rows.Count > 0)
                {
                    List<LovCategoryModel> list = GetLovCategoryList(DT);
                    if (list.Count > 0)
                        obj = list[0];
                }
            }
            return obj;
        }
        public static string Save(LovCategoryModel model)
        {
            int RStatus;
            string Response;
            SqlParameter[] Params = {
            new SqlParameter("@PId",model.ID),
            new SqlParameter("@PCode",model.Code),
            new SqlParameter("@PName",model.Name),
            new SqlParameter("@PIsActive",model.isactive),
            };
            RStatus = CommonDB.DMLOperation("vpm_sp_insert_update_Lov_Category", Params);
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

        public static List<LovCategoryModel> GetLovCategoryGrid()
        {
            int Id=0;
            List<LovCategoryModel> LIST = new List<LovCategoryModel>();
            SqlParameter[] paramenters = { new SqlParameter("@Id", Id)};
            DataTable DT = CommonDB.GetRecord("vpm_sp_get_Lov_Category_details", paramenters);
            if (DT.Rows.Count > 0)
            {
                LIST = GetLovCategoryList(DT);
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
            rstatus = CommonDB.DMLOperation("vpm_sp_delete_lov_category_records", Params);
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

        public static List<LovCategoryModel> GetLovCategoryList(DataTable dt)
        {
            List<LovCategoryModel> list = new List<LovCategoryModel>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new LovCategoryModel
                {
                    ID = Convert.ToInt32(dr["Id"]),
                    Code = Convert.ToString(dr["Code"]),
                    Name = Convert.ToString(dr["Name"]),
                    isactive = Convert.ToBoolean(dr["Is_Active"]),
                    created_date = Convert.ToDateTime(dr["Created_Date"]),
            });
            }
            return list;
        }
    }

}
