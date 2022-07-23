using Cylsys.Common;
using MicroORM;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VPM.Web.Models
{
    public class MenuRoleMap
    {
        public List<MenuModel> GetMenusGrid()
        {
            RoleModel bll = new RoleModel();

            List<MenuModel> RM_LIST = new List<MenuModel>();

            DataTable DT = DataAccess.ExecuteQuery(GetQuery.MENU_LIST_DATA);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetMenuRoleGridList(DT);
            }
            return RM_LIST;
        }
        public string Save(List<MenuModel> model, int role_id)
        {
            string Response = string.Empty;
            List<MenuModel> bll = new List<MenuModel>();
            DbCommonHelper dbcom = new DbCommonHelper();
            int rowcount = 0;

            foreach (MenuModel mmmodel in model)
            {
                if (mmmodel.select_status)
                {
                    rowcount++;

                    SqlParameter[] Insert_Parameters = {
                                             new SqlParameter("@menu_id",mmmodel.ID),
                                             new SqlParameter("@role_id",role_id),
                                             new SqlParameter("created_date",DateTime.Now),
                                             new SqlParameter("isactive",true)
                                                       };

                    SqlParameter[] Select_Parameters = {
                                             new SqlParameter("@role_id",role_id)
                                                      };

                    SqlParameter[] update_Parameters = {
                                             new SqlParameter("@role_id",role_id)
                                                       };

                    Response = dbcom.Save2(GetQuery.MENU_ROLE_MAPPING_INSERT_QUERY, GetQuery.DELETE_OLD_MENU_ROLE_MAPPING_QUERY, Insert_Parameters, update_Parameters, rowcount);
                }
            }
            return Response;
        }
        public List<MenuRoleMappingModel> GetAssignedMenuToRole(int RoleID)
        {
            MenuRoleMappingModel bll = new MenuRoleMappingModel();

            List<MenuRoleMappingModel> RM_LIST = new List<MenuRoleMappingModel>();

            SqlParameter[] parameters = {
                new SqlParameter("@role_id",RoleID)

            };

            DataTable DT = DataAccess.ExecuteParaQuery(GetQuery.GET_ASSIGNED_MENU_TO_ROLE, parameters);
            //DataTable DT = DataAccess.ExecuteParaQuery(@"select * from ems_tbl_release_for_payment where activity_date=@activity_date", param);

            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetAssignedMenuToRole(DT);
            }
            return RM_LIST;
        }
    }
}