<%@ WebHandler Language="C#" Class="commlist" %>

using System;
using System.Web;

public class commlist : IHttpHandler
{
    DataProvider dp = new DataProvider();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        int dataType = 0; string json = string.Empty, result = "1001";
        string[] parms = context.Request.Params.GetValues("parms[]");
        dataType = Common.C_Int(context.Request["num"], 0);
        json = Common.ToJson(dp.c_proc_select(parms,dataType));
        context.Response.Write(json);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}