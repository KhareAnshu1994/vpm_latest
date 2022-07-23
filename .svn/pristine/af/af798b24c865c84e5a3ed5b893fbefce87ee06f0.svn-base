using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cylsys.Common;

namespace Cylsys.Common
{
    public class QueryHandler
    {

        static List<RecordException> RECORDED_ERR_LIST = new List<RecordException>();

        /* Kapil Code Start*/
        public static List<LovCategoryModel> GetLovCategoryGridList(DataTable DT)
        {
            List<LovCategoryModel> REM_LIST2 = new List<LovCategoryModel>();
            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                LovCategoryModel REM = new LovCategoryModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.Code = string.IsNullOrWhiteSpace(drow["code"].ToString()) ? "" : drow["code"].ToString();
                    REM.Name = string.IsNullOrWhiteSpace(drow["name"].ToString()) ? "" : drow["name"].ToString();
                    REM.isactive = string.IsNullOrWhiteSpace(drow["is_active"].ToString()) ? false : Convert.ToBoolean(drow["is_active"]);
                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }

        public static List<LovModel> GetLovGridList(DataTable DT)
        {
            List<LovModel> REM_LIST2 = new List<LovModel>();
            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                LovModel REM = new LovModel();
                // try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.CategoryId = string.IsNullOrWhiteSpace(drow["Category_Id"].ToString()) ? 0 : Convert.ToInt32(drow["Category_Id"].ToString());
                    REM.Code = string.IsNullOrWhiteSpace(drow["code"].ToString()) ? "" : drow["code"].ToString();
                    REM.Name = string.IsNullOrWhiteSpace(drow["name"].ToString()) ? "" : drow["name"].ToString();
                    REM.Isactive = string.IsNullOrWhiteSpace(drow["is_active"].ToString()) ? false : Convert.ToBoolean(drow["is_active"]);
                    REM_LIST2.Add(REM);
                }
                //catch (Exception ex)
                //{
                //    if (RecordCount < 1)
                //    {
                //        RecordException RException = new RecordException();
                //        RException.FILE_NAME = null;
                //        RException.ERR_MSG = ex.Message;
                //        RECORDED_ERR_LIST.Add(RException);
                //    }
                //}

            }
            return REM_LIST2;
        }
        /* Kapil Code End*/

        public static List<RoleModel> GetRoleGridList(DataTable DT)
        {
            List<RoleModel> REM_LIST2 = new List<RoleModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                RoleModel REM = new RoleModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.Code = string.IsNullOrWhiteSpace(drow["code"].ToString()) ? "" : drow["code"].ToString();
                    REM.Name = string.IsNullOrWhiteSpace(drow["name"].ToString()) ? "" : drow["name"].ToString();
                    REM.isactive = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"]);

                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }
        public static List<SchemeModel> GetSchemeGridList(DataTable DT)
        {
            List<SchemeModel> REM_LIST2 = new List<SchemeModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                SchemeModel REM = new SchemeModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.Code= string.IsNullOrWhiteSpace(drow["code"].ToString()) ? "" : drow["code"].ToString();
                    REM.Name = string.IsNullOrWhiteSpace(drow["name"].ToString()) ? "" : drow["name"].ToString();
                    REM.IsActive = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"]);

                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }
        public static List<OrderManagementModel> GetOrderManagementGridList(DataTable DT)
        {
            List<OrderManagementModel> REM_LIST2 = new List<OrderManagementModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                OrderManagementModel REM = new OrderManagementModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.system_date = string.IsNullOrWhiteSpace(drow["system_date"].ToString()) ? Convert.ToDateTime(DateTime.Now.ToString("1900-01-01")) : Convert.ToDateTime(drow["system_date"]);
                    REM.system_time = string.IsNullOrWhiteSpace(drow["system_time"].ToString()) ? Convert.ToDateTime(DateTime.Now.ToString("1900-01-01")) : Convert.ToDateTime(drow["system_time"]);
                    REM.scheme_ids = string.IsNullOrWhiteSpace(drow["scheme_ids"].ToString()) ? "" : drow["scheme_ids"].ToString();
                    REM.scheme_name = string.IsNullOrWhiteSpace(drow["scheme_name"].ToString()) ? "" : drow["scheme_name"].ToString();
                    REM.security_name = string.IsNullOrWhiteSpace(drow["security_name"].ToString()) ? "" : drow["security_name"].ToString();
                    REM.security_type_id = string.IsNullOrWhiteSpace(drow["security_type_id"].ToString()) ? 0 : Convert.ToInt32(drow["security_type_id"]);
                    REM.other_security_type = string.IsNullOrWhiteSpace(drow["other_security_type"].ToString()) ? "" : drow["other_security_type"].ToString();
                    REM.security_type = string.IsNullOrWhiteSpace(drow["security_type"].ToString()) ? "" : drow["security_type"].ToString();
                    REM.toggle_id = string.IsNullOrWhiteSpace(drow["toggle_id"].ToString()) ? 0 : Convert.ToInt32(drow["toggle_id"]);
                    REM.toggle = string.IsNullOrWhiteSpace(drow["toggle"].ToString()) ? "" : drow["toggle"].ToString();
                    REM.amount = string.IsNullOrWhiteSpace(drow["amount"].ToString()) ? 0 : Convert.ToDecimal(drow["amount"]);
                    REM.price_yield_id = string.IsNullOrWhiteSpace(drow["price_yield_id"].ToString()) ? 0 : Convert.ToInt32(drow["price_yield_id"]);
                    REM.price_yield = string.IsNullOrWhiteSpace(drow["price_yield"].ToString()) ? 0 : Convert.ToDecimal(drow["price_yield"]);
                    REM.created_by = string.IsNullOrWhiteSpace(drow["username"].ToString()) ? "" : drow["username"].ToString();
                    REM.IsActive = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"]);

                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }
        public static List<MenuRoleMappingModel> GetAssignedMenuToRole(DataTable DT)
        {
            List<MenuRoleMappingModel> REM_LIST2 = new List<MenuRoleMappingModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                MenuRoleMappingModel REM = new MenuRoleMappingModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.menu_id = string.IsNullOrWhiteSpace(drow["menuid"].ToString()) ? 0 : Convert.ToInt32(drow["menuid"]);
                    REM.role_id = string.IsNullOrWhiteSpace(drow["roleid"].ToString()) ? 0 : Convert.ToInt32(drow["roleid"]);
                    REM.is_active = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"].ToString());
                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }

        public static List<MenuModel> GetMenuRoleGridList(DataTable DT)
        {
            List<MenuModel> REM_LIST2 = new List<MenuModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                MenuModel REM = new MenuModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.title = string.IsNullOrWhiteSpace(drow["title"].ToString()) ? "" : drow["title"].ToString();
                    REM.is_active = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"].ToString());
                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }

        public static List<UserModel> GetUserGridList(DataTable DT)
        {
            List<UserModel> REM_LIST2 = new List<UserModel>();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;
                UserModel REM = new UserModel();
                try
                {
                    REM.ID = string.IsNullOrWhiteSpace(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                    REM.Code = string.IsNullOrWhiteSpace(drow["code"].ToString()) ? "" : drow["code"].ToString();
                    REM.Name = string.IsNullOrWhiteSpace(drow["name"].ToString()) ? "" : drow["name"].ToString();
                    REM.Email = string.IsNullOrWhiteSpace(drow["email"].ToString()) ? "" : drow["email"].ToString();
                    REM.role_id = string.IsNullOrWhiteSpace(drow["roleid"].ToString()) ? 0 : Convert.ToInt32(drow["roleid"].ToString());
                    REM.isactive = string.IsNullOrWhiteSpace(drow["isactive"].ToString()) ? false : Convert.ToBoolean(drow["isactive"]);
                    REM_LIST2.Add(REM);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return REM_LIST2;
        }

        public static UserDetailsModel GetUserDetails(DataTable DT)
        {
            UserDetailsModel bll = new UserDetailsModel();


            int RecordCount = 0;
            foreach (DataRow drow in DT.Rows)
            {
                RecordCount++;

                try
                {
                    bll.Code = string.IsNullOrWhiteSpace(drow["Code"].ToString()) ? "" : drow["Code"].ToString();
                    bll.Name = string.IsNullOrWhiteSpace(drow["Name"].ToString()) ? "" : drow["Name"].ToString();
                    bll.Email = string.IsNullOrWhiteSpace(drow["Email"].ToString()) ? "" : drow["Email"].ToString();
                    bll.FullAccess = string.IsNullOrWhiteSpace(drow["fullaccess"].ToString()) ? false : Convert.ToBoolean(drow["fullaccess"]);
                }
                catch (Exception ex)
                {
                    if (RecordCount < 1)
                    {
                        RecordException RException = new RecordException();
                        RException.FILE_NAME = null;
                        RException.ERR_MSG = ex.Message;
                        RECORDED_ERR_LIST.Add(RException);
                    }
                }

            }
            return bll;

        }

    }
}
