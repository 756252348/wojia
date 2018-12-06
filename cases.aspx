<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cases.aspx.cs" Inherits="cases" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>实景案例</title>
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
    <div class="banner case">
        <h2>实景案例</h2>
    </div>
    <div class="append_inc_top" style="height: 0px;"></div>
    <div class="main">
        <div class="block">
            <div class="contain">
                <div class="contain_content" style="margin-top: 60px;">
                    <div class="fil_left">
                        <div class="fil_select">
                            <p class="fname default">全部案例</p>
                            <ul class="fselect">
                                <li><a href="cases.aspx">全部案例  </a>
                                </li>
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                    <div class="fil_right">
                         <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        <div class="clear"></div>
                         <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function getQueryStringRegExp(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return decodeURI(r[2]); return null;
        };
        $(function () {
            var _txt = getQueryStringRegExp("txt");
            if (_txt != null) {

                var _typetxt = $(".fselect").find("li");
                $(".fname").html(_txt);
                $.each(_typetxt, function (dt, s) {
                    var a = $(this).find("a").html();
                    if (a == _txt) {
                        $(this).find("a").css({ "color": "#014929", "font-weight": "bold" });
                       
                    }
                })

            }
            else {
                $(".fselect").find("li").eq(0).find("a").css({ "color": "#014929", "font-weight": "bold" });
            }
        })



</script>







</body>
</html>
