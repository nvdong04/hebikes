using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DHMshop.admin;
using Newtonsoft.Json;

namespace DHMshop
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindProductLastest();
                BindProductSaling();
            }
        }

        protected void BindProductLastest()
        {
            //Get 10 sản phẩm mới nhất
            string sql = "select top 10 * from products order by created_at desc";
            lvProductLatest.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            lvProductLatest.DataBind();
        }
        protected void BindProductSaling()
        {
            //Get 10 sản phẩm đang sale lớn nhất
            string sql = "select top 10 * from products where discount_price > 0 order by discount_price desc";
            lvProductSaling.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql);
            lvProductSaling.DataBind();
        }
    }
}