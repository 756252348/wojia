using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// WebControl 的摘要说明
/// </summary>
public class WebControl
{
    public WebControl()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    #region 列表分页
    /// <summary>
    /// 生成table并返回string字符串,第一列没有隐藏
    /// </summary>
    /// <param name="sFld">内存表中要查询的字段</param>
    /// <param name="sName">Table中标题行</param>
    /// <param name="dt">内存表</param>
    /// <param name="isCheckBox">是否带复选框</param>
    /// <param name="isLinkButton">是否带操作按钮</param>
    /// <param name="linkButton">代码：modify_修改_模板|delete_删除_模板</param>
    /// <returns></returns>
    private static string CreatTable(string sFld, string sName, DataTable dt, bool isCheckBox, bool isLinkButton, string linkButton, string type)
    {
        string[] sFArray = sFld.Split(','), sNArray = sName.Split(',');
        int sFLen = sFArray.Length, sNLen = sNArray.Length, dtCount = dt.Rows.Count, i, j;

        StringBuilder sbHtml = new StringBuilder();
        sbHtml.Append("<table id=\"sampletable2\" class=\"table table-striped table-bordered table-hover\"><thead><tr>");

        for (i = 0; i < sNLen; i++)
        {
            if (i == 0)
            {
                if (isCheckBox)
                    sbHtml.Append("<th class=\"center\" scope=\"col\" onclick=\"checkAllLine();\"></th>");
                else
                    sbHtml.AppendFormat("<th class=\"center\" >{0}</th>", sNArray[i]);
            }
            else
                sbHtml.AppendFormat("<th >{0}</th>", sNArray[i]);
        }

        string _linkButton = "";
        if (isLinkButton)
        {
            sbHtml.Append("<th>操作</th>");
            //_linkButton = MakeLinkButton(linkButton);
        }
        sbHtml.Append("</tr></thead><tbody>");

        if (Common.DataTableIsNull(dt))
        {
            for (i = 0; i < dtCount; i++)
            {
                sbHtml.Append("<tr " + (i % 2 == 1 ? "class='Linetwo'" : "") + ">");
                for (j = 0; j < sNLen; j++)
                {
                    if (j == 0)
                    {
                        sbHtml.Append("<td class=\"center\">");
                        if (isCheckBox)
                            sbHtml.AppendFormat("<input type=\"checkbox\" name=\"ListTable\" class=\"ace\"  value=\"{0}\" /> <span class=\"lbl\"></span>", dt.Rows[i][sFArray[j].ToString()]);
                        else
                            sbHtml.Append(dt.Rows[i][sFArray[j].ToString()].ToString());

                        sbHtml.Append("</td>");
                    }
                    else
                        sbHtml.AppendFormat("<td>{0}</td>", dt.Rows[i][sFArray[j].ToString()]);

                }
                if (isLinkButton)
                    {
                        sbHtml.Append("<td><div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">");
                        sbHtml.AppendFormat("<a class=\"green\" title=\"修改\" href=\"" + linkButton + "{0}\">", dt.Rows[i][sFArray[0].ToString()]);
                        sbHtml.Append("<i class=\"icon-pencil bigger-130\"></i></a>");
                        sbHtml.AppendFormat("<a class=\"green\" title=\"删除\" data-id=\"{0}\" data-type=\"{1}\">", dt.Rows[i][sFArray[0].ToString()], type);
                        sbHtml.Append("<i class=\"icon-trash bigger-130\"></i></a></div></td");

                    }
                
                sbHtml.Append("</tr>");
            }
        }
        else
        {
            if (isCheckBox) sNLen = sNLen + 1;
            if (isLinkButton) sNLen = sNLen + 1;
            sbHtml.AppendFormat("<tr><td colspan=\"{0}\"><h3>暂无数据</h3></td></tr>", sNLen);
        }
        sbHtml.Append("</tbody></table>");
        dt.Dispose();
        return sbHtml.ToString();
    }
    /// <summary>
    /// 生成不带checkbox的Table
    /// </summary>
    /// <param name="Lta">Literal控件ID</param>
    /// <param name="sFld">分页内存表中要查询的字段</param>
    /// <param name="sName">Table中标题行</param>
    /// <param name="dt">分页存储过程返回的内存表</param>
    public static void CreatTable(Literal Lta, string sFld, string sName, DataTable dt, string url, string type,bool check)
    {
        Lta.Text = CreatTable(sFld, sName, dt, false, check, url, type);
    }


    /// <summary>
    /// 生成带checkbox\link的Table
    /// </summary>
    /// <param name="Lta">Literal控件ID</param>
    /// <param name="sFld">分页内存表中要查询的字段</param>
    /// <param name="sName">Table中标题行</param>
    /// <param name="dt">分页存储过程返回的内存表</param>
    /// <param name="linkButton"></param>
    public static void CreatCheckTable(Literal Lta, string sFld, string sName, DataTable dt, string url, string type, bool check)
    {
        Lta.Text = CreatTable(sFld, sName, dt, true, check, url,type);
    }

    #endregion
    #region 通用分页
    /// <summary>
    /// 分页超链接字段导航
    /// </summary>
    /// <param name="_PageIndex">当前页</param>
    /// <param name="_PageCount">总页数</param>
    /// <returns>返回一个带超链接翻页地址的html</returns>
    public static string Pagination(int _PageIndex, int _RecordCount, int _PageCount)
    {
        //_url = Regex.Replace(_url, @"([&|?]Page=)([^&]*)", String.Empty, RegexOptions.IgnoreCase);
        string _url = HttpContext.Current.Request.Url.PathAndQuery;

        _url = Regex.Replace(_url, @"(Page=)([^&]*)", String.Empty, RegexOptions.IgnoreCase);

        _url = _url.Replace("?&", "?").TrimEnd("&?".ToCharArray());

        if (Regex.IsMatch(_url, @"\?"))
        {
            _url += @"&";
        }
        else
        {
            _url += @"?";
        }
        int next = 0, pre = 0, startpage = 0, endpage = 0;
        StringBuilder sbHtml = new StringBuilder();
        if (_PageIndex < 1) { _PageIndex = 1; }
        if (_PageIndex > _PageCount) { _PageIndex = _PageCount; }
        next = _PageIndex + 1;
        pre = _PageIndex - 1;
        // 中间页起始序号
        startpage = _PageIndex - 3;
        if (startpage < 1) { startpage = 1; }
        // 中间页终止序号
        endpage = _PageIndex + 3;
        if (endpage > _PageCount) { endpage = _PageCount; }
        sbHtml.Append("<div class=\"col-sm-6 dataTables_info\" id=\"sample-table-2_length\" style=\"text-align:left;line-height: 32px;\">共<span>" + _RecordCount + "</span>条记录 页数：<span>" + _PageIndex + "</span>/<span>" + _PageCount + "</span>页</div> ");
        sbHtml.Append("<div class=\"col-sm-6\"><ul class=\"pagination\" >");
        sbHtml.Append(_PageIndex > 1 ? "<li><a href=\"" + _url + "Page=1\">首页</a></li> <li><a href=\"" + _url + "Page=" + pre + "\">上一页</a></li>" : "<li class=\"disabled\"><a href=\"#\">首页</a></li><li class=\"disabled\"><a href=\"#\">上一页</a></li>");
        // 中间页循环显示页码
        for (int i = startpage; i <= endpage; i++)
        {
            sbHtml.Append(_PageIndex == i ? "<li class=\"active\"><a href=\"#\">" + i + "</a></li>" : "<li ><a class=\"paging_num\" href=\"" + _url + "Page=" + i + "\">" + i + "</a><li>");
        }
        sbHtml.Append(_PageIndex != _PageCount ? "<li><a href=\"" + _url + "Page=" + next + "\">下一页</a></li> <li><a href=\"" + _url + "Page=" + _PageCount + "\">末页</a></li>" : "<li class=\"disabled\"><a href=\"#\">下一页</a></li><li class=\"disabled\"><a href=\"#\">末页</a></li>");
        sbHtml.Append("</ul>");
        //sbHtml.Append("<input type='text' id='goPage' value=''/><a id='goIndex' href='javascript:;' >跳转</a>");
        //sbHtml.Append("<select id='pageSize' name='pageSize' class='pageSize'><option value='5'>5</option><option value='7'>7</option><option value='10'>10</option><option value='15'>15</option><option value='20'>20</option><option value='25'>25</option><option value='30'>30</option></select>条/页");
        sbHtml.Append("</div>");
        return sbHtml.ToString();
    }
    /// <summary>
    /// 分页超链接字段导航
    /// </summary>
    /// <param name="_PageIndex">当前页</param>
    /// <param name="_PageCount">总页数</param>
    /// <returns>返回一个带超链接翻页地址的html</returns>
    public static string WebPagination(int _PageIndex, int _RecordCount, int _PageCount)
    {
        //_url = Regex.Replace(_url, @"([&|?]Page=)([^&]*)", String.Empty, RegexOptions.IgnoreCase);
        string _url = HttpContext.Current.Request.Url.PathAndQuery;

        _url = Regex.Replace(_url, @"(Page=)([^&]*)", String.Empty, RegexOptions.IgnoreCase);

        _url = _url.Replace("?&", "?").TrimEnd("&?".ToCharArray());

        if (Regex.IsMatch(_url, @"\?"))
        {
            _url += @"&";
        }
        else
        {
            _url += @"?";
        }
        int next = 0, pre = 0, startpage = 0, endpage = 0;
        StringBuilder sbHtml = new StringBuilder();
        if (_PageIndex < 1) { _PageIndex = 1; }
        if (_PageIndex > _PageCount) { _PageIndex = _PageCount; }
        next = _PageIndex + 1;
        pre = _PageIndex - 1;
        // 中间页起始序号
        startpage = _PageIndex - 3;
        if (startpage < 1) { startpage = 1; }
        // 中间页终止序号
        endpage = _PageIndex + 3;
        if (endpage > _PageCount) { endpage = _PageCount; }
        sbHtml.Append("<div class=\"fpage\" id=\"sample-table-2_length\" >");
      
        sbHtml.Append(_PageIndex > 1 ? "<a href=\"" + _url + "Page=1\" style=\"width:53px; \">首页</a>&nbsp;<a href=\"" + _url + "Page=" + pre + "\" style=\"width:63px; \">上一页</a>&nbsp;" : "<a href=\"javascript:;\" style=\"width:53px; \">首页</a>&nbsp;<a href=\"javascript:;\"  style=\"width:63px; \">上一页</a>&nbsp;");
        // 中间页循环显示页码
        for (int i = startpage; i <= endpage; i++)
        {
            sbHtml.Append(_PageIndex == i ? "<a href=\"javascript:;\"><font color=\"#FF0000\">" + i + "</font></a>&nbsp;" : "<a href=\"" + _url + "Page=" + i + "\">" + i + "</a>&nbsp;");
        }
        sbHtml.Append(_PageIndex != _PageCount ? "<a href=\"" + _url + "Page=" + next + "\"  style=\"width:63px; \">下一页</a>&nbsp;<a style=\"width:53px; \" href=\"" + _url + "Page=" + _PageCount + "\">末页</a>&nbsp;" : "<a href=\"javascript:;\"  style=\"width:63px; \">下一页</a><a href=\"javascript:;\" style=\"width:53px; \">末页</a>");
        
        //sbHtml.Append("<input type='text' id='goPage' value=''/><a id='goIndex' href='javascript:;' >跳转</a>");
        //sbHtml.Append("<select id='pageSize' name='pageSize' class='pageSize'><option value='5'>5</option><option value='7'>7</option><option value='10'>10</option><option value='15'>15</option><option value='20'>20</option><option value='25'>25</option><option value='30'>30</option></select>条/页");
        sbHtml.Append("</div>");
        return sbHtml.ToString();
    }
    #endregion
}