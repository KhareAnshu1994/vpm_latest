using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using VPM.Web.Models;
using Cylsys.Common;

namespace VPM.Web
{
    public class CommonDB
    {
        /*
        QRV=1 Record Saved Successfully
        QRV = 2 Duplicate Record
        QRV=3 Id is not Valid
        Result Status=0 Internal DB Error
        */
        /*Function For Inserting.Updateing and Delete Record Start*/
        public static int DMLOperation(string cProcedureName, SqlParameter[] paramenters)
        {
            int resultStatus;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString()))
            {
            try
            {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandTimeout = 60;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = cProcedureName;
                        if (paramenters != null)
                        cmd.Parameters.AddRange(paramenters);
                        cmd.Parameters.Add("@QRS", SqlDbType.Int);
                        cmd.Parameters["@QRS"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        resultStatus = (int)cmd.Parameters["@QRS"].Value;
                    }
           }
            catch (Exception ex)
            {
                    string errormsg = ex.ToString();
                    resultStatus = 0;
            }
        }
            return resultStatus;
        }

        /*Function For Inserting.Updateing and Delete Record end */


        /*Function For Select Record Start*/
        public static DataTable GetRecord(string cProcedureName, SqlParameter[] paramenters)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString()))
            {
                //  try
                // {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 60;
                    cmd.CommandType = CommandType.StoredProcedure; ;
                    cmd.CommandText = cProcedureName;
                    if (paramenters != null)
                        cmd.Parameters.AddRange(paramenters);
                    using (SqlDataAdapter SqDA = new SqlDataAdapter(cmd))
                    {
                        SqDA.Fill(dt);
                    }
                    return dt;
                }
                //  }
                //catch (Exception ex)
                //{
                //    return null;
                //}
            }
        }

        /*Function For Select Record end*/

        /*Function For return multiple datatables using dataset Start*/
        public static DataSet ReturnMultipleRecords(string cProcedureName, SqlParameter[] paramenters)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString()))
            {
                //  try
                // {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 60;
                    cmd.CommandType = CommandType.StoredProcedure; ;
                    cmd.CommandText = cProcedureName;
                    if (paramenters != null)
                        cmd.Parameters.AddRange(paramenters);
                    using (SqlDataAdapter SqDA = new SqlDataAdapter(cmd))
                    {
                        SqDA.Fill(ds);
                    }
                    return ds;
                }
                //  }
                //catch (Exception ex)
                //{
                //    return null;
                //}
            }
        }

        /*Function For return multiple datatables using dataset End*/

        /*Function For return multiple datatables using dataset Start*/
        public static string ReturnsingleValue(string cProcedureName, SqlParameter[] paramenters)
        {
            DataTable dt = new DataTable();
            string ans = "";
            
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString()))
            {
                //  try
                // {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 60;
                    cmd.CommandType = CommandType.StoredProcedure; ;
                    cmd.CommandText = cProcedureName;
                    if (paramenters != null)
                        cmd.Parameters.AddRange(paramenters);
                    
                    using (SqlDataAdapter SqDA = new SqlDataAdapter(cmd))
                    {
                        SqDA.Fill(dt);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        ans = dt.Rows[0][0].ToString();
                    }
                    else
                    {
                        ans = "";
                    }
                    return ans;
                    
                }
                //  }
                //catch (Exception ex)
                //{
                //    return null;
                //}
            }
        }

        /*Function For return multiple datatables using dataset End*/

        /*Function for Load DropdownList Start */
        public static List<DDLModel> LOAD_DROPDOWNLIST(DataTable dt)
        {
            List<DDLModel> ddlList = new List<DDLModel>();
            foreach (DataRow drow in dt.Rows)
            {
                DDLModel ddlobj = new DDLModel();
                ddlobj.ID = string.IsNullOrEmpty(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                ddlobj.Name = string.IsNullOrEmpty(drow["Name"].ToString()) ? "" : drow["Name"].ToString();
                ddlList.Add(ddlobj);
            }
            return ddlList;
        }
        /*Function for Load DropdownList End */


        /*Function for Load DropdownList Start */
        public static List<DDLTaxRateModel> LOAD_TaxRatesDROPDOWNLIST(DataTable dt)
        {
            List<DDLTaxRateModel> ddlList = new List<DDLTaxRateModel>();
            foreach (DataRow drow in dt.Rows)
            {
                DDLTaxRateModel ddlobj = new DDLTaxRateModel();
                ddlobj.TaxPercentage = string.IsNullOrEmpty(drow["TaxPercentage"].ToString()) ? 0 : Convert.ToDecimal(drow["TaxPercentage"].ToString());
                ddlList.Add(ddlobj);
            }
            return ddlList;
        }
        /*Function for Load DropdownList End */
    }


}