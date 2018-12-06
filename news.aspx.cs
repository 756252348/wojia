using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
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
               PageIndex = _Page == 0 ? Common.Q_Int("Page", 0).ToString() : _Page.ToString(),
               type = string.IsNullOrEmpty(Request["type"]) ? " and type=1" : " and type=" + Request["type"],
               keywords = string.IsNullOrEmpty(Request["keywords"]) ? "" : " and title like '%" + Request["keywords"] + "%'";
        DataTable dt = new DataTable();
        dt = dp.C_Pagination(new string[] { PageIndex, "20", "id,title,Img,decsriptor,addtime", "News_info", " tag=0" + type + keywords, "ID DESC" }, ref RecordCount, ref PageCount);
        string _html = string.Empty;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
         
            _html += "<div class=\"newslist\">";
            _html += "<div class=\"date\"><b>"+(i+1).ToString()+"</b><span>"+Convert.ToDateTime(dt.Rows[i]["addtime"].ToString()).ToString("yyyy-MM")  +"</span></div>";
            _html += "<div class=\"con\"> <a href=\"newinfo.aspx?id="+ dt.Rows[i]["id"].ToString() + "\" target=\"_blank\">";
            _html += "<div class=\"tit\">" + dt.Rows[i]["title"].ToString() + "</div></a>";
            _html += "<div class=\"desc\">" + dt.Rows[i]["decsriptor"].ToString() + "</div>";
            _html += "<div class=\"more\"><a href=\"newinfo.aspx?id="+ dt.Rows[i]["id"].ToString() + "\" target=\"_blank\">查看更多</a></div></div>";
            _html += "<div class=\"pic\"><a href=\"newinfo.aspx?id="+ dt.Rows[i]["id"].ToString() + "\" target=\"_blank\"><img src=\"UploadFile/images/" + dt.Rows[i]["Img"].ToString().Split('|')[0] + "\" alt=\"风格反映性格 你喜欢怎样的家居风格？\"></a></div>";
            _html += "<div class=\"clear\"></div></div>";


        }
        dt.Dispose();

        Literal3.Text = _html;
        Literal1.Text = WebControl.WebPagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
}