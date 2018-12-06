using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newinfo : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["id"]))
        {
            id = "0";
            Response.Redirect("news.aspx");
        }
        else
        {
            id = Request["id"];
            bind(id);
        }
    }
    public void bind(string id)
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "7", id }, 7);
        div_tit.Text = obj[1].ToString();
        div_date.Text ="发布时间:"+ obj[6].ToString();
        //pro_img.Value = obj[4].ToString();
        div_content.Text = obj[3].ToString();
    }
}