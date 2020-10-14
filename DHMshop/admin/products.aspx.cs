using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Bind_Data();
            }
        }

        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvProduct.DataKeys[e.RowIndex].Value.ToString();
            int result = 0;
            String sql = "DELETE FROM dbo.tb_products WHERE id =" + id;
            //result = DataConnect.Instance.ExecuteNonQuery(sql);
            string script = "<script>confirm('" + id + "')</script>";
            Response.Write(script);
        }


        private void Bind_Data()
        {
            String sql = "SELECT p.*, c.name AS name_category FROM dbo.tb_products AS p LEFT JOIN dbo.tb_category AS c ON c.id = p.category_id";
            gvProduct.DataSource = DataConnect.Instance.ExecuteQuery(sql).DefaultView;
            gvProduct.DataBind();
        }
    }
}