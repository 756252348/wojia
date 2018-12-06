using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModMenDian : System.Web.UI.Page
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
        obj = dp.proc_shop_infos(new string[] { id, Request["txt_prv"], Request["txt_city"], Request["txt_address"], Request["txt_name"], Request["txt_phone"] });
        //string aaa = Request["txt_nid"];
        MessageBox.Location(obj[1].ToString(),"MenDianList.aspx");

    }
    public void bind(string id)
    {
        object[] obj = new object[6];
        obj = dp.c_proc_select(new string[] { "9", id }, 6);
        txt_name.Value = obj[1].ToString();
        tprv.Value = obj[3].ToString();
        tcity.Value = obj[4].ToString();
        txt_address.Value = obj[5].ToString();
        txt_phone.Value = obj[2].ToString();
     
    }

}