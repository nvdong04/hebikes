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
        protected string product_name;
        protected string brand;
        protected float price;
        protected float discount_price;
        protected string image_url;
        protected string description;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                BindProductById(id);              
            }
        }

        public void BindProductById(int id)
        {
            string sql = "select * from products where id = " + id;
            DataTable table = DatabaseConnection.Instance.ExecuteQuery(sql);
            DataRow row = table.Rows[0];
            product_name = row["name"].ToString();
            brand = row["brand"].ToString();
            price = float.Parse(row["price"].ToString());
            discount_price = float.Parse(row["discount_price"].ToString());
            image_url = row["image_url"].ToString();
            description = row["description"].ToString();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["customer_id"] != null)
            {
                int product_id = int.Parse(Request.QueryString["id"]);
                int customer_id = int.Parse(Session["customer_id"].ToString());
                int quantity = int.Parse(tbQuantity.Text);
                string sql = "EXEC dbo.sp_create_or_update_to_cart @customer_id , @product_id , @quantity";
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { customer_id , product_id , quantity });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this, "Thêm sản phẩm thành công", "Thông báo", Utils.ToastType.Success);
                        LayoutMaster layoutMaster = (LayoutMaster)this.Master;
                        layoutMaster.CountNumberCartItem();
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Thêm sản phẩm thất bại. Vui lòng thử lại!", "Thông báo", Utils.ToastType.Error);
                    }
                }
                catch (Exception ex)
                {
                    Utils.ShowToastr(this, ex.Message, ex.GetType().Name, Utils.ToastType.Error);
                }
            } else
            {
                Utils.ShowToastr(this,"Bạn phải đăng nhập trước khi thêm sản phẩm vào giỏ hàng","Thông báo",Utils.ToastType.Warning);
            }
        }
    }
}