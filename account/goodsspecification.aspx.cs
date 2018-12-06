using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_goodsspecification : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDate(0);
        }
    }
    public void bindDate(int _Page)
    {
        string RecordCount = "0",
               PageCount = "0",
               Swhere = string.Empty,
               PageIndex = _Page == 0 ? Common.Q_Int("Page", 0).ToString() : _Page.ToString();
        if (string.IsNullOrEmpty(Request["id"]))
        {
            Response.Redirect("goodslist.aspx");
            return;
        }
        else
        {
            Swhere = " pid ="+Request["id"]+" and  tag = 0 ";
        }
        WebControl.CreatCheckTable(showsp, "id,name,omoney,nmoney,num,addtime", "编号,规格名称,原价,现价,数量,添加时间", dp.C_Pagination(new string[] { PageIndex, "50", "id,name,omoney,nmoney,num,addtime", "prdct_type_info", Swhere,"ID DESC" },ref RecordCount,ref PageCount),"","",false);
        paging.InnerHtml = WebControl.Pagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
}