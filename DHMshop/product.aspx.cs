using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DHMshop
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                category.DataSource = DataConnect.Instance.ExecuteQuery("Select * from tb_category");
                category.DataBind();
                Bind_Data();
            }
            load_data();
            
        }

        public void load_data()
        {
            if (Request.QueryString["category"] != null)
            {
                int id = int.Parse(Request.QueryString["category"]);
                string sql = "Select * from tb_products where category_id=" + id;
                productList.DataSource = DataConnect.Instance.ExecuteQuery(sql);
                productList.DataBind();
            }
        }

        public void Bind_Data()
        {
            productList.DataSource = DataConnect.Instance.ExecuteQuery("Select * from tb_products");
            productList.DataBind();

            
        }
        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Bind_Data();
            load_data();
        }
    }
}