using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class store : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        string keywords = string.IsNullOrEmpty(Request["keywords"]) ? "" : " and title like '%" + Request["keywords"] + "%'",
               prv = string.IsNullOrEmpty(Request["prv"]) ? "" : " and province = '" + Request["prv"] + "'",
               county = string.IsNullOrEmpty(Request["county"]) ? "" : " and county = '" + Request["county"] + "'";
        DataTable dt = new DataTable();
        string sql = "select id,title,phone,province,county,address from shop_info where id>0{0}";
        dt = dp.C_dataList(string.Format(sql, (keywords + prv + county)));
        string _html = string.Empty;
        if (dt.Rows.Count > 0)
        {

            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                _html += "<a href=\"javascript:void(0);\" onclick=\"openWindow('http://map.baidu.com/?l=&s=s%26wd%3D"+dt.Rows[i]["address"]+"',this)\">";
                _html += "<div class=\"net_line\">";
                _html += "<div class=\"div_line_name\">" + dt.Rows[i]["title"] + "</div>";
                _html += "<div class=\"div_line_address\">" + dt.Rows[i]["address"] + "</div>";
                _html += "<div class=\"div_line_tel\">" + dt.Rows[i]["phone"] + "</div>";
                _html += "</div>";
                _html += "</a>";

            }
            Literal1.Text = _html;
        }
        dt.Dispose();
        
    }
}