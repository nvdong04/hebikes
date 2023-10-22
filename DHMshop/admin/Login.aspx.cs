using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace DHMshop.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                String email = txtEmail.Text.Trim();
                String pass = Utils.ComputeSha256Hash(txtPass.Text.Trim());

                String sql = "SELECT COUNT(*) FROM dbo.users WHERE email = '" + email + "' AND password = '" + pass + "'";
                int result = (int)DatabaseConnection.Instance.ExecuteScalar(sql);
                if (result > 0)
                {
                    String sq1 = String.Format("SELECT users.id as user_id,* FROM users LEFT JOIN roles ON roles.id = users.role_id WHERE email = '{0}'", email);
                    DataTable table = DatabaseConnection.Instance.ExecuteQuery(sq1);
                    DataRow row = table.Rows[0];
                    Session["username"] = row["username"].ToString();
                    Session["email"] = email;
                    Session["user_id"] = row["user_id"].ToString();
                    Session["role"] = row["role_name"].ToString();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    lbError.Text = "Sai thông tin tài khoản hoặc mật khẩu. Vui lòng thử lại.";
                    lbError.Visible = true;
                }
            }
        }
    }
}