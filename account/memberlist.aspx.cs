using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_memberlist : System.Web.UI.Page
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

        WebControl.CreatTable(showTable, "id,nickname,openid,name,sex,tel,money,point,addtime", "编号,昵称,微信标识,姓名,性别,电话,余额,积分,添加时间", dp.C_Pagination(new string[] { PageIndex, "50", "id,nickname,openid,name,case sex when 0 then '女' else '男' end as sex,tel,money,point,addtime", "user_info", " tag=0", "ID DESC" }, ref RecordCount, ref PageCount), "", "user_info", false);
        paging.InnerHtml = WebControl.Pagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
}