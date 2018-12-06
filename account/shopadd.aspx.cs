using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_shopadd : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_shop_info(new string[] { "0", Request["txt_name"], Request["pro_img"], Request["pro_img2"], Request["txt_intro"], Request["txt_addr"], Request["txt_lng"] , Request["txt_lat"] });
        
        MessageBox.ReLocation(obj[1].ToString());

    }
}