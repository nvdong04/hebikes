using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            string sql = "select * from users left join roles on roles.id = users.role_id";
            gvUsers.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            gvUsers.DataBind();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvUsers.DataKeys[e.RowIndex].Value.ToString();
            String sql = "DELETE FROM dbo.users WHERE id =" + id;
            bool result = DatabaseConnection.Instance.ExecuteNonQuery(sql);
            BindUsers();
        }
    }
}