<%@ WebHandler Language="C#" Class="store" %>

using System;
using System.Web;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
public class store : IHttpHandler
{
    DataProvider dp = new DataProvider();
    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "application/json";
        string keywords = string.IsNullOrEmpty(context.Request["keywords"]) ? "" : " and title like '%" + context.Request["keywords"] + "%'",
               prv = string.IsNullOrEmpty(context.Request["prv"]) ? "" : " and province = '" + context.Request["prv"] + "'",
               county = string.IsNullOrEmpty(context.Request["county"]) ? "" : " and county = '" + context.Request["county"] + "'";
        DataTable dt = new DataTable();
        string sql = "select id,title,phone,province,county,address from shop_info where id>0{0}";
        dt = dp.C_dataList(string.Format(sql, (keywords + prv + county)));
        string Json = JsonConvert.SerializeObject(dt, new DataTableConverter());
        context.Response.Write(Json);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}