using MicroORM;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cylsys.Common;
using System.DirectoryServices;
using System.Configuration;

namespace VPM.Web.Models
{
    public class Login : EntityBusinessLogicBase<Login>
    {
        public UserDetailsModel GetUserDetail(string UserID, string Password)
        {
            UserDetailsModel umodel = new UserDetailsModel();
            DataTable DT = DataAccess.ExecuteQuery("select * from vpm_tbl_user_master where code='" + UserID + "'");
            //DataTable DT = DataAccessKT.ExecuteQuery("select * from tbl_user_master where code='" + UserID + "'");
            bool IsAdLogin = Convert.ToBoolean(ConfigurationManager.AppSettings["IsADLogin"].ToString());
            if (IsAdLogin)
            {
                if (CheckUser(UserID, Password))
                {
                    umodel = QueryHandler.GetUserDetails(DT);
                }
                else
                {
                    umodel = null;
                }
            }
            else
            {
                if (DT.Rows.Count > 0)
                {
                    umodel = QueryHandler.GetUserDetails(DT);
                }
                else
                {
                    umodel = null;
                }
            }
            return umodel;
        }

      
        public bool CheckUser(string userid, string password)
        {
            bool status = false;

            DirectoryEntry entry = new DirectoryEntry(ConfigurationManager.AppSettings["ADConnectionString"].ToString(), userid.Trim(), password);
            try
            {
                object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);

                search.Filter = "(SAMAccountName=" + userid + ")";

                search.PropertiesToLoad.Add("cn");

                SearchResult result = search.FindOne();

                if (null == result)
                {
                    status = false;
                }
                else
                {
                    status = true;
                }
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }
    }
}