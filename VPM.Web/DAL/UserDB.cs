using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VPM.Web.Models;
using VPM.Web.DAL;

namespace VPM.Web.DAL
{
    public class UserDB
    {
        //public static DataTable Func_Login(UserModel objmUser)
        //{
        //     SqlParameter[] parameters = {
        //        new SqlParameter("@UserName",objmUser.UserName),
        //        new SqlParameter("@Password",objmUser.Password),
        //       };
        //        DataTable dt = CommonDB.GetRecord("usp_User_Login", parameters);
        //        return dt;
        //}

        public static List<SelectListItem> Func_GetPartyNames(int CreatedBy)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            SqlParameter[] parameters = {
                new SqlParameter("@CreatedBy",CreatedBy),
            };
            DataTable dt = CommonDB.GetRecord("usp_GetPartyNames", parameters);
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new SelectListItem
                {
                    Text = dr["PartyName"].ToString(),
                    Value = dr["Id"].ToString()
                });
            }
            return items;

        }
    }
}