using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["productID"] != null)
                {
                    string id = Request.QueryString["productID"];
                    string sql = "Select * from tb_products where id=" + id;
                    DataConnect.Instance.ExecuteQuery(sql);
                    productDetail.DataSource = DataConnect.Instance.ExecuteQuery(sql);
                    productDetail.DataBind();
                }
            }
            if (Request.QueryString["productID"] != null)
            {
                int id = int.Parse(Request.QueryString["productID"]);
                bind_data(id);

            }
        }

        public void bind_data(int id)
        {
            string sql = "EXEC dbo.sp_getProductWithID @product_id";
            DataTable table = DataConnect.Instance.ExecuteQuerySP(sql, new object[] { id });
            DataRow row = table.Rows[0];
            lbProductName.Text = row["product_name"].ToString();
            lbDescription.Text = row["description"].ToString();
            lbDetail.Text = row["detail"].ToString();
            lbProductPrice.Text = row["price"].ToString();
            imgProduct.ImageUrl = row["img"].ToString();
        } 
    }
}