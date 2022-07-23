using ClosedXML.Excel;
using Cylsys.Common;
using MicroORM;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.IO;

namespace VPM.Web.Models
{
    public class Report
    {
        List<RecordException> RECORDED_ERR_LIST = new List<RecordException>();


        public List<OrderManagementModel> GetGridDetail(DateTime FROM_DATE, DateTime TO_DATE)
        {
            List<OrderManagementModel> RPM_LIST = new List<OrderManagementModel>();

            SqlParameter[] parameters = {
                new SqlParameter("@from_date",FROM_DATE),
                new SqlParameter("@to_date",TO_DATE),
            };
            DataTable DT = DataAccess.ExecuteProcedure("oms_sp_get_report_grid", parameters);
            if (DT.Rows.Count > 0)
            {
                RPM_LIST = QueryHandler.GetOrderManagementGridList(DT);
            }
            return RPM_LIST;
        }

    }
}