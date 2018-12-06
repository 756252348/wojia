using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModCompany : System.Web.UI.Page
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
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_article_info(new string[] { id, "11", Request["txt_title"], "", "", Request["txt_dis"], "" });
        //string aaa = Request["txt_nid"];
        MessageBox.Location(obj[1].ToString(),"CompanyList.aspx");

    }
   
}