using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop.admin
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData1();
                BindData2();
                BindData3();
            }
        }
        private void BindData1()
        {
            string sql = "SELECT\r\n   TOP 5 c.name AS category_name,\r\n    c.status,\r\n    COUNT(p.id) AS product_count\r\nFROM\r\n    categorys AS c\r\nLEFT JOIN\r\n    products AS p ON p.category_id = c.id\r\nGROUP BY\r\n    c.name,\r\n    c.status\r\nORDER BY\r\n    c.name;";
            gvReport.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            gvReport.DataBind();
        }
        private void BindData2()
        {
            string sql = "SELECT\r\n   TOP 5 p.name AS product_name,\r\n    SUM(od.quantity) AS total_quantity_sold\r\nFROM\r\n    products AS p\r\nINNER JOIN\r\n    order_details AS od ON p.id = od.product_id\r\nGROUP BY\r\n    p.name\r\nORDER BY\r\n    total_quantity_sold DESC;";
            GridView1.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            GridView1.DataBind();
        }

        private void BindData3()
        {
            string sql = "SELECT\r\n    DATEPART(YEAR, order_date) AS order_year,\r\n    DATEPART(MONTH, order_date) AS order_month,\r\n    COUNT(id) AS order_count\r\nFROM\r\n    orders\r\nGROUP BY\r\n    DATEPART(YEAR, order_date),\r\n    DATEPART(MONTH, order_date)\r\nORDER BY\r\n    order_year, order_month;";
            GridView2.DataSource = DatabaseConnection.Instance.ExecuteQuery(sql).DefaultView;
            GridView2.DataBind();
        }
    }
}