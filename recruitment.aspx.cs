using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recruitment : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        Banner();
    }
    public void Banner()
    {
        string _html = string.Empty;
        DataTable dt = dp.C_CommonList("select Id,title,num,workadder,addtime,modtime,posttime,cnt FROM Advertise_info");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                _html += "<li class=\"\"> <span>" + dt.Rows[i]["title"].ToString() + "</span><span class=\"phonehide\">" + dt.Rows[i]["num"].ToString() + "</span><span  class=\"phonehide\">" + dt.Rows[i]["workadder"].ToString() + "</span><span>" + Convert.ToDateTime(dt.Rows[i]["addtime"]).ToString("yyyy-MM-dd") + "</span><span class=\"end_time\">" + Convert.ToDateTime(dt.Rows[i]["posttime"]).ToString("yyyy-MM-dd") + "<em class=\"closeup\"></em></span> </li>";
                _html += "<div class=\"dis_recruit\" style=\"display: none;\">";
                _html += dt.Rows[i]["cnt"].ToString();
                _html += "</div>";

            }
        }
        Literal1.Text = _html;
    }
}