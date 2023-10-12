using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace DHMshop
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                productList.DataSource = DataConnect.Instance.ExecuteQuery("Select top 8 * from tb_products");
                productList.DataBind();
            }
        }

        protected void productList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(Session["customer"] != null)
            {
                //var ddlSize = e.Item.FindControl("ddlSize") as DropDownList;
                //var ddlColor = e.Item.FindControl("ddlColor") as DropDownList;
                int product_id = int.Parse(productList.DataKeys[e.Item.DataItemIndex].Value.ToString());
                int customer_id = int.Parse(Session["customer_id"].ToString());
                int quantity = 1;
                //int size = int.Parse(ddlSize.SelectedValue);
                //string color = ddlColor.SelectedValue;
                string sql = "EXEC dbo.sp_AddToCart @customer_id , @product_id , @quantity";
                int result = DataConnect.Instance.ExecuteNonQuerySP(sql, new object[] { customer_id, product_id, quantity });
                if(result > 0 )
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm vào giỏ hàng thành công');", true);
                } else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm vào thất bại');", true);
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}