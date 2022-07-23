using Cylsys.Common;
using MicroORM;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;       

namespace VPM.Web.Models
{
    public class LovCategory
    {
        public LovCategoryModel GetItem(int id)
        {
            LovCategoryModel bll = new LovCategoryModel();
            if (id == 0)
            {
                bll = new LovCategoryModel();
            }
            else
            {
                SqlParameter[] Params = {new SqlParameter("@ID", id),};
                DataTable DT = DataAccess.ExecuteParaQuery(GetQuery.ROLE_DATA_SEQID, Params);
                //taTable DT = DataAccessKT.ExecuteParaQuery(GetQuery.LovCategory_DATA_SEQID, Params);
                if (DT.Rows.Count > 0)
                {
                    List<LovCategoryModel> rolelist = QueryHandler.GetLovCategoryGridList(DT);
                    if (rolelist.Count > 0)
                        bll = rolelist[0];
                }
            }
            return bll;


        }
        public string Save(LovCategoryModel model)
        {
            string Response = string.Empty;

            DbCommonHelper dbcom = new DbCommonHelper();
            List<UserModel> bll = new List<UserModel>();

            SqlParameter[] Params = {
            new SqlParameter("@PCode",model.Code),
            new SqlParameter("@PName",model.Name),
            };

            Response = dbcom.Save("sp_AddLov_Category", Params);
            return Response;
        }

        public string Edit(LovCategoryModel model)
        {
            string Response = string.Empty;

            DbCommonHelper dbcom = new DbCommonHelper();
            List<UserModel> bll = new List<UserModel>();

            SqlParameter[] Params = {
            new SqlParameter("@PId",model.ID),
            new SqlParameter("@PCode",model.Code),
            new SqlParameter("@PName",model.Name),
            new SqlParameter("@PIsActive",model.isactive),
            };

            Response = dbcom.Save("spEditLovCategory", Params);
            return Response;
        }
        public List<LovCategoryModel> GetLovCategoryGrid()
        {
            LovCategoryModel bll = new LovCategoryModel();

            List<LovCategoryModel> RM_LIST = new List<LovCategoryModel>();

            DataTable DT = DataAccess.ExecuteQuery(GetQuery.ROLE_GRID_DATA);
         //   DataTable DT = DataAccessKT.ExecuteQuery(GetQuery.LovCategory_GRID_DATA);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetLovCategoryGridList(DT);
            }
            return RM_LIST;
        }
    }

}
