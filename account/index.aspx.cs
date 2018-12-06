using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_index : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        nav();
    }

    #region 导航
    /// <summary>
    /// 导航
    /// </summary>
    public void nav()
    {
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        dt = dp.C_dataList("SELECT [id],[name],[parentid],[img],[url]  FROM [nav_info] where parentid=0 and tag=0");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                
               
                DataTable dt1 = new DataTable();
                dt1 = dp.C_dataList("SELECT [id],[name],[parentid],[img],[url]  FROM [nav_info] where parentid=" + dt.Rows[i][0].ToString()+ " and tag=0");
                if (dt1.Rows.Count > 0)
                {

                    
                    
                    sb.Append("<li>");                   
                    sb.Append("<a href=\"" + dt.Rows[i][4].ToString() + "\" class=\"dropdown-toggle\">");
                    sb.Append("<i class=\"" + dt.Rows[i][3].ToString() + "\"></i>");
                    sb.Append("<span class=\"menu-text\"> " + dt.Rows[i][1].ToString() + " </span>");
                    sb.Append("<b class=\"arrow icon-angle-down\"></b>");
                    sb.Append("</a>");
                    sb.Append("<ul class=\"submenu\">");
                    for(int j = 0, lenj = dt1.Rows.Count; j < lenj; j++)
                    {                        
                        sb.Append("<li>");
                        sb.Append("<a href=\"" + dt1.Rows[j][4] + "\" target=\"cont\">");
                        sb.Append("<i class=\"" + dt1.Rows[j][3] + "\"></i>");
                        sb.Append("" + dt1.Rows[j][1] + "");
                        sb.Append("</a>");
                        sb.Append("</li>");
                    }
                    sb.Append("</ul>");
                }
                else
                {
                    if (i == 0)
                    {
                        sb.Append("<li class=\"active\">");
                    }
                    else
                    {
                        sb.Append("<li>");
                    }
                    sb.Append("<a href=\"" + dt.Rows[i][4].ToString() + "\" target=\"cont\">");
                    sb.Append("<i class=\"" + dt.Rows[i][3].ToString() + "\"></i>");
                    sb.Append("<span class=\"menu-text\"> " + dt.Rows[i][1].ToString() + " </span>");
                    sb.Append("</a>");
                }
                dt1.Dispose();
                sb.Append("</li>");
                ///sb.Append("\""+dt.Rows[i][3].ToString() +"\"");
            }
        }
        nav_list.InnerHtml = sb.ToString();
        dt.Dispose();
    }
    #endregion

}