using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        Banner();
        CompanyBind();
        PrdctBind();
        newsCompany.Text = Newinfo("1");
        newsCompany1.Text = Newinfo("2");
        newsCompany2.Text = Newinfo("3");
    }

    public void Banner()
    {
        string _html = string.Empty;
        string _em = string.Empty;
        DataTable dt = dp.C_CommonList("select id,title,link,img,addtime from article_info where navId=10 and tag=0 order by id desc");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            _html += "<li  onclick=\"javascript:window.location.href='"+dt.Rows[i]["link"]+ "';\" class=\"a_bigImg\" style=\"width: 100%; background:url(UploadFile/images/" + dt.Rows[i]["img"].ToString().Split('|')[0] + ") center top no-repeat; position: absolute; top: 0; left: 0px; display: block; cursor:pointer; background-size: cover; \" title=\"" + dt.Rows[i]["title"] + "\"></li>";
            _em += " <em></em>";
        }
        Text_bannerem.Text = _em;
        Text_banner.Text = _html;
    }
    public void PrdctBind()
    {
        string _html = string.Empty;
        DataTable dt = dp.C_CommonList("select top 4  id,title,Img,addtime from [Prdct_info] where Ishome=1 and tag=0 order by id desc");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            _html += "<li class=\"ipro\"> <img src=\"UploadFile/images/" + dt.Rows[i]["img"].ToString().Split('|')[0] + "\"> <a href=\"productinfo.aspx?id=" + dt.Rows[i]["id"].ToString() + "\">";
            _html += "<div class=\"zz\">";
            _html += "<p></p>";
            _html += "<h5>" + dt.Rows[i]["title"] + "</h5>";
            _html += "</div> </a> </li>";

        }
        txt_prdct.Text = _html;
    }

    public void CompanyBind()
    {
        string _html = string.Empty;
        DataTable dt = dp.C_CommonList("select top 4  id,title,dis,addtime from [article_info] where navId=11 and tag=0 order by id desc");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0)
            {
                _html += "<li class=\"clone\" >";
            } else
            {
                _html += "<li>";
            }          
            _html += "<div class=\"title\">";
            _html += dt.Rows[i]["title"];
            _html += "</div>";
            _html += "<div class=\"content\">";
            _html += dt.Rows[i]["dis"];
            _html += "</div>";
        }
        text_company.Text = _html;
    }

    public string  Newinfo(string type)
    {
        string _html = string.Empty;
        string sql = "select top 4 id,title,img,addtime,decsriptor from [News_info] where type={0} and tag=0 and IsHome=1 order by id desc";
        DataTable dt = dp.C_CommonList(string.Format(sql,type));
        for (int i = 0; i <4; i++)
        {
            _html += "<li class=\"inewslist\"> <a href=\"newinfo.aspx?id=" + dt.Rows[i]["id"] + "\" target=\"_blank\">";
            _html += "<div class=\"pic\"><img src=\"UploadFile/images/" + dt.Rows[i]["img"].ToString().Split('|')[0] + "\">";
            _html += "<p class=\"zz\"></p>";
            _html += "</div>";
            _html += "<div class=\"tit\">"+ dt.Rows[i]["title"] + "</div>";
            _html += "<div class=\"date\">"+ dt.Rows[i]["addtime"] + "</div>";
            _html += "<div class=\"desc\">"+dt.Rows[i]["decsriptor"] +"</div>";
            _html += "</a></li>";
        }
        return _html;
    }
}