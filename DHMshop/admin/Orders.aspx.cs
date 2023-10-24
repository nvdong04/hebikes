using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindOrders();
            }
        }
        private void BindOrders()
        {
            string sql = "SELECT o.id,o.order_date,o.note,o.order_total_price,o.status,o.created_at,c.fullname,c.address,c.email,c.phone FROM orders AS o LEFT JOIN customers as c ON o.customer_id = c.id";
            gvOrders.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            gvOrders.DataBind();
        }
    }
}