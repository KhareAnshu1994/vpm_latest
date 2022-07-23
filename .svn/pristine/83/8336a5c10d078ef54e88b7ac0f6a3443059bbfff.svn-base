using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using VPM.Web.Models;
using VPM.Web.DAL;
using Cylsys.Common;

namespace VPM.Web.DAL
{
    public class PartyMasterDB
    {
       public static string AddPartyMaster(PartyMasterModel objMPartyMaster)
        {
            int RStatus;
            string Response;
            SqlParameter[] parameters = {
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(objMPartyMaster.Id.ToString()) ? 0 : objMPartyMaster.Id),
                new SqlParameter("@PartyName",string.IsNullOrWhiteSpace(objMPartyMaster.PartyName)?"":objMPartyMaster.PartyName),
                new SqlParameter("@Location", string.IsNullOrWhiteSpace(objMPartyMaster.Location)?"":objMPartyMaster.Location),
                new SqlParameter("@Address1", string.IsNullOrWhiteSpace(objMPartyMaster.Address1)?"":objMPartyMaster.Address1),
                new SqlParameter("@Address2", string.IsNullOrWhiteSpace(objMPartyMaster.Address2)?"":objMPartyMaster.Address2),
                new SqlParameter("@Address3", string.IsNullOrWhiteSpace(objMPartyMaster.Address3)?"":objMPartyMaster.Address3),
                new SqlParameter("@State", string.IsNullOrWhiteSpace(objMPartyMaster.State)?"":objMPartyMaster.State),
                new SqlParameter("@Pincode", string.IsNullOrWhiteSpace(objMPartyMaster.Pincode)?"":objMPartyMaster.Pincode),
                new SqlParameter("@BankId", string.IsNullOrWhiteSpace(objMPartyMaster.BankId.ToString()) ? 0 : objMPartyMaster.BankId),
                new SqlParameter("@IFSCCODE",string.IsNullOrWhiteSpace(objMPartyMaster.IFSCCODE)?"":objMPartyMaster.IFSCCODE),
                new SqlParameter("@Accountno",string.IsNullOrWhiteSpace(objMPartyMaster.AccountNo)?"":objMPartyMaster.AccountNo),
                new SqlParameter("@GSTNo",string.IsNullOrWhiteSpace(objMPartyMaster.GSTNO)?"":objMPartyMaster.GSTNO),
                new SqlParameter("@PANNO",string.IsNullOrWhiteSpace(objMPartyMaster.PANNO)?"":objMPartyMaster.PANNO),
                new SqlParameter("@Remark",string.IsNullOrWhiteSpace(objMPartyMaster.Remark)?"":objMPartyMaster.Remark),
                new SqlParameter("@CreatedBy",string.IsNullOrWhiteSpace(objMPartyMaster.CreatedBy.ToString())?"":objMPartyMaster.CreatedBy),
                new SqlParameter("@IsActive",objMPartyMaster.IsActive)
            };
            RStatus = CommonDB.DMLOperation("vpm_sp_Insert_update_PartyMaster_details", parameters);
            if (RStatus == 1)
            {
                Response = MessageHelper.Success;
            }
            else if (RStatus == 2)
            {
                Response = MessageHelper.DuplicateRecord;
            }
            else if (RStatus == 3)
            {
                Response = MessageHelper.IdNotValid;
            }
            else
            {
                Response = MessageHelper.Internal_DB_Error;
            }
            return Response;
        }

        public static List<PartyMasterModel> GetPartyMasterGrid(string CreatedBy,int Id)
        {
           SqlParameter[] parameters = {
                new SqlParameter("@CreatedBy",CreatedBy),
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id),
            };
            DataTable dt= CommonDB.GetRecord("vpm_sp_get_PartyMaster_details", parameters);
            List<PartyMasterModel> list = new List<PartyMasterModel>();
            if (dt.Rows.Count>0)
            {
                list = GetPartyMasterList(dt);
            }
            return list;
        }

        public static PartyMasterModel GetItem(string CreatedBy,int Id)
        {
            PartyMasterModel obj = new PartyMasterModel();
            if (Id == 0)
            {
                obj = new PartyMasterModel();
            }
            else
            {
                SqlParameter[] parameters = {
                new SqlParameter("@CreatedBy",CreatedBy),
                new SqlParameter("@Id",string.IsNullOrWhiteSpace(Id.ToString()) ? 0 : Id),
            };
            DataTable dt = CommonDB.GetRecord("vpm_sp_get_PartyMaster_details", parameters);
                if (dt.Rows.Count > 0)
                {
                    List<PartyMasterModel> list = GetPartyMasterList(dt);
                    if (list.Count > 0)
                        obj = list[0];
                }
            }
            return obj;
        }

        public static List<PartyMasterModel> GetPartyMasterList(DataTable dt)
        {
            List<PartyMasterModel> list = new List<PartyMasterModel>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new PartyMasterModel
                {
                    Id = string.IsNullOrEmpty(dr["Id"].ToString())?0:Convert.ToInt32(dr["Id"]),
                    PartyName = string.IsNullOrEmpty(dr["PartyName"].ToString())?"":Convert.ToString(dr["PartyName"]),
                    Location = string.IsNullOrEmpty(dr["Location"].ToString())?"":Convert.ToString(dr["Location"]),
                    Address1 = string.IsNullOrEmpty(dr["Address1"].ToString()) ? "" : Convert.ToString(dr["Address1"]),
                    Address2 = string.IsNullOrEmpty(dr["Address2"].ToString()) ? "" : Convert.ToString(dr["Address2"]),
                    Address3 = string.IsNullOrEmpty(dr["Address3"].ToString()) ? "" : Convert.ToString(dr["Address3"]),
                    State = string.IsNullOrEmpty(dr["State"].ToString()) ? "" : Convert.ToString(dr["State"]),
                    Pincode = string.IsNullOrEmpty(dr["Pincode"].ToString()) ? "" : Convert.ToString(dr["Pincode"]),
                    BankName = string.IsNullOrEmpty(dr["BankName"].ToString()) ? "" : Convert.ToString(dr["BankName"]),
                    BankId = string.IsNullOrEmpty(dr["BankId"].ToString())?0:Convert.ToInt32(dr["BankId"]),
                    IFSCCODE = string.IsNullOrEmpty(dr["IFSCCODE"].ToString()) ? "" : Convert.ToString(dr["IFSCCODE"]),
                    AccountNo = string.IsNullOrEmpty(dr["ACCOUNTNO"].ToString()) ? "" : Convert.ToString(dr["AccountNO"]),
                    GSTNO = string.IsNullOrEmpty(dr["GSTNO"].ToString()) ? "" : Convert.ToString(dr["GSTNO"]),
                    PANNO = string.IsNullOrEmpty(dr["PANNO"].ToString()) ? "" : Convert.ToString(dr["PANNO"]),
                    Remark = string.IsNullOrEmpty(dr["Remark"].ToString()) ? "" : Convert.ToString(dr["Remark"]),
                    IsActive = string.IsNullOrEmpty(dr["IsActive"].ToString()) ? false : Convert.ToBoolean(dr["IsActive"])
                });
            }
            return list;
        }
        //(dr["PayableAtDate"] == DBNull.Value) ? (DateTime?)null : ((DateTime) dr["PayableAtDate"]),

        }

}
