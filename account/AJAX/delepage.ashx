<%@ WebHandler Language="C#" Class="delepage" %>

using System;
using System.Web;

public class delepage : IHttpHandler {
     DataProvider dp = new DataProvider();
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int dataType = 0; string json = string.Empty, result = "1001";
        string[] parms = context.Request.Params.GetValues("parms[]");    
        json = Common.ToJson(dp.c_proc_delete(parms));
        context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}