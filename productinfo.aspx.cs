using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class productinfo : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    { 

        if (string.IsNullOrEmpty(Request["id"]))
        {
            Response.Redirect("products.aspx");

        }
        else
        {
            id = Request["id"];
            bind(id);
        }
    }
    public void bind(string id)
    {
        object[] obj = new object[14];
        obj = dp.c_proc_select(new string[] { "5", id }, 14);
        divtit.InnerHtml = obj[2].ToString();
        divdec.InnerHtml = obj[3].ToString();
        divpinpai.InnerHtml = obj[4].ToString();
        divxl.InnerHtml = obj[12].ToString();
        divdw.InnerHtml = obj[5].ToString();
        divfg.InnerHtml = obj[6].ToString();
        divmz.InnerHtml = obj[7].ToString();
        divys.InnerHtml = obj[8].ToString();
        divkj.InnerHtml = obj[9].ToString();
        Literal1.Text = obj[11].ToString();
        string[] img = obj[10].ToString().Split('|');
        string _html = string.Empty; string _html1 = string.Empty;
        for (int i = 0; i < img.Length; i++)
        {
            _html += "<li class=\"clone\">";
            _html += "<img src=\"UploadFile/images/" + img[i] + "\" alt=\"\">";
            _html += "</li>";
            _html1 += "<li>";
            _html1 += "<img src=\"UploadFile/images/" + img[i] + "\" alt=\"\">";
            _html1 += "</li>";
        }
        Literal2.Text = _html;
        Literal3.Text = _html1;
    }
}