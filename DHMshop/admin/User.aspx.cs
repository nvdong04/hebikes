using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class User : System.Web.UI.Page
    {
        private bool IsUpdate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDataDropdown();
                //string acc = Request.QueryString["id"];
                IsUpdate = Request.QueryString["id"] != null ? true : false;              
                if (IsUpdate)
                {
                    lbStatus.Visible = true;
                    GetDataForUpdate();
                    btnCreateUser.Text = "Cập nhật";  
                    btnCreateUser.Click += new EventHandler(btnUpdateUser_Click);
                }
            }
        }

        private void GetDataDropdown()
        {
            // query tất cả role
            string sql = "select id, role_name from roles";
            ddlRole.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            ddlRole.DataValueField = "id";
            ddlRole.DataTextField = "role_name";
            ddlRole.DataBind();
        }

        private void GetDataForUpdate()
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            string query = String.Format("SELECT * FROM dbo.users where id={0}", id);
            DataTable table = DatabaseConnection.Instance.ExecuteQuery(query);
            DataRow row = table.Rows[0];
            txtUsername.Text = row["username"].ToString();
            txtEmail.Text = row["email"].ToString();
            txtPassword.Text = Utils.ComputeSha256Hash(row["password"].ToString());
            ddlRole.SelectedValue = row["role_id"].ToString();
            cbStatus.Checked = Convert.ToInt32(row["is_active"]) == 1;
        }

        protected void btnCreateUser_Click(object sender, EventArgs e) 
        {
            if(Page.IsValid)
            {
                //Lấy giá trị trong các input tag
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string email = txtEmail.Text.Trim();
                int role_id = Convert.ToInt32(ddlRole.SelectedValue);
                //Mã hoá password
                string encode_password = Utils.ComputeSha256Hash(password);
                string sql = "EXEC dbo.sp_create_user @username , @email , @password , @role_id";
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { username, email, encode_password, role_id });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this, "Thêm người dùng thành công", "Thông báo", Utils.ToastType.Success);
                        //Chuyển hướng sang /admin/users.aspx sau 1.5s
                        Utils.DelayRedirect(this, "../admin/users.aspx", 1000);
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Thêm người dùng thất bại. Vui lòng thử lại!", "Thông báo", Utils.ToastType.Error);
                    }
                }
                catch (Exception ex)
                {
                    Utils.ShowToastr(this, ex.Message, ex.GetType().Name, Utils.ToastType.Error);
                }
                
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int user_id = Int32.Parse(Request.QueryString["id"]);

                //Lấy giá trị trong các input tag
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string email = txtEmail.Text.Trim();
                int role_id = Convert.ToInt32(ddlRole.SelectedValue);
                //Mã hoá password
                string encode_password = Utils.ComputeSha256Hash(password);

                string sql = "EXEC dbo.sp_update_user @user_id @username , @email , @password , @role_id";
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { user_id, username, email, encode_password, role_id });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this,"Cập nhật người dùng thành công", "Thông báo", Utils.ToastType.Success);
                        //Chuyển hướng sang /admin/users.aspx sau 1.5s
                        Utils.DelayRedirect(this, "../admin/users.aspx", 1500);
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Cập nhật người dùng thất bại. Vui lòng thử lại!", "Thông báo", Utils.ToastType.Error);
                    }
                }
                catch (Exception ex)
                {
                    Utils.ShowToastr(this, ex.Message, ex.GetType().Name, Utils.ToastType.Error);
                }

            }
        }
    }
}