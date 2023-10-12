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
            if (Session["customer"] == null)
            {
                lbThongbao.Text = "Bạn cần đăng nhập để xem giỏ hàng.";
                lbThongbao.Attributes.Add("class", "lbError");
            } 
            else if(!Page.IsPostBack)
            {
                bind_data();
            }
            
        }

        private void bind_data()
        {
            if(Session["customer_id"] != null) { 
                int id = int.Parse(Session["customer_id"].ToString());
                String sql = "EXEC dbo.sp_getCartWithID @customer_id";
                DataTable result = DataConnect.Instance.ExecuteQuerySP(sql, new object[] { id });
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
    }
}