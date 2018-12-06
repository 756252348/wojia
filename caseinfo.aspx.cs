using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class caseinfo : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["id"]))
        {
            id = "0";
            Response.Redirect("cases.aspx");
        }
        else
        {
            id = Request["id"];
            bind(id);
        }
        ListBind();
    }
    public void bind(string id)
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "6", id },7);
        div_tit.Text = obj[2].ToString();
        div_date.Text = obj[6].ToString();
        //pro_img.Value = obj[4].ToString();
        div_content.Text = obj[3].ToString();
    }
    public void ListBind()
    {
        DataTable dt = dp.C_CommonList("select top 5 id,title,img from Case_info where tag=0 order by NEWID()");
        string _html = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            _html += "<div class=\"prol ml0\">";
            _html += "<div class=\"pic\" ><a href=\"caseinfo.aspx?id=" + dt.Rows[i]["id"].ToString()+"\" target =\"_blank\" ></a><img src=\"UploadFile/images/"+dt.Rows[i]["img"].ToString().Split('|')[0]+"\" ></div>";
            _html += "<div class=\"con\" > ";
            _html += "<div class=\"tit\" >" + dt.Rows[i]["title"].ToString() + "</div>";
            _html += "<div class=\"desc1\" ></div>";
            _html += "<a href=\"caseinfo.aspx?id=" + dt.Rows[i]["id"].ToString() + "\" class=\"more\" target =\"_blank\" > more</a> </div>";
            _html += "</div>";

        }
        left.Text = _html;
    }
}