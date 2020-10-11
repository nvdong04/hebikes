using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class LayoutMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                String sql = "SELECT * FROM dbo.tb_customers WHERE email = '" + Session["customer"].ToString() + "'";
                DataTable table = new DataTable();
                table = DataConnect.Instance.ExecuteQuery(sql);
                DataRow row = table.Rows[0];
                string id = row["id"].ToString();
                string name = row["full_name"].ToString();
                hpProfile.NavigateUrl = "profile.aspx?id=" + id;
                hpCart.NavigateUrl = "cart.aspx?id=" + id;
                lbCustomer.Text = name;
            }
            else
            {
                
                //hpProfile.NavigateUrl = "profile.aspx?id=" + id;
                //hpCart.NavigateUrl = "cart.aspx?id=" + id;
            }

        }

        public void getCustomer()
        {
            
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
            //btnLogout.ServerClick += new System.EventHandler(this.Button_Click);
        }   
    }
}