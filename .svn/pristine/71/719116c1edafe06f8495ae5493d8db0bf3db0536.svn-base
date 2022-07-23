using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Cylsys.Common;
using MicroORM;

namespace VPM.Web.Models
{
    public class OrderManagement
    {
        SqlTransaction trans;
        public OrderManagementModel GetItem(int id)
        {
            OrderManagementModel bll = new OrderManagementModel();
            if (id == 0)
            {
                bll = new OrderManagementModel();
                bll.system_time = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm"));
               
            }
            else
            {
                SqlParameter[] Params = {
                                       new SqlParameter("@ID", id),

                                         };
                DataTable DT = DataAccess.ExecuteProcedure("oms_sp_get_order_management_data", Params);
                if (DT.Rows.Count > 0)
                {
                    List<OrderManagementModel> rolelist = QueryHandler.GetOrderManagementGridList(DT);
                    if (rolelist.Count > 0)
                        bll = rolelist[0];
                    string[] nums = bll.scheme_ids.Split(',');
                    
                    bll.scheme_list = nums;
                }
            }
            return bll;



        }
        public string Save(OrderManagementModel model)
        {
            string Response = string.Empty;
            string trans_id = string.Empty;
            string strcon = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            DbCommonHelper dbcom = new DbCommonHelper();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                trans = con.BeginTransaction();
                try
                {
                    SqlParameter[] Params = {
                                            new SqlParameter("@ID",model.ID),
                                            new SqlParameter("@system_date",model.system_date),
                                            new SqlParameter("@system_time",model.system_time),
                                            new SqlParameter("@security_name",model.security_name),
                                            new SqlParameter("@security_type_id",model.security_type_id),
                                            new SqlParameter("@other_security_type",string.IsNullOrWhiteSpace(model.other_security_type)?"":model.other_security_type),
                                            new SqlParameter("@toggle_id",model.toggle_id),
                                            new SqlParameter("@amount",model.amount),
                                            new SqlParameter("@price_yield_id",model.price_yield_id),
                                            new SqlParameter("@price_yield",model.price_yield),
                                            new SqlParameter("@isactive",model.IsActive),
                                            new SqlParameter("@UserID",UserManager.User.Code)

                                         };


                    trans_id = dbcom.Save("oms_sp_add_update_order_management_trans", Params, con, trans);
                    if (!string.IsNullOrWhiteSpace(trans_id))
                    {
                        if (model.scheme_list.Length > 0)
                        {
                            foreach (string scheme_id in model.scheme_list)
                            {

                                SqlParameter[] params2 =
                                {
                     new SqlParameter("@ID",model.ID),
                     new SqlParameter("@order_management_trans_id",Convert.ToInt32(trans_id)),
                     new SqlParameter("@scheme_id", Convert.ToInt32(scheme_id))
                 };
                                Response = dbcom.Save("oms_sp_add_delete_trans_schemes", params2, con, trans);
                            }
                        }
                    }
                    trans.Commit();
                }
                catch (Exception exx)
                {
                    Helper.WriteLog("Error while save record :" + exx.Message);
                    trans.Rollback();
                }


                return Response;
            }
        }

        public List<OrderManagementModel> GetOrderManagementGrid()
        {
            OrderManagementModel bll = new OrderManagementModel();

            List<OrderManagementModel> RM_LIST = new List<OrderManagementModel>();
            SqlParameter[] Params = {
                                       new SqlParameter("@ID", "0"),

                                         };
            DataTable DT = DataAccess.ExecuteProcedure("oms_sp_get_order_management_data", Params);
            if (DT.Rows.Count > 0)
            {
                RM_LIST = QueryHandler.GetOrderManagementGridList(DT);
            }
            return RM_LIST;
        }
    }
}
