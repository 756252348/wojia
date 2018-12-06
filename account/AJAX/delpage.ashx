<%@ WebHandler Language="C#" Class="delpage" %>

using System;
using System.Web;

public class delpage : IHttpHandler
{
    DataProvider dp = new DataProvider();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string dataType = string.Empty, json = string.Empty, result = "1001";
        dataType = context.Request["dataType"];
        string[] parms = context.Request.Params.GetValues("parms[]");
        switch (dataType)
        {
            ///新闻类别
            case "navnewstype":
                json = Common.ToJson(dp.proc_news_type_info(ArrayParms(parms)));
                break;
            ///商品类别
            case "navgoodstype":
                json = Common.ToJson(dp.proc_type_info(ArrayParms(parms)));
                break;
            ///导航
            case "navtype":
                json = Common.ToJson(dp.proc_nav_info(ArrayParms(parms)));
                break;
            ///商品标签
            case "lableinfo":
                json = Common.ToJson(dp.proc_lable_info(ArrayParms(parms)));
                break;




        }
        context.Response.Write(json);
    }
    private string[] ArrayParms(string[] parms)
    {
        string[] _parms = new string[parms.Length + 1];
        for (int i = 0, len = _parms.Length; i < len; i++)
        {
            if (i == parms.Length)
            {
                _parms[i] = "1";
            }
            else
            {
                _parms[i] = parms[i].ToString();
            }
        }
        return _parms;
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}