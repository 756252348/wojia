using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class service : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        bind3();
        div_1029.InnerHtml = bind4("1029");
        div_1030.InnerHtml = bind4("1030");
        div_1031.InnerHtml = bind4("1031");
        div_1032.InnerHtml = bind4("1032");
        div_1033.InnerHtml = bind4("1033");
        div_1034.InnerHtml = bind4("1034");
        div_1035.InnerHtml = bind4("1035");
        div_1036.InnerHtml = bind4("1036");
    }
    public void bind3()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "9" }, 7);
        string[] img = obj[2].ToString().Split('|');
        string _html = string.Empty;
        for (int i = 0; i < img.Length; i++)
        {
            _html += " <div class=\"itemList\"><div class=\"item\">";
            _html += "<img src=\"UploadFile/images/" + img[i] + "\" alt=\"\">";
            _html += "</div>";
            _html += "<p></p>";
            _html += "</div>";


        }
        Literal1.Text = _html;
    }

    public string bind4(string id)
    {
        object[] obj = new object[7];
        string _html = "";
        obj = dp.c_proc_select(new string[] { "8", id }, 7);
        if (obj != null)
        {
            _html = obj[4].ToString();
        }
        return _html;
    }
}