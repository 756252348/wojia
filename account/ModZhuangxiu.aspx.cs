using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModZhuangxiu : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["id"]))
        {
            id = "0";

        }
        else
        {
            id = Request["id"];
            bind(id);
        }

    }

    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_news_infos(new string[] { id, "3", Request["txt_name"], Request["txt_cont"], Request["pro_img"], Request["txt_intro"], Request["txt_tj"] });
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }
    public void bind(string id)
    {
        object[] obj = new object[14];
        obj = dp.c_proc_select(new string[] { "7", id }, 6);
        txt_name.Value = obj[1].ToString();
        txt_intro.Value = obj[5].ToString();
        pro_img.Value = obj[2].ToString();
        editor1.InnerHtml = obj[3].ToString();
    }
}