using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class introduce : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
        bind1();
        bind2();
        bind3();
    }
    /// <summary>
    /// 企业介绍
    /// </summary>
    public void bind()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "5" }, 7);
        Literal1.Text = obj[4].ToString();
    }
    /// <summary>
    /// 品牌荣誉
    /// </summary>
    public void bind1()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "6" }, 7);
        string[] img = obj[2].ToString().Split('|');
        string _html = string.Empty;
        if (img.Length > 0 && !string.IsNullOrEmpty(img[0]))
        {
            for (int i = 0; i < img.Length; i++)
            {
                _html += "<li>";
                _html += "<div class=\"pic\">";
                _html += "<img src=\"UploadFile/images/" + img[i] + "\" />";
                _html += "</div><p></p></li>";


            }
        }
        else
        {
            _html = "<p style='text-align: center; font-size: 16px; color: #666'>跟多荣誉敬请期待......</p>";
        }
        Literal2.Text = _html;
    }
    /// <summary>
    /// 设备工艺
    /// </summary>
    public void bind2()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "7" }, 7);

        Literal3.Text = obj[4].ToString();
    }
    /// <summary>
    /// 合作伙伴
    /// </summary>
    public void bind3()
    {
        object[] obj = new object[7];
        obj = dp.c_proc_select(new string[] { "2", "8" }, 7);
        string[] img = obj[2].ToString().Split('|');
        string _html = string.Empty;
        for (int i = 0; i < img.Length; i++)
        {
            _html += "<li>";
            _html += "<img src=\"UploadFile/images/" + img[i] + "\" alt=\"\">";
            _html += "</li>";

        }
        Literal4.Text = _html;
    }
}