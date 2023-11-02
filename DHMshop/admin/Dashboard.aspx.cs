using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DHMshop.admin;

namespace DHMshop
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected int[] arrray = new int[12] { 99, 98, 92, 97, 95,1,2,3,4,5,3,1 };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //BindData();
                arrray.ToString();
            }
        }
        //private void BindData()
        //{
        //    DataTable data = new DataTable();
        //    string sql = "WITH AllMonths AS (\r\n    SELECT 1 AS MonthNumber UNION ALL\r\n    SELECT 2 UNION ALL\r\n    SELECT 3 UNION ALL\r\n    SELECT 4 UNION ALL\r\n    SELECT 5 UNION ALL\r\n    SELECT 6 UNION ALL\r\n    SELECT 7 UNION ALL\r\n    SELECT 8 UNION ALL\r\n    SELECT 9 UNION ALL\r\n    SELECT 10 UNION ALL\r\n    SELECT 11 UNION ALL\r\n    SELECT 12\r\n)\r\n\r\nSELECT\r\n    m.MonthNumber AS Month,\r\n    COUNT(o.id) AS OrderCount\r\nFROM\r\n    AllMonths AS m\r\nLEFT JOIN\r\n    orders AS o ON MONTH(o.order_date) = m.MonthNumber\r\nGROUP BY\r\n    m.MonthNumber\r\nORDER BY\r\n    m.MonthNumber;";
        //    data = DatabaseConnection.Instance.ExecuteQuery(sql);
        //    arrray = data.Rows.OfType<DataRow>().Select(k => k[0].ToString()).ToArray();
        //}

    }
}