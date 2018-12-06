using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_gongyi : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_article_info(new string[] { "7", "13", "", "", Request["txt_cont"], "", "" });
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }
    public void bind()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "7" }, 7);
        editor1.InnerHtml = obj[4].ToString();
    }
}