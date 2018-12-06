using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_orderlist : System.Web.UI.Page
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

        WebControl.CreatCheckTable(showTable, "id,codeno,uid,states,money,num,uname,provience,city,area,address,tel,addtime", "编号,订单编号,会员id,订单状态,总价,总数量,收件人姓名,省,市,县,地址,电话,添加时间", dp.C_Pagination(new string[] { PageIndex, "50", "id,codeno,uid,case states when '0' then '订单未支付' when '1' then '支付未发货'when '2' then '发货未确认'when '3' then '确认未评价' else '完成' end as states,money,num,uname,provience,city,area,address,tel,addtime", "order_info", " tag=0", "ID DESC" }, ref RecordCount, ref PageCount), "", "order_info",false);
        paging.InnerHtml = WebControl.Pagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
}