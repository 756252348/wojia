<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newinfo.aspx.cs" Inherits="newinfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>最新资讯</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <script src="js/jquery.min.js"></script>
    <script src="js/soChange.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/type.js"></script>
    <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <![endif]-->
    <link rel="stylesheet" type="text/css" media="screen and (min-width:640px)" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen and (max-width:640px)" href="css/phone_style.css">
</head>
<body class="page_bg">
    <div class="banner new">
</div>
    <div class="append_inc_top" style="height: 0px;"></div>
    <!-- 内容 -->
    <div class="main">
        <div class="block">
            <div class="contain">

                <div class="contain_content">
                    <div id="dis_news">
                        <h1>
                            <span class="dnews_title" style="padding: 10px 0">
                                <asp:Literal ID="div_tit" runat="server"></asp:Literal>
                            </span>
                        </h1>
                        <div class="dnews_line" style="padding: 0;"><asp:Literal ID="div_date" runat="server"></asp:Literal></div>
                        <div class="dnews_content">
                             <asp:Literal ID="div_content" runat="server"></asp:Literal>

                        </div>
                    </div>



                </div>

            </div>
        </div>
    </div>

    <!-- 内容end -->









</body>
    <script type="text/javascript" >
        $(function () {
            var date = $(".dnews_line").html();
            var conStr = date.replace(/\//g, "-");
            var reg = conStr.split(" ")[0];
            $(".dnews_line").html(reg);
        })

    </script>
</html>
