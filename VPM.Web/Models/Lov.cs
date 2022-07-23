using Cylsys.Common;
using MicroORM;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace VPM.Web.Models
{
    public class Lov
    {
        public LovModel GetItem(int id)
        {
            LovModel bll = new LovModel();
            if (id == 0)
            {
                bll = new LovModel();
            }
            else
            {
                MySqlParameter[] Params = { new MySqlParameter("@ID", id), };
                //DataTable DT = DataAccessKT.ExecuteParaQuery(GetQuery.ROLE_DATA_SEQID, Params);
                DataTable DT = DataAccessKT.ExecuteParaQuery(GetQuery.Lov_DATA_SEQID, Params);
                if (DT.Rows.Count > 0)
                {
                    List<LovModel> rolelist = QueryHandler.GetLovGridList(DT);
                    if (rolelist.Count > 0)
                        bll = rolelist[0];
                }
            }
            return bll;


        }
        public string Save(LovModel model)
        {
            string Response = string.Empty;

            DbCommonHelperKT dbcom = new DbCommonHelperKT();
            List<UserModel> bll = new List<UserModel>();

            MySqlParameter[] Params = {
            new MySqlParameter("@PCategoryId",model.CategoryId),
            new MySqlParameter("@PCode",model.Code),
            new MySqlParameter("@PName",model.Name),
            };

            Response = dbcom.Save("sp_AddLov", Params);
            return Response;
        }

        public string Edit(LovModel model)
        {
            string Response = string.Empty;

            DbCommonHelperKT dbcom = new DbCommonHelperKT();
            List<UserModel> bll = new List<UserModel>();

            MySqlParameter[] Params = {
            new MySqlParameter("@PId",model.ID),
            new MySqlParameter("@PCategoryId",model.CategoryId),
            new MySqlParameter("@PCode",model.Code),
            new MySqlParameter("@PName",model.Name),
            new MySqlParameter("@PIsActive",model.Isactive),
            };
            Response = dbcom.Save("spEditLov", Params);
            return Response;
        }
        public List<LovModel> GetLovGrid()
        {
            LovModel bll = new LovModel();

            List<LovModel> RM_LIST = new List<LovModel>();

            //DataTable DT = DataAccessKT.ExecuteQuery(GetQuery.ROLE_GRID_DATA);
            DataTable DT = DataAccessKT.ExecuteQuery(GetQuery.Lov_GRID_DATA);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetLovGridList(DT);
            }
            return RM_LIST;
        }
    }
}