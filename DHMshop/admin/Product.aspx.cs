using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected string upload()
        {
            if (fileProductImg.HasFile)
            {
                if (CheckFileType(fileProductImg.FileName))
                {
                    string fileName = "../public/image/product/" + fileProductImg.FileName;
                    string filePath = MapPath(fileName);
                    fileProductImg.SaveAs(filePath);
                    //imgUpLoad.ImageUrl = fileName;
                    return fileName;
                }
                else
                {
                    string alert = "";
                    alert += "<script>alert('Chỉ nhận file ảnh!!!');</script>";
                    Response.Write(alert);
                }
            }
            return "";
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string product_name = txtProductName.Text.Trim();
                string code = txtProductCode.Text.Trim();
                string brand = txtBrand.Text.Trim();
                //string img = imgUpLoad.ImageUrl;
                float price = float.Parse(txtProductPrice.Text.Trim());
                float discount_price = float.Parse(txtDiscountPrice.Text.Trim());
                int status = cbStatus.Checked ? 1 : 0;
                //int category_id = Int32.Parse(ddlProductCategory.SelectedValue);
                string description = txtDescription.Text.Trim();
                

                //String sql = "EXEC dbo.sp_addProduct @name , @description , @detail , @img , @price , @discount_price , @size , @color , @quantity , @status , @category_id";
                //int result = (int)DataConnect.Instance.ExecuteNonQuerySP(sql, new object[] { product_name, description, detail, img, price, discount_price, size, color, quantity, status, category_id });
                //if (result > 0)
                //{
                //    Response.Write("Thêm sản phẩm thành công");
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Thêm sản phẩm thành công'); setTimeout(function(){window.location.href ='/../admin/products.aspx'}, 3000);", true);
                //}
                //else
                //{

                //}
            }
        }
    }
}