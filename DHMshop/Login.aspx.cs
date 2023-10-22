using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["customer_id"] != null)
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                String email = txtEmail.Text.Trim();
                String pass = Utils.ComputeSha256Hash(txtPass.Text.Trim());

                String sql = "SELECT COUNT(*) FROM dbo.customers WHERE email = '"+ email +"' AND password = '"+ pass +"'";
                int result = (int) DatabaseConnection.Instance.ExecuteScalar(sql);
                if (result > 0)
                {
                    String sq1 = String.Format("SELECT * FROM dbo.customers WHERE email = '{0}'", email);
                    DataTable table = DatabaseConnection.Instance.ExecuteQuery(sq1);
                    DataRow row = table.Rows[0];
                    Session["fullname"] = row["fullname"].ToString();
                    Session["email"] = email;
                    Session["customer_id"] = row["id"].ToString();
                    Response.Redirect("home.aspx");
                } else
                {
                    lbError.Text = "Sai thông tin tài khoản hoặc mật khẩu. Vui lòng thử lại.";
                    lbError.Visible = true;
                }
            }
        }
    }
}