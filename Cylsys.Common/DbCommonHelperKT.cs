﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using MySql.Data.MySqlClient;




namespace Cylsys.Common
{
    public class DbCommonHelperKT
    {
        string strcon = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();

        List<RecordException> ERROR_LIST = new List<RecordException>();
        SqlTransaction trans;

        
        public string Save(string InsertQuery, string selectQuery, MySqlParameter[] paramenters, MySqlParameter[] SelectParam)
        {
            DataTable dt = new DataTable();
            string Response = string.Empty;
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmdSelect = new MySqlCommand(selectQuery))
                    {
                        cmdSelect.Connection = conn;
                        if (paramenters != null)
                            cmdSelect.Parameters.AddRange(SelectParam);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmdSelect))
                        {
                            SqDA.Fill(dt);
                        }
                    }
                    if (dt.Rows.Count == 0)
                    {
                        using (MySqlCommand cmd = new MySqlCommand(InsertQuery))
                        {
                            cmd.Connection = conn;
                            if (paramenters != null)
                                cmd.Parameters.AddRange(paramenters);
                            cmd.ExecuteNonQuery();
                            Response = MessageHelper.Success;
                        }
                    }
                    else
                    {
                        Response = MessageHelper.DuplicateRecord;
                    }
                }
                catch (Exception ex)
                {
                    Response = MessageHelper.Fail;
                }
                return Response;
            }
        }
        public string Save2(string InsertQuery, string update_or_deleteQuery, MySqlParameter[] paramenters, MySqlParameter[] update_or_deletepara, int rowcount)
        {
            DataTable dt = new DataTable();
            string Response = string.Empty;
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    if (rowcount == 1)
                    {
                        using (MySqlCommand cmd = new MySqlCommand(update_or_deleteQuery))
                        {
                            cmd.Connection = conn;
                            if (paramenters != null)
                                cmd.Parameters.AddRange(update_or_deletepara);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    using (MySqlCommand cmd = new MySqlCommand(InsertQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        cmd.ExecuteNonQuery();
                        Response = MessageHelper.Success;
                    }
                    // Response = MessageHelper.DuplicateRecord;

                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR IN Save2 fun : " + ex.Message);
                    Response = MessageHelper.Fail;
                }
                return Response;
            }
        }
        public string Save(string ProcedureName, MySqlParameter[] paramenters, MySqlConnection conn, MySqlTransaction trans)
        {
            string Response = string.Empty;
            using (MySqlCommand cmd = new MySqlCommand(ProcedureName, conn,trans))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (paramenters != null)
                    cmd.Parameters.AddRange(paramenters);
                object o = cmd.ExecuteScalar();
                if (o != null)
                {
                    Response = o.ToString();
                }
            }
            return Response;
        }
        public string Save(string ProcedureName, MySqlParameter[] paramenters)
        {
            string MSG = string.Empty;
            DataTable dt = new DataTable();
            string Response = string.Empty;
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
              try
               {
                    conn.Open();

                    using (MySqlCommand cmd = new MySqlCommand(ProcedureName, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        object o = cmd.ExecuteScalar();
                        Response = MessageHelper.Success;
                        if (o != null)
                        {
                            Response = MessageHelper.Success;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response = MessageHelper.Fail;
                }
                return Response;
            }
        }

        public List<DDLModel> FILE_DROPDOWN_LIST(string cQuery, string ColumnNm, MySqlParameter[] paramenters)
        {

            List<DDLModel> ddlList = new List<DDLModel>();
            DataTable dt = new DataTable();
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand(cQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmd))
                        {
                            SqDA.Fill(dt);
                        }
                        foreach (DataRow drow in dt.Rows)
                        {
                            DDLModel ddlobj = new DDLModel();
                            ddlobj.Name = string.IsNullOrEmpty(drow[ColumnNm].ToString()) ? "" : drow[ColumnNm].ToString();
                            ddlList.Add(ddlobj);
                        }
                        return ddlList;
                    }
                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR [ExecuteParaQuery] : " + ex.Message);
                    return null;
                }
            }
        }

        public List<DDLModel> LOAD_FILE_DROPDOWNLIST(string cQuery, MySqlParameter[] paramenters)
        {

            List<DDLModel> ddlList = new List<DDLModel>();
            DataTable dt = new DataTable();
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand(cQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmd))
                        {
                            SqDA.Fill(dt);
                        }
                        foreach (DataRow drow in dt.Rows)
                        {
                            DDLModel ddlobj = new DDLModel();
                            string str_files = string.IsNullOrEmpty(drow["Name"].ToString()) ? "" : drow["Name"].ToString();
                            string[] total_files = str_files.Split(',');
                            if (total_files.Count() > 1)
                            {
                                int file_number = 0;
                                foreach (string strfile in total_files)
                                {
                                    file_number++;
                                    DDLModel ddlobj2 = new DDLModel();
                                    ddlobj.ID = file_number;
                                    ddlobj.Name = strfile;
                                    ddlList.Add(ddlobj);
                                }
                            }
                            else
                            {

                                ddlobj.ID = string.IsNullOrEmpty(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                                ddlobj.Name = string.IsNullOrEmpty(drow["Name"].ToString()) ? "" : drow["Name"].ToString();
                                ddlList.Add(ddlobj);
                            }

                        }
                        return ddlList;
                    }
                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR [ExecuteParaQuery] : " + ex.Message);
                    return null;
                }
            }
        }

        public List<DDLModel> LOAD_DROPDOWNLIST(string cQuery, MySqlParameter[] paramenters)
        {

            List<DDLModel> ddlList = new List<DDLModel>();
            DataTable dt = new DataTable();
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand(cQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmd))
                        {
                            SqDA.Fill(dt);
                        }
                        foreach (DataRow drow in dt.Rows)
                        {
                            DDLModel ddlobj = new DDLModel();
                            ddlobj.ID = string.IsNullOrEmpty(drow["id"].ToString()) ? 0 : Convert.ToInt32(drow["id"].ToString());
                            ddlobj.Name = string.IsNullOrEmpty(drow["Name"].ToString()) ? "" : drow["Name"].ToString();
                            ddlList.Add(ddlobj);
                        }
                        return ddlList;
                    }
                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR [ExecuteParaQuery] : " + ex.Message);
                    return null;
                }
            }
        }

        public List<DDLModel2> FEEL_DROPDOWNLIST_FOR_EMP(string cQuery, string ColumnNm, MySqlParameter[] paramenters)
        {

            List<DDLModel2> ddlList2 = new List<DDLModel2>();
            DataTable dt = new DataTable();
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand(cQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmd))
                        {
                            SqDA.Fill(dt);
                        }
                        foreach (DataRow drow in dt.Rows)
                        {
                            DDLModel2 ddlobj = new DDLModel2();
                            ddlobj.emp_code = string.IsNullOrEmpty(drow["emp_code"].ToString()) ? 0 : Convert.ToInt32(drow["emp_code"].ToString());
                            ddlobj.EmpName = string.IsNullOrEmpty(drow[ColumnNm].ToString()) ? "" : drow[ColumnNm].ToString();
                            ddlList2.Add(ddlobj);
                        }
                        return ddlList2;
                    }
                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR [ExecuteParaQuery] : " + ex.Message);
                    return null;
                }
            }
        }
        public DataTable ExecuteParaQuery(string cQuery, MySqlParameter[] paramenters)
        {
            DataTable dt = new DataTable();
            using (MySqlConnection conn = new MySqlConnection(strcon))
            {
                try
                {
                    conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand(cQuery))
                    {
                        cmd.Connection = conn;
                        if (paramenters != null)
                            cmd.Parameters.AddRange(paramenters);
                        using (MySqlDataAdapter SqDA = new MySqlDataAdapter(cmd))
                        {
                            SqDA.Fill(dt);
                        }
                        return dt;
                    }
                }
                catch (Exception ex)
                {
                    Helper.WriteLog("ERROR [ExecuteParaQuery] : " + ex.Message);
                    return null;
                }
            }
        }
    }
}
