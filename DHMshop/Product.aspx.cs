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
                BindCategory();
            }
            BindProductsWithCategory();
        }

        protected void BindProducts()
        {
            string sql = "select * from products";
            lvProducts.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            lvProducts.DataBind();          
        }

        public void BindProductsWithCategory()
        {
            if (Request.QueryString["category"] != null)
            {
                int category_id = int.Parse(Request.QueryString["category"]);
                string sql = "select * from products where category_id = " + category_id;
                lvProducts.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
                lvProducts.DataBind();
            }
        }

        private void BindCategory()
        {
            // query tất cả role
            string sql = "select id, name from categorys";
            rpCategorys.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            rpCategorys.DataBind();
        }
    }
}