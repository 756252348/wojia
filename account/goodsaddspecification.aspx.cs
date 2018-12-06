using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_goodsaddspecification : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id = string.Empty, pid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["id"]))
        {
            id = "0";
        }
        else
        {
            id = Request["id"];
            DateBind();
        }
        pid = Request["pid"];
    }

    #region 绑定数据
    private void DateBind()
    {
        object[] obj = new object[4];
        if (dp.C_LoadArrayData("SELECT name,omoney,nmoney,num,addtime,uptime,tag  FROM prdct_type_info where id="+id, ref obj) == "1000")
        {
            txt_name.Value = obj[0].ToString();
            txt_omoney.Value = obj[1].ToString();
            txt_nmoney.Value = obj[2].ToString();
            txt_num.Value = obj[3].ToString();
        }
    }
    #endregion
    protected void btn_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj = dp.proc_prdct_type_info(new string[] { id, pid, Request["txt_name"], Request["txt_omoney"], Request["txt_nmoney"],Request["txt_num"] });
        //string aaa = Request["txt_nid"];
        MessageBox.Location(obj[1].ToString(), "goodsspecification.aspx?id=" + pid);

    }
}