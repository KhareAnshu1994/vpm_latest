using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cylsys.Common
{
    public class EMSModel
    {
    }
    public class SchemeModel
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
    }
    public class OrderManagementModel
    {
        public int ID { get; set; }
        public DateTime system_date { get; set; }
        public DateTime system_time { get; set; }
        public int scheme_id { get; set; }
        public string scheme_name { get; set; }
        public string scheme_ids { get; set; }
        public string[] scheme_list { get; set; }
        public string security_name { get; set; }
        public int security_type_id { get; set; }

        public string security_type { get; set; }
        public string other_security_type { get; set; }
        public int toggle_id { get; set; }
        public string toggle { get; set; }
        public decimal? amount { get; set; }
        public decimal? price_yield { get; set; }
        public int price_yield_id { get; set; }
        public string created_by { get; set; }
        public bool IsActive { get; set; }

    }
    public class ExportParaModel
    {
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }

    }
    public class ExportParaModel2
    {
        public string GridHtml { get; set; }
    }
    public class UserDetailsModel
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public int IsActive { get; set; }
        public bool FullAccess { get; set; }
    }
    public class RecordException
    {
        public int ROW_NUMBER { get; set; }
        public string ACTIVITY_NUMBER { get; set; }
        public string ACTIVITY_NAME { get; set; }
        public string FILE_NAME { get; set; }
        public string ERR_MSG { get; set; }
    }
    public class EmailModel
    {
        public string attached_file_location { get; set; }
        public string attached_file { get; set; }
        public List<string> to_emailids { get; set; }
        public List<string> cc_emailids { get; set; }
        public List<string> attached_files { get; set; }
        public string file_name { get; set; }
        public string email_subject { get; set; }

    }

    public class MenusModel
    {
        public int SeqID { get; set; }
        public string Link { get; set; }
        public string Title { get; set; }
        public string css_class { get; set; }
        public int is_active { get; set; }
    }
    public class DDLModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
    public class DDLModel2
    {
        public int emp_code { get; set; }
        public string EmpName { get; set; }
    }
    public class UserModel
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public int role_id { get; set; }
        public bool isactive { get; set; }
        public DateTime created_date { get; set; }

    }
    public class RoleModel
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool isactive { get; set; }
        public DateTime created_date { get; set; }

    }
    public class ReportAccessModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public bool is_send_mail_allowed { get; set; }
        public bool is_download_excel_allowed { get; set; }
    }
    public class MenuRoleMappingModel
    {
        public int ID { get; set; }
        public int role_id { get; set; }
        public string role_name { get; set; }
        public string menu_name { get; set; }
        public int menu_id { get; set; }
        public bool is_active { get; set; }
        public DateTime created_date { get; set; }
        public int created_by { get; set; }
    }

    public class MenuModel
    {
        public int ID { get; set; }
        public string link { get; set; }
        public string title { get; set; }
        public bool select_status { get; set; }
        public string css_class { get; set; }
        public int menu_order { get; set; }
        public bool is_active { get; set; }
        public DateTime created_date { get; set; }
    }
    /*  kapil Code start comment on 03-03-2021*/
    public class LovCategoryModel
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool isactive { get; set; }
        public DateTime created_date { get; set; }
    }

    public class LovModel
    {
        public int ID { get; set; }
        public int CategoryId { get; set; }
        public string Category_Code { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool Isactive { get; set; }
        public DateTime Created_date { get; set; }

    }
    /* kapil Code End 03-03-2021*/
}

