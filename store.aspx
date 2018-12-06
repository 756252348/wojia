<%@ Page Language="C#" AutoEventWireup="true" CodeFile="store.aspx.cs" Inherits="store" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>全国线下门店</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <script src="js/jquery.min.js"></script>
    <script src="js/soChange.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/type.js"></script>
    <script src="js/area.js"></script>
    <style>
        .net_con {
            background: #ffffff;
            text-align: left;
            overflow: hidden;
        }

        .net_left {
            width: 320px;
            float: left;
        }

            .net_left .title {
                font-size: 18px;
                letter-spacing: 2px;
                padding: 0 0 10px 20px;
                display: none;
            }

                .net_left .title b {
                    color: #014929;
                }

        .ser_btn2 {
            display: block;
            width: 100px;
            padding-left: 15px;
            height: 38px;
            float: left;
            text-align: center;
            color: #fff;
            font-size: 14px;
            line-height: 38px;
            margin-left: 13px;
            background: #bf9d5a url(images/ser_btn2.png) no-repeat 26px center;
        }

        .search_line {
            height: 40px;
            line-height: 38px;
            position: relative;
            margin-bottom: 20px;
            overflow:hidden;
        }

            .search_line input[type="text"] {
                float: left;
                background: none;
                border: solid 1px #ccc;
                text-indent: 10px;
                width: 310px;
                height: 38px;
                line-height: 38px;
                color: #333;
            }

            .search_line select {
                float: left;
                width: 120px;
                text-align: center;
                text-indent: 10px;
                border: solid 1px #ccc;
                margin-right: 20px;
                padding: 10px;
                appearance: none;
                -moz-appearance: none;
                -webkit-appearance: none;
                background: url(images/select_dot.png) no-repeat scroll right center transparent;
            }

        .net_right {
            border-bottom: solid 1px #ddd;
            overflow: hidden;
            float: right;
            width: 782px;
            height: 635px;
        }

        .net_line {
            border-bottom: solid 1px #ddd;
            color: #111;
            font-size: 14px;
            line-height: 20px;
            padding: 10px 0 10px 20px;
        }

            .net_line .div_line_name {
                line-height: 26px;
                font-size: 16px;
                font-weight: bold;
            }

        a:hover .net_line {
            color: #014929;
            background: #fafafa;
        }

        a.on .net_line {
            color: #014929;
            background: #fafafa;
        }

        .gun_div {
            height: 635px;
            overflow-y: scroll;
        }

        .ser_btn2:hover {
            background-color: #ca9d44;
            color: #fff;
        }
        /*滚动条样式*/
        .net_con ::-webkit-scrollbar {
            width: 5px;
            height: 5px;
        }

        .net_con ::-webkit-scrollbar-track {
            border-radius: 0px;
            background: #ccc;
        }

        .net_con ::-webkit-scrollbar-thumb {
            border-radius: 5px;
            background: #014929;
        }

            .net_con ::-webkit-scrollbar-thumb:hover {
                border-radius: 5px;
                background: #014929;
            }

        #message-center {
            display: none !important;
        }
    </style>
    <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <![endif]-->
    <link rel="stylesheet" type="text/css" media="screen and (min-width:640px)" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen and (max-width:640px)" href="css/phone_style.css">
</head>
<body class="page_bg">

    <!-- header -->
    <div class="banner address">
        <h2>全国线下门店</h2>
    </div>
    <div class="append_inc_top"></div>
    <!-- headerend -->
    <!-- 内容 -->
    <div class="main">
        <div class="block">
            <div class="contain">
                <div class="contain_content">
                    <div class="p_title" style="margin:50px auto">查找全国授权线下体验店！</div>

                    <div class="net_con">
                        <form action="store.html" method="post" name="searchForm1">
                         <%--   <div class="search_line">
                                <select id="province" onchange="changeSelect(this);">
                                            <option value="" selected>请选择省</option>
                                        </select>
                                        <select id="city" onchange="changeSelect(this);" class="mlr">
                                            <option value="" selected>请选择市</option>
                                        </select>
                                <input name="keyword" type="text" id="keyword" placeholder="根据关键字查询">
                                <a class="ser_btn2" id="search">搜索</a>
                                <div class="clear"></div>
                            </div>--%>
                            <div class="net_left">
                                <%-- <div class="title result">搜索到<b> 546 </b>家</div>--%>
                                <div class="gun_div">
                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="net_right">
                                <iframe scrolling="no" frameborder="0" height="100%" width="100%" src="http://api.map.baidu.com/geocoder?output=html" id="frame" name="frame"></iframe>
                            </div>
                            <div class="clear"></div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <!-- 内容end -->




 <script type="text/javascript">
     
     $("#search").click(function () {
         var _province = $("#province").children('option:selected').html();
         var _city = $("#city").children('option:selected').html();
         var _keyword=$("#keyword").val();
         
         if (_province == "请选择省") {
             _province = '';
         }
         if (_city == "请选择市") {
             _city = "";
         }
         var key = { prv: _province};
         $.post("ajax/store.ashx", key, function (dt) {
            
             if (dt == '[]') {
                 alert("暂无您搜索的内容！")
             }
             else {
                 console.log(dt);
                 var _html = "";
                 for (var i = 0; i < dt.length ; i++)
                 {
                     _html += "<a onclick='openWindow('http://map.baidu.com/?l=&s=s%26wd%3D" + dt[i].address + "',this)'>";
                     _html += "<div class='net_line'>";
                     _html += "<div class='div_line_name'>" + dt[i].title + "</div>";
                     _html += "<div class='div_line_address'>" + dt[i].address + "</div>";
                     _html += "<div class='div_line_tel'>" + dt[i].phone + "</div>";
                     _html += "</div>";
                     _html += "</a>";
                     $(".gun_div").empty().append(_html);
                 }
                 
             }
         })
     })
</script>

</body>
</html>
