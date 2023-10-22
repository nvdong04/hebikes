using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["customer_id"] == null)
            {
                Response.Redirect("home.aspx");
            }
            else if (!Page.IsPostBack)
            {
                bind_data();
            }

        }

        private void bind_data()
        {
            if (Session["customer_id"] != null)
            {
                int id = int.Parse(Session["customer_id"].ToString());
                DataTable result = gioHang(id);
                if (result.Rows.Count > 0)
                {
                    gvCart.DataSource = result;
                    gvCart.DataBind();
                    bind_data_customer();
                }
               
            }
        }

        public void bind_data_customer()
        {
            String sql = "SELECT * FROM dbo.customers WHERE id = '" + Session["customer_id"].ToString() + "'";
            DataTable table = new DataTable();
            table = DatabaseConnection.Instance.ExecuteQuery(sql);
            DataRow row = table.Rows[0];
            lbFullname.Text = row["fullname"].ToString();
            lbAdress.Text = row["address"].ToString();
            lbPhoneNumber.Text = row["phone"].ToString();            
        }
        double total_price = 0;
        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total_price = total_price + double.Parse(e.Row.Cells[4].Text);
                lbTotalPrice.Text = String.Format("{0:000,000}đ", total_price);
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int customer_id = int.Parse(Session["customer_id"].ToString());
            DateTime order_date = DateTime.Now;
            string order_note = txtOrderNote.Text.Trim();
            float order_total_price = float.Parse(lbTotalPrice.Text);
            int order_status = 0;
            int order_id = createOrder(customer_id,order_date,order_note,order_total_price,order_status);
            if(order_id > 0 )
            {
                int id = int.Parse(Session["customer_id"].ToString());
                DataTable tbcart = gioHang(id);
                foreach(DataRow row in tbcart.Rows)
                {
                    int product_id = int.Parse(row["product_id"].ToString());
                    int quantity = int.Parse(row["quantity"].ToString());
                    createOrderDetail(order_id, product_id, quantity);
                }

                Response.Write("Đăng ký tài khoản thành công");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Đặt hàng thành công.Nhấn oke để chuyển đến trang đăng nhập'); setTimeout(function(){window.location.href ='../../home.aspx'}, 3000);", true);
            }
        }

        public DataTable gioHang(int id)
        {
            String sql = "EXEC dbo.[sp_get_cart_by_customer_id] @customer_id";
            DataTable result = DatabaseConnection.Instance.ExecuteQuerySP(sql, new object[] { id });
            return result;
        }

        public int createOrder(int cusomer_id, DateTime order_date, string order_note, float order_total_price, int order_status)
        {
            int order_id;
            string sql = "EXECUTE dbo.sp_CreateOrder @customer_id , @order_date , @order_note , @order_total_price , @order_status";
            order_id = (int)DatabaseConnection.Instance.ExecuteScalarSP(sql, new object[] { cusomer_id, order_date, order_note, order_total_price, order_status });
            return order_id;

        }

        public void createOrderDetail(int order_id, int product_id, int quantity)
        {
            String sql = "EXEC dbo.sp_create_order_detail @order_id , @product_id , @quantity";
            DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { 
                order_id, product_id, quantity
            });
        }
    }
}