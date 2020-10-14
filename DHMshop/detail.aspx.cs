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
                if (Request.QueryString["productID"] != null)
                {
                    string id = Request.QueryString["productID"];
                    string sql = "Select * from tb_products where id=" + id;
                    DataConnect.Instance.ExecuteQuery(sql);
                    productDetail.DataSource = DataConnect.Instance.ExecuteQuery(sql);
                    productDetail.DataBind();
                }
            }
        }
    }
}