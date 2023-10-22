using DHMshop.admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbCheckOut.Visible = false;
            if (Session["customer_id"] == null)
            {
                lbThongbao.Text = "Bạn cần đăng nhập để xem giỏ hàng.";
                lbThongbao.Attributes.Add("class", "lbError");
            } 
            else if(!Page.IsPostBack)
            {
                BindDataCart();
            }
        }

        private void BindDataCart()
        {
            if(Session["customer_id"] != null) { 
                int id = int.Parse(Session["customer_id"].ToString());
                String sql = "EXEC dbo.[sp_get_cart_by_customer_id] @customer_id";
                DataTable result = DatabaseConnection.Instance.ExecuteQuerySP(sql, new object[] { id });
                gvCart.DataSource = result;
                gvCart.DataBind();
                if (result.Rows.Count > 0)
                {             
                    lbCheckOut.Visible = true;
                } else
                {
                    lbCheckOut.Visible = false;
                }
            }
        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvCart.DataKeys[e.RowIndex].Value.ToString();
            String sql = "DELETE FROM dbo.cart_items WHERE id =" + id;
            bool result = DatabaseConnection.Instance.ExecuteNonQuery(sql);
            //update badge number cart item
            LayoutMaster layoutMaster = (LayoutMaster)this.Master;
            layoutMaster.CountNumberCartItem();
            BindDataCart();
        }
    }
}