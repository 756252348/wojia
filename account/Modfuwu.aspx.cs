using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_Modfuwu : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["nid"]))
        {
            Response.Redirect("index.aspx");

        }
        else
        {
            id = Request["nid"];
            bind(id);
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_article_infos(new string[] { id, "", "", Request["txt_cont"], "", "" });
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }
    public void bind(string id)
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "8", id }, 7);
        if (obj != null) {
            editor1.InnerHtml = obj[4].ToString();
        }
     
    }
}