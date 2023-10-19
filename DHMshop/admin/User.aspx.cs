using System;
using System.Collections.Generic;
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
                IsUpdate = Request.QueryString["id"] != "" ? true : false;

                if (IsUpdate)
                {
                    btnAddNewUser.Text = "Cập nhật";
                }
            }
        }

        protected void GetDataDropdown()
        {
            // query tất cả role
            string sql = "select id, role_name from roles";
            ddlRole.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            ddlRole.DataValueField = "id";
            ddlRole.DataTextField = "role_name";
            ddlRole.DataBind();
        }

        protected void btnAddNewUser_Click(object sender, EventArgs e) 
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

                String sql = "EXEC dbo.sp_create_user @username , @email , @password , @role_id";
                try
                {
                    bool result = DatabaseConnection.Instance.ExecuteNonQuerySP(sql, new object[] { username, email, encode_password, role_id });
                    if (result)
                    {
                        // Hiện thông báo thêm thành công
                        Utils.ShowToastr(this, "Thêm người dùng thành công", "Thông báo", Utils.ToastType.Success);
                        //Chuyển hướng sang /admin/users.aspx sau 1s
                        Utils.DelayRedirect(this, "../admin/users.aspx", 1500);
                    }
                    else
                    {
                        Utils.ShowToastr(this, "Thêm người dùng thất bại", "Thông báo", Utils.ToastType.Error);
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