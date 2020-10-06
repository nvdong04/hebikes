using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load_data();
            }
        }

        protected void load_data()
        {
            //Load ddl Loại sản phẩm
            ddlProductCategory.DataSource = DataConnect.Instance.ExecuteQuery("SELECT * FROM dbo.tb_category");
            ddlProductCategory.DataTextField = "name";
            ddlProductCategory.DataValueField = "id";
            ddlProductCategory.DataBind();
        }

        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
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

        protected void btnUpLoad_Click(object sender, EventArgs e)
        {
            if (fileUploadImg.HasFile)
            {
                if (CheckFileType(fileUploadImg.FileName))
                {
                    string fileName = "../public/image/product/" + fileUploadImg.FileName;
                    string filePath = MapPath(fileName);
                    fileUploadImg.SaveAs(filePath);
                    imgUpLoad.ImageUrl = fileName;
                }
                else
                {
                    string alert = "";
                    alert += "<script>alert('Chỉ nhận file ảnh!!!');</script>";
                    Response.Write(alert);
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string product_name = txtProductName.Text.Trim();
                string description = txtProductDescription.Text.Trim();
                string detail = txtProductDetail.Text.Trim();
                string img = imgUpLoad.ImageUrl;
                float price = float.Parse(txtProductPrice.Text.Trim());
                float discount_price = float.Parse(txtProductDiscountPrice.Text.Trim());
                int size = Int32.Parse(txtProductSize.Text.Trim());
                string color = txtProductColor.Text.Trim();
                int quantity = Int32.Parse(txtProductQuantity.Text.Trim());
                int status = Int32.Parse(txtProductStatus.Text.Trim());
                int category_id = Int32.Parse(ddlProductCategory.SelectedValue);

                String sql = "EXEC dbo.sp_addProduct @name , @description , @detail , @img , @price , @discount_price , @size , @color , @quantity , @status , @category_id";
                int result = (int)DataConnect.Instance.ExecuteNonQuerySP(sql, new object[] { product_name, description, detail, img, price, discount_price, size, color, quantity, status, category_id });
                if (result > 0)
                {
                    Response.Write("Thêm sản phẩm thành công");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm thành công'); setTimeout(function(){window.location.href ='../../products.aspx'}, 3000);", true);
                }
                else
                {

                }
            }
        }
    }
}