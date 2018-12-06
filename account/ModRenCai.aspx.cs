using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModRenCai : System.Web.UI.Page
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
        obj = dp.proc_advertise_info(new string[] { id, Request["txt_num"], Request["txt_title"], Request["txt_adder"], Request["txt_cont"], Request["test6"].Trim().Substring(0,10), Request["test6"].Trim().Substring(12, 10) });
        //string aaa = Request["txt_nid"];
        MessageBox.Location(obj[1].ToString(),"rencaiList.aspx");

    }
    public void bind(string id)
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "3", id }, 7);
        txt_title.Value = obj[1].ToString();
        txt_num.Value = obj[2].ToString();
        txt_adder.Value = obj[3].ToString();
        test6.Value = obj[5].ToString()+'-'+ obj[6].ToString();
      
        
        editor1.InnerHtml = obj[4].ToString();
    }
}