<%@ WebHandler Language="C#" Class="websystem" %>

using System;
using System.Web;

public class websystem : IHttpHandler
{
    DataProvider dp = new DataProvider();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string dataType = string.Empty, json = string.Empty, result = "1001";
        ///返回的参数数组,用在分页函数里
        string[] dataList = new string[3];
        ///接受数据是get还是post 
        if (context.Request.HttpMethod == "GET") { dataType = context.Request.QueryString["dataType"]; }//从页面到后端获取数据的方法  get post
        else if (context.Request.HttpMethod == "POST") { dataType = context.Request.Form["dataType"]; }// parms=context.Request.Form.GetValues("parms[]");}
                                                                                                       ///接受过来的参数是以数组的形式
        string[] parms = context.Request.Params.GetValues("parms[]");
        switch (dataType)
        {
            ///登录 parms 0： 账号 1：密码
            case "ly":
                object[] mesage = new object[2];//ID,用户认证后的账号,昵称,登录手机号吗,头像,vip等级,真实姓名,上一次登录时间
                mesage = dp.proc_MessageUser(parms);
                if (Convert.ToInt32(mesage[0]) == 1000)
                {

                    json = "{\"meg\":\"1000\"}";

                }
                else
                {
                    json = "{\"meg\":\"1001\"}";
                }
                //  context.Response.Write(json);
                break;
            case "yy":
                object[] mesages = new object[2];//ID,用户认证后的账号,昵称,登录手机号吗,头像,vip等级,真实姓名,上一次登录时间
                mesages = dp.proc_Reservation(parms);
                if (Convert.ToInt32(mesages[0]) == 1000)
                {

                    json = "{\"meg\":\"1000\"}";

                }
                else
                {
                    json = "{\"meg\":\"1001\"}";
                }
                break;
                case "jm":
                object[] jm = new object[2];//ID,用户认证后的账号,昵称,登录手机号吗,头像,vip等级,真实姓名,上一次登录时间
                jm = dp.proc_addshop(parms);
                if (Convert.ToInt32(jm[0]) == 1000)
                {

                    json = "{\"meg\":\"1000\"}";

                }
                else
                {
                    json = "{\"meg\":\"1001\"}";
                }
                //  context.Response.Write(json);
                break;

        }
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