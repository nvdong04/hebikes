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
                DataTable result = GetDataCartByCustomerId(id);
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
        private decimal total_price = 0;
        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {           
            //Tính total thành tiền
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total_price = total_price + decimal.Parse(e.Row.Cells[4].Text);
                lbTotalPrice.Text = String.Format("{0:000,000}đ", total_price);
                lbTotalPrice.Attributes.Add("value", total_price.ToString());
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int customer_id = int.Parse(Session["customer_id"].ToString());
            DateTime order_date = DateTime.Now;
            string order_note = txtOrderNote.Text.Trim();
            decimal order_total_price = decimal.Parse(lbTotalPrice.Attributes["value"].ToString());
            int order_status = 0;
            int order_id = CreateOrder(customer_id,order_date,order_note,order_total_price,order_status);
            if(order_id > 0 )
            {
                int id = int.Parse(Session["customer_id"].ToString());
                DataTable tbcart = GetDataCartByCustomerId(id);
                foreach(DataRow row in tbcart.Rows)
                {
                    int product_id = int.Parse(row["product_id"].ToString());
                    int quantity = int.Parse(row["quantity"].ToString());
                    CreateOrderDetail(order_id, product_id, quantity);
                }

                // Hiện thông báo thêm thành công
                Utils.ShowToastr(this, "Đặt hàng thành công", "Thông báo", Utils.ToastType.Success);
                //Chuyển hướng sang /admin/users.aspx sau 1.5s
                Utils.DelayRedirect(this, "checkoutsuccess.aspx", 1000);
            }
        }

        public DataTable GetDataCartByCustomerId(int id)
        {
            String sql = "EXEC dbo.[sp_get_cart_by_customer_id] @customer_id";
            DataTable result = DatabaseConnection.Instance.ExecuteQuerySP(sql, new object[] { id });
            return result;
        }

        public int CreateOrder(int customer_id, DateTime order_date, string order_note, decimal order_total_price, int order_status)
        {
            int order_id;
            string sql = "EXECUTE dbo.[sp_create_order] @customer_id , @order_date , @order_note , @order_total_price , @status";
            order_id = (int)DatabaseConnection.Instance.ExecuteScalarSP(sql, new object[] { customer_id, order_date, order_note, order_total_price, order_status });
            return order_id;

        }

        public void CreateOrderDetail(int order_id, int product_id, int quantity)
        {
            String sql = "EXEC dbo.sp_create_order_detail @order_id , @product_id , @quantity";
            DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { 
                order_id, product_id, quantity
            });
        }
    }
}