using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            string sql = "SELECT p.id, c.name as 'category', p.code,p.name as 'product', p.brand, p.price, p.discount_price,p.status, p.created_at FROM products AS p LEFT JOIN categorys AS c ON p.category_id = c.id";
            gvProducts.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            gvProducts.DataBind();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvProducts.DataKeys[e.RowIndex].Value.ToString();
            String sql = "DELETE FROM dbo.products WHERE id =" + id;
            bool result = DatabaseConnection.Instance.ExecuteNonQuery(sql);
            BindProducts();
        }
    }
}