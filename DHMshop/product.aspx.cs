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
                category.DataSource = DataConnect.Instance.ExecuteQuery("Select * from tb_category");
                category.DataBind();
                Bind_Data();
            }
            load_data();
            
        }

        public void load_data()
        {
            if (Request.QueryString["category"] != null)
            {
                int id = int.Parse(Request.QueryString["category"]);
                string sql = "Select * from tb_products where category_id=" + id;
                productList.DataSource = DataConnect.Instance.ExecuteQuery(sql);
                productList.DataBind();
            }
        }

        public void Bind_Data()
        {
            productList.DataSource = DataConnect.Instance.ExecuteQuery("Select * from tb_products");
            productList.DataBind();

            
        }
        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Bind_Data();
            load_data();
        }

        protected void productList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (Session["customer"] != null)
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
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm vào giỏ hàng thành công');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm vào thất bại');", true);
                }
            }
            else
            {
                if(!Page.IsPostBack)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Bạn phải đăng nhập trước khi thêm sản phẩm vào giỏ hàng');", true);
                }
            }
        }
    }
}