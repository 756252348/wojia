using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_allcategory : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        string _id = Request["id"].ToString(),_pid=Request["pid"];
        txt_id.Value = _id;
        txt_pid.Value = _pid;
        if (_id != "0" )
        {
            bind(_id);
        }
    }
    #region 绑定数据
    public void bind(string id){
        object[] obj = new object[2];
        obj = dp.sel_news_type_info(new string[] { id});
        txt_name.Value = obj[1].ToString();
    }
    #endregion

    protected void btn_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj = dp.proc_news_type_info(new string[] { txt_id.Value,txt_pid.Value,Request["txt_name"],"0" });
        MessageBox.MessageBoxUp(obj[1].ToString(), "newscategory.aspx");
    }
}