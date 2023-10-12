using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            if (Request.QueryString["productID"] != null)
            {
                int id = int.Parse(Request.QueryString["productID"]);
                bind_data(id);

            }
        }

        public void bind_data(int id)
        {
            
        } 
    }
}