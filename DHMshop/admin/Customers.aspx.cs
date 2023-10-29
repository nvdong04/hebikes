using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCustomers();
            }
        }

        private void BindCustomers()
        {
            string sql = "select * from customers";
            gvCustomers.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            gvCustomers.DataBind();
        }
    }
}