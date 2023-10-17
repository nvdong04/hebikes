using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace DHMshop
{
    public partial class register : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["customer"] != null )
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String full_name = txtFullName.Text.Trim();
                String email = txtEmail.Text.Trim();
                String password = Utils.ComputeSha256Hash(txtPassword.Text.Trim());
                String phone_number = txtPhone.Text.Trim();
                String address = txtAddress.Text.Trim();

                String sql = "EXEC dbo.sp_create_customer @fullname , @email , @password , @phone , @address";
                bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { full_name,email,password,phone_number,address });
                if(result)
                {

                    Utils.ShowToastr(this, "Đăng ký tài khoản thành công", "Thông báo", Utils.ToastType.Success);
                    Response.Redirect("success.aspx");
                    //Response.Write("Đăng ký tài khoản thành công");
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Đăng ký thành công.Nhấn oke để chuyển đến trang đăng nhập'); setTimeout(function(){window.location.href ='../../login.aspx'}, 3000);", true);
                }
                else
                {
                    lbError.Text = "Email đã tồn tài, vui lòng thử lại!";
                    lbError.Visible = true;
                }
            }

        }
    }
}