using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_goodsadd : System.Web.UI.Page
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
        txt_goodslist.Value = "[" + goodstypelist("0") + "]";
       // txt_shoplist.Value = "[" + shopstypelist() + "]";
        lablelist.Text=checkbox();
    }
    #region 绑定下拉框

    private string goodstypelist(string parentid)
    {
        DataTable dt = new DataTable();
        dt = dp.C_dataList("select id,[name],parentid from type_info where tag=0 and parentid=" + parentid);
        StringBuilder sb = new StringBuilder();
        sb.Append("");
        if (dt.Rows.Count > 0)
        {
            DataTable dt1 = new DataTable();
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                sb.Append("{\"v\":\"" + dt.Rows[i][0].ToString() + "\",\"n\":\"" + dt.Rows[i][1].ToString() + "\"");
                dt1 = dp.C_dataList("select id,[name],parentid from type_info where tag=0 and parentid=" + dt.Rows[i][0].ToString());
                if (dt1.Rows.Count > 0)
                {
                    sb.Append(",\"s\":[");
                    sb.Append(goodstypelist(dt.Rows[i][0].ToString()));
                    sb.Append("]");
                }
                sb.Append("},");
            }
            sb.Remove(sb.Length - 1, 1);
        }
        dt.Dispose();
        return sb.ToString();
    }

    private string checkbox()
    {
        DataTable dt = new DataTable();
        dt = dp.C_dataList("select id,[name] from prdct_lable_info where tag=0");
        StringBuilder sb = new StringBuilder();
        sb.Append("");
        if (dt.Rows.Count > 0)
        {
           
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
               sb.Append(" <div class=\"col-md-1\"><div class=\"checkbox\"><label><input type=\"checkbox\" name=\"txt_table\" value=\"" + dt.Rows[i][0].ToString()+ "\" class=\"ace\" /><span class=\"lbl aaa\">"+ dt.Rows[i][1].ToString() + "</span>  </label></div></div>");
            }
            //sb.Remove(sb.Length - 1, 1);
        }
        dt.Dispose();
        return sb.ToString();
    }

    #endregion

    #region 店铺选择
    private string shopstypelist()
    {
        DataTable dt = new DataTable();
        dt = dp.C_dataList("select id,[name] from shop_info where tag=0");
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
        obj = dp.proc_prdct_info(new string[] { id, "0", Request["txt_name"], Request["txt_tid"], Request["pro_img"], Request["pro_img2"], "0", "0", Request["txt_cont"], Request["txt_intro"], Request["txt_brand"], Request["txt_sj"], Request["txt_tj"], Request["txt_title"], Request["txt_sweet"], string.Join("|", Request.Params.GetValues("txt_table")) });
        //string aaa = Request["txt_nid"];
        MessageBox.ReLocation(obj[1].ToString());

    }



}