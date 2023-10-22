using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindProducts();
            } 
        }

        protected void BindProducts()
        {
            string sql = "select * from products";
            lvProducts.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            lvProducts.DataBind();          
        }       
    }
}