using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using K_ON;
using System.Data;
using System.Text;
public partial class account_goodslist : System.Web.UI.Page
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

        WebControl.CreatCheckTable(showTable, "id,name,title,sweet,addtime", "编号,商品名称,标题,甜度,添加时间", dp.C_Pagination(new string[] { PageIndex, "50", "id,name,title,sweet,addtime", "prdct_info", " tag=0", "ID DESC" }, ref RecordCount, ref PageCount), "goodsadd.aspx?id=", "goods", true);
        paging.InnerHtml = WebControl.Pagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }

}