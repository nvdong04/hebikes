using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Product : System.Web.UI.Page
    {
        private bool IsUpdate = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindDataDropDown();
                IsUpdate = Request.QueryString["id"] != null ? true : false;
                if (IsUpdate)
                {
                    //lbStatus.Visible = true;
                    GetDataForUpdate();
                    btnSaveProduct.Text = "Cập nhật";
                    btnSaveProduct.Click += new EventHandler(btnUpdate_Click);
                }
            }
        }

        private void BindDataDropDown()
        {
            // query tất cả role
            string sql = "select id, name from categorys";
            ddlCategory.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            ddlCategory.DataValueField = "id";
            ddlCategory.DataTextField = "name";
            ddlCategory.DataBind();
        }

        private void GetDataForUpdate()
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            string query = String.Format("SELECT * FROM dbo.users where id={0}", id);
            DataTable table = DatabaseConnection.Instance.ExecuteQuery(query);
            DataRow row = table.Rows[0];
            
            cbStatus.Checked = Convert.ToInt32(row["is_active"]) == 1;
        }

        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        protected string uploadImageProduct()
        {
            if (fileProductImg.HasFile)
            {
                if (CheckFileType(fileProductImg.FileName))
                {
                    Random random = new Random();
                    int rd = random.Next(100000, 999999);
                    string fileName = "../public/images/product/" + rd + fileProductImg.FileName;
                    string filePath = MapPath(fileName);
                    fileProductImg.SaveAs(filePath);
                    //imgUpLoad.ImageUrl = fileName;
                    return fileName;
                }
            }
            return "";
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string product_name = txtProductName.Text.Trim();
                string code = txtProductCode.Text.Trim();
                string brand = txtBrand.Text.Trim();
                string image_url = uploadImageProduct();
                float price = float.Parse(txtProductPrice.Text.Trim());
                float discount_price = float.Parse(txtDiscountPrice.Text.Trim());
                int status = cbStatus.Checked ? 1 : 0;
                int category_id = Int32.Parse(ddlCategory.SelectedValue);
                string description = txtDescription.Text.Trim();
                int user_id = Int32.Parse(Session["user_id"].ToString());

                string sql = "EXEC dbo.sp_create_product @category_id , @code , @name , @brand , @price , @discount_price , @image_url , @description , @status , @created_by";                         
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { category_id, code, product_name, brand, price, discount_price, image_url, description,status,user_id });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this, "Thêm sản phẩm thành công", "Thông báo", Utils.ToastType.Success);
                        //Chuyển hướng sang /admin/products.aspx sau 1.5s
                        Utils.DelayRedirect(this, "../admin/products.aspx", 1500);
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Thêm sản phẩm thất bại. Vui lòng thử lại!", "Thông báo", Utils.ToastType.Error);
                    }
                }
                catch (Exception ex)
                {
                    Utils.ShowToastr(this,"Lỗi", "Thông báo", Utils.ToastType.Error);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string product_name = txtProductName.Text.Trim();
                string code = txtProductCode.Text.Trim();
                string brand = txtBrand.Text.Trim();
                string image_url = uploadImageProduct();
                float price = float.Parse(txtProductPrice.Text.Trim());
                float discount_price = float.Parse(txtDiscountPrice.Text.Trim());
                int status = cbStatus.Checked ? 1 : 0;
                int category_id = Int32.Parse(ddlCategory.SelectedValue);
                string description = txtDescription.Text.Trim();
                int user_id = Int32.Parse(Session["user_id"].ToString());

                string sql = "EXEC dbo.sp_create_product @category_id , @code , @name , @brand , @price , @discount_price , @image_url , @description , @status , @created_by";
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { category_id, code, product_name, brand, price, discount_price, image_url, description, status, user_id });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this, "Thêm sản phẩm thành công", "Thông báo", Utils.ToastType.Success);
                        //Chuyển hướng sang /admin/products.aspx sau 1.5s
                        Utils.DelayRedirect(this, "../admin/products.aspx", 1500);
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Thêm sản phẩm thất bại. Vui lòng thử lại!", "Thông báo", Utils.ToastType.Error);
                    }
                }
                catch (Exception ex)
                {
                    Utils.ShowToastr(this, "Lỗi", "Thông báo", Utils.ToastType.Error);
                }
            }
        }
    }
}