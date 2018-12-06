using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_anliList : System.Web.UI.Page
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
               PageIndex = _Page == 0 ? Common.Q_Int("Page", 0).ToString() : _Page.ToString();

        WebControl.CreatTable(showTable, "id,prdctname,title,addtime", "编号,案例类型,名称,添加时间", dp.C_Pagination(new string[] { PageIndex, "50", "id,(select name from prdct_type where id=prdctId) as prdctname,title,addtime", "case_info", " tag=0", "ID DESC" }, ref RecordCount, ref PageCount), "ModAnli.aspx?id=", "goods", true);
        paging.InnerHtml = WebControl.Pagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
}