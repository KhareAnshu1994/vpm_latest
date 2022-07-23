using Cylsys.Common;
using MicroORM;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace VPM.Web.Models
{
    public class Role
    {
        public RoleModel GetItem(int id)
        {
            RoleModel bll = new RoleModel();
            if (id == 0)
            {
                bll = new RoleModel();
            }
            else
            {
                SqlParameter[] Params = {
                                       new SqlParameter("@ID", id),

                                         };
                DataTable DT = DataAccess.ExecuteParaQuery(GetQuery.ROLE_DATA_SEQID, Params);
                if (DT.Rows.Count > 0)
                {
                    List<RoleModel> rolelist = QueryHandler.GetRoleGridList(DT);
                    if (rolelist.Count > 0)
                        bll = rolelist[0];
                }
            }
            return bll;


        }
        public string Save(RoleModel model)
        {
            string Response = string.Empty;
            DbCommonHelper dbcom = new DbCommonHelper();

            List<UserModel> bll = new List<UserModel>();

            SqlParameter[] Params = {
                                            new SqlParameter("@Code",model.Code),
                                            new SqlParameter("@Name",model.Name),
                                            new SqlParameter("@IsActive",model.isactive),
                                            new SqlParameter("@ID", model.ID),
                                            new SqlParameter("@UserID",UserManager.User.Code),
                                      };


            Response = dbcom.Save("VPM_SP_ROLE_MASTER_ACTIVITY", Params);
            return Response;
        }

        public List<RoleModel> GetRoleGrid()
        {
            List<RoleModel> RM_LIST = new List<RoleModel>();
            DataTable DT = DataAccess.ExecuteQuery(GetQuery.ROLE_GRID_DATA);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetRoleGridList(DT);
            }
            return RM_LIST;
        }
    }
}