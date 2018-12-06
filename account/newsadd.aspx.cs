using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class account_newsadd : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["id"]))
        {
            id = "0";
        }
        else
        {
            id = Request["id"];
        }
        txt_newslist.Value = "["+ newstypelist("0",0)+ "]";
    }
    #region 绑定下拉框
    private string newstypelist(string parentid,int idex)
    {
        DataTable dt = new DataTable();
        dt = dp.C_dataList("select id,[name],parentid from news_type_info where tag=0 and parentid= " + parentid);
        StringBuilder sb = new StringBuilder();
        sb.Append("");
        if (dt.Rows.Count > 0){
          
            DataTable dt1 = new DataTable();
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                sb.Append("{\"v\":\""+ dt.Rows[i][0].ToString() + "\",\"n\":\""+dt.Rows[i][1].ToString()+"\"");
                dt1 = dp.C_dataList("select id,[name],parentid from news_type_info where tag=0 and parentid= " + dt.Rows[i][0].ToString());
                if (dt1.Rows.Count > 0)
                {
                    sb.Append(",\"s\":[");
                    sb.Append(newstypelist(dt.Rows[i][0].ToString(),1));
                    sb.Append("]");
                }
                sb.Append("},");
            }
            sb.Remove(sb.Length - 1, 1);        
        }
        
        dt.Dispose();
        return sb.ToString();
        //newstypelist(string parentid)
    }
    #endregion
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_news_info(new string[] {id ,Request["txt_nid"], Request["txt_title"], Request["pro_img"], Request["pro_img2"], Request["txt_cont"], Request["txt_dis"], Request["txt_link"] });
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }


}
