using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModPrdctType : System.Web.UI.Page
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
        obj = dp.proc_prdct_type(new string[] { id, Request["txt_title"],"1"});
        //string aaa = Request["txt_nid"];
        MessageBox.Location(obj[1].ToString(), "prdct_typeList.aspx");

    }
    public void bind(string id)
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "4", id }, 2);
        txt_title.Value = obj[1].ToString();
      
    }
}