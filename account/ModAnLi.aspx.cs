using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_ModAnLi : System.Web.UI.Page
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
            bind(id);
        }
        txt_goodslist.Value = "[" + goodstypelist("0") + "]";
    }
    #region 绑定下拉框

    private string goodstypelist(string parentid)
    {
        DataTable dt = new DataTable();
        string sql = "select id,[name] from prdct_type where tag=0 and type=2";
        if (parentid != "0")
        {
            sql = "select id,[name] from prdct_type where tag=0 and type=2 and id=" + parentid;
        }
        dt = dp.C_dataList(sql);
        StringBuilder sb = new StringBuilder();
        sb.Append("");
        if (dt.Rows.Count > 0)
        {
            DataTable dt1 = new DataTable();
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                sb.Append("{\"v\":\"" + dt.Rows[i][0].ToString() + "\",\"n\":\"" + dt.Rows[i][1].ToString() + "\"");

                sb.Append("},");
            }
            sb.Remove(sb.Length - 1, 1);
        }
        dt.Dispose();
        return sb.ToString();
    }



    #endregion


    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_case_info(new string[] { id, Request["txt_tid"], Request["txt_name"], Request["txt_cont"], Request["pro_img"]});
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }
    public void bind(string id)
    {
        object[] obj = new object[6];
        obj = dp.c_proc_select(new string[] { "6", id }, 6);
        txt_name.Value = obj[2].ToString();
      
        pro_img.Value = obj[4].ToString();
        editor1.InnerHtml = obj[3].ToString();
    }
}