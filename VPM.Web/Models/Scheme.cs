using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Cylsys.Common;
using MicroORM;

namespace VPM.Web.Models
{
    public class Scheme
    {
        public SchemeModel GetItem(int id)
        {
            SchemeModel bll = new SchemeModel();
            if (id == 0)
            {
                bll = new SchemeModel();
            }
            else
            {
                SqlParameter[] Params = {
                                       new SqlParameter("@ID", id),

                                         };
                DataTable DT = DataAccess.ExecuteParaQuery(GetQuery.SCHEME_DATA_ID, Params);
                if (DT.Rows.Count > 0)
                {
                    List<SchemeModel> rolelist = QueryHandler.GetSchemeGridList(DT);
                    if (rolelist.Count > 0)
                        bll = rolelist[0];
                }
            }
            return bll;


        }
        public string Save(SchemeModel model)
        {
            string Response = string.Empty;

            DbCommonHelper dbcom = new DbCommonHelper();

            List<UserModel> bll = new List<UserModel>();

            SqlParameter[] Params = {
                                            new SqlParameter("@ID",model.ID),
                                            new SqlParameter("@Code",model.Code),
                                            new SqlParameter("@Name",model.Name),
                                            new SqlParameter("@IsActive",model.IsActive),
                                            new SqlParameter("@UserID",UserManager.User.Code),

                                         };


            Response = dbcom.Save("oms_sp_add_update_scheme_detail", Params);
            return Response;
        }

        public List<SchemeModel> GetSchemeGrid()
        {
            SchemeModel bll = new SchemeModel();

            List<SchemeModel> RM_LIST = new List<SchemeModel>();

            DataTable DT = DataAccess.ExecuteQuery(GetQuery.SCHEME_GRID_DATA);
            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetSchemeGridList(DT);
            }
            return RM_LIST;
        }
    }
}