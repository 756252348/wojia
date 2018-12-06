using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_settingnav : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        navlist.Text = databind("0");
    }
    #region 绑定类别
    public string databind(string parentid)
    {
        DataTable dt = new DataTable();
        dt = dp.C_dataList("select id,[name],parentid,[img],[url] from nav_info where tag=0 and parentid= " + parentid);
        StringBuilder sb = new StringBuilder();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0, leng = dt.Rows.Count; i < leng; i++)
            {
                sb.Append("<ol class=\"dd-list\">");
                sb.Append("<li class=\"dd-item\" data-id=\"" + dt.Rows[i][0].ToString() + "\">");
                sb.Append("<div class=\"dd-handle\">");
                sb.Append("<span>");
                sb.Append(dt.Rows[i][1].ToString());
                sb.Append("</span>");
                sb.Append("<div class=\"pull-right action-buttons\">");
                if (dt.Rows[i][2].ToString() == "0")
                {
                    sb.Append("<a class=\"green newitem\" href=\"javascript:;\" data-id=\"0\" data-pid=\"" + dt.Rows[i][0].ToString() + "\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"添加子类\">");
                    sb.Append("<i class=\"icon-plus bigger-130\"></i>");
                    sb.Append("</a>");
                }
                

                sb.Append("<a class=\"blue newitem\" href=\"javascript:;\" data-url=\"" + dt.Rows[i][4].ToString() + "\" data-img=\"" + dt.Rows[i][3].ToString() + "\" data-id=\"" + dt.Rows[i][0].ToString() + "\" data-pid=\"" + dt.Rows[i][2].ToString() + "\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"编辑\">");
                sb.Append("<i class=\"icon-pencil bigger-130\"></i>");
                sb.Append("</a>");
                sb.Append("<a class=\"red\" href=\"javascript:;\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"删除\">");
                sb.Append("<i class=\"icon-trash bigger-130\"></i>");
                sb.Append("</a>");
                sb.Append("</div>");
                sb.Append("</div>");

                sb.Append(databind(dt.Rows[i][0].ToString()));
                sb.Append("</li>");
                sb.Append("</ol>");
            }
        }
        return sb.ToString();
    }
    #endregion

    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_nav_info(new string[] { Request["txt_id"], Request["txt_pid"], Request["txt_name"], Request["txt_img"], Request["txt_url"], "0" });
        MessageBox.ReLocation(obj[1].ToString());
    }
}