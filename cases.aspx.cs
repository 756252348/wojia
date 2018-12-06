using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cases : System.Web.UI.Page
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
               type = string.IsNullOrEmpty(Request["type"]) ? "" : " and prdctId=" + Request["type"],
               keywords = string.IsNullOrEmpty(Request["keywords"]) ? "" : " and title like '%" + Request["keywords"] + "%'";
        DataTable dt = new DataTable();
        dt = dp.C_Pagination(new string[] { PageIndex, "20", "id,title,Img", "Case_info", " tag=0" + type + keywords, "ID DESC" }, ref RecordCount, ref PageCount);
        string _html = string.Empty;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            _html += "<div class=\"prol\">";
            _html += "<div class=\"pic\"><a href=\"caseinfo.aspx?id=" + dt.Rows[i]["id"].ToString() + "\" target=\"_blank\"></a><img src=\"UploadFile/images/" + dt.Rows[i]["Img"].ToString().Split('|')[0] + "\" alt=\"\"></div>";
            _html += "<div class=\"con\"><div class=\"tit\">" + dt.Rows[i]["title"].ToString() + "</div>";
            _html += "<div class=\"desc1\"></div>";
            _html += "<a href=\"caseinfo.aspx?id=" + dt.Rows[i]["id"].ToString() + "\" class=\"more\" target=\"_blank\">More</a> </div></div>";

        }
        dt.Dispose();
        Literal2.Text = goodstypelist();
        Literal3.Text = _html;
        Literal1.Text = WebControl.WebPagination(Common.S_Int(PageIndex), Common.S_Int(RecordCount), Common.S_Int(PageCount));
    }
    private string goodstypelist()
    {
        DataTable dt = new DataTable();
        string sql = "select id,[name] from prdct_type where tag=0 and type=2";
        dt = dp.C_dataList(sql);
        string _html = string.Empty;
        if (dt.Rows.Count > 0)
        {

            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                _html += "<li><a href=\"cases.aspx?type=" + dt.Rows[i]["id"].ToString() + "&txt=" + dt.Rows[i]["name"].ToString() + "\">" + dt.Rows[i]["name"].ToString() + "</a></li>";

            }

        }
        dt.Dispose();
        return _html;
    }
}