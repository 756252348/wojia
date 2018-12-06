<%@ WebHandler Language="C#" Class="recImgFile" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Drawing.Imaging;

public class recImgFile : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        var oFile = context.Request.Files["txt_file"];
        //var lstOrderImport = new List<DTO_TO_ORDER_IMPORT>();
        #region 0.数据准备
        //图片保存路径[主目录形式]
        string savePath = context.Server.MapPath(ConfigurationManager.AppSettings["imgUpload"]);
        //路径判断 不存在则创建
        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        string saveName = md5(DateTime.Now.ToString("yyMMddhhmmssffff")) + ".png";

        if (File.Exists(savePath + saveName))
        {
            saveName = md5(saveName + DateTime.Now.Ticks) + ".png";
        }

        //resultName = saveName;
        #endregion
        Bitmap bmp = new Bitmap(oFile.InputStream);
        bmp.Save(savePath + saveName, ImageFormat.Jpeg);
        bmp.Dispose();
        string[] arr = new string[] {"1000",saveName };
        context.Response.Write(Common.ToJson(arr));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    #region 不可逆MD5加密
    /// <summary>
    /// MD5加密
    /// </summary>
    /// <param name="str">加密字符</param>
    /// <param name="code">加密位数16/32</param>
    /// <returns></returns>
    public static string md5(string str)
    {
        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToUpper();
    }
    #endregion
}