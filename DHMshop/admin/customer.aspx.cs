using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                String sql = "SELECT id,email,full_name,sex,address,phone_number,status FROM dbo.tb_customers";
                gvCustomer.DataSource = DataConnect.Instance.ExecuteQuery(sql).DefaultView;
                gvCustomer.DataBind();
            }
        }

        protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string tb1 =  gvCustomer.DataKeys[e.RowIndex].Value.ToString();
            string script = "<script>confirm('"+ tb1 +"')</script>";
            Response.Write(script);
        }
    }
}