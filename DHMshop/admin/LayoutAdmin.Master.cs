using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.Admin
{
    public partial class LayoutAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}