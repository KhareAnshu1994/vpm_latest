using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cylsys.Common;

using System.Data;
using MicroORM;
using System.Data.SqlClient;

namespace VPM.Web.Models
{
    public class User
    {
        public UserModel GetItem(int id)
        {
            UserModel bll = new UserModel();
            if (id == 0)
            {
                bll = new UserModel();
            }
            else
            {
                SqlParameter[] Params = { new SqlParameter("@ID", id)};

                DataTable DT = DataAccess.ExecuteParaQuery(GetQuery.USER_DATA_BY_ID, Params);
                if (DT.Rows.Count > 0)
                {
                    List<UserModel> userlist = QueryHandler.GetUserGridList(DT);
                    if (userlist.Count > 0)
                        bll = userlist[0];
                }
            }
            return bll;
        }
        public string Save(UserModel model)
        {
            string Response = string.Empty;
            List<UserModel> bll = new List<UserModel>();
            DbCommonHelper dbcom = new DbCommonHelper();


            SqlParameter[] Params = {
                                            new SqlParameter("@Code",model.Code),
                                            new SqlParameter("@Name",model.Name),
                                            new SqlParameter("@Email",model.Email),
                                            new SqlParameter("@IsActive",model.isactive),
                                            new SqlParameter("@RoleID",model.role_id),
                                            new SqlParameter("@ID", model.ID),
                                            new SqlParameter("@UserID",UserManager.User.Code),

                                         };


            Response = dbcom.Save("VPM_SP_USER_MASTER_ACTIVITY", Params);
          //  Response = dbcom.Save("PPS_SP_USER_MASTER_ACTIVITY", Params);
            return Response;
        }

        public List<UserModel> GetRoleGrid()
        {
            UserModel bll = new UserModel();

            List<UserModel> RM_LIST = new List<UserModel>();

            DataTable DT = DataAccess.ExecuteQuery(GetQuery.USER_GRID_DATA);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetUserGridList(DT);
            }
            return RM_LIST;
        }
    }
}