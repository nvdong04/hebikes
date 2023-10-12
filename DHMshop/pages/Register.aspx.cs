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
                String full_name = txtFirstName.Text.Trim() +" "+ txtLastName.Text.Trim();
                String email = txtEmail.Text.Trim();
                String password = ComputeSha256Hash(txtPassword.Text.Trim());
                String sex = ddlSex.SelectedValue;
                String phone_number = txtPhone.Text.Trim();
                String address = txtAddress.Text.Trim();

                String sql = "EXEC dbo.sp_addCustomer @email , @password , @full_name , @sex , @phone_number , @address";
                int result = (int)DataConnect.Instance.ExecuteNonQuerySP(sql, new object[] { email,password,full_name,sex,phone_number,address });
                if(result > 0)
                {
                    Response.Write("Đăng ký tài khoản thành công");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Đăng ký thành công.Nhấn oke để chuyển đến trang đăng nhập'); setTimeout(function(){window.location.href ='../../login.aspx'}, 3000);", true);
                }
                else
                {
                    lbError.Text = "Email đã tồn tài, vui lòng thử lại!";
                    lbError.Visible = true;
                }
            }

        }

        protected static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}