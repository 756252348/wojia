<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>我嘉全屋定制官网-首页</title>
    <meta name="keywords" content="定制家具,定制衣柜,全屋定制,我嘉">
    <meta name="description" content="为全家、选我嘉！ 我公司主营衣柜、衣帽间、书柜、电视柜、酒柜、榻榻米等定制家具。我公司主营衣柜、衣帽间、书柜、电视柜、酒柜、榻榻米等定制家具。">
    <meta name="format-detection" content="telephone=no" />
    <meta name="Author" >
    <meta name="MobileOptimized" content="240" />
    <meta name="360-site-verification" content="ba4ea5adddec6863e30d4680448a6f2a" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> 

    <script src="js/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="css/style.css" />  -->
    <script src="js/soChange.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/type.js"></script>
    <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <![endif]-->

    <link rel="stylesheet" type="text/css" media="screen and (min-width:640px)" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen and (max-width:640px)" href="css/phone_style.css?v=01">
</head>
<body>
    <!-- banner -->
    <div id="banner">
        <ul>
            <asp:Literal ID="Text_banner" runat="server"></asp:Literal>
            <%--  <li onclick="javascript:window.location.href='https://shop136362279.taobao.com';" class="a_bigImg" style="width:100%;background:url(UploadFile/images/41100154A1265EABD2EB0305FA963489.png) center  top no-repeat;position:absolute;top:0;left:0px;display:block;cursor:pointer; background-size: cover;"></li> 
    <li onclick="javascript:window.location.href='https://shop136362279.taobao.com';" class="a_bigImg" style="width:100%;background:url(tpl/wKiAiVppRerpim6NAAbvWzqfhP0312.jpg) center  top no-repeat;position:absolute;top:0;left:0px;display:block;cursor:pointer; background-size: cover;"></li> --%>
        </ul>
        <div class="banner_btn">
            <div class="banner_mid_btn ul_change_a2">
                 <asp:Literal ID="Text_bannerem" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
    <!-- bannerend -->
    <!-- about -->
    <div class="ind_intro block">
        <!--视频-->
        <div class="ind_video">
            <div class="content">
                <div class="video">
                    <video controls="controls" loop="loop" src="images/1530582824771723.mp4" poster="images/vediobg.png">
                        <object classid="clsid:6bf52a52-394a-11d3-b153-00c04f79faa6">
                            <param name="url" value="images/1530582824771723.mp4">
                            <param name="autostart" value="">
                            <param name="uimode" value="full">
                            <embed type="application/x-mplayer2" src="images/1530582824771723.mp4" width="740" height="420" autostart="" uimode="full" pluginspage="http://microsoft.com/windows/mediaplayer/en/download/"></object>
                    </video>
                </div>
                <div class="play">
                    <div class="zz">
                        <table height="100%" width="100%">
                            <tbody>
                                <tr>
                                    <td valign="middle">
                                        <img class="play_btn" src="images/play_btn.png"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <img src="images/vediobg.png">
                </div>
            </div>
            <div class="title">
                <span style="font-weight: bold; color: #006036; font-size: 30px;">我嘉全屋定制 &nbsp;</span>
                <span style="font-size: 16px; color: #333">专注全屋定制12年|为全家，选我嘉！</span>
            </div>
        </div>
        <!--视频-->
        <!--简介板块-->
        <div class="introduction">
            <div class="bd">
                <div class="tempWrap">
                    <ul>

                        <asp:Literal ID="text_company" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>
            <a href="introduce.aspx">
                <div class="more">
                    查看更多++
    
                </div>
            </a>
            <div class="clear"></div>
            <div class="arrow">
                <a class="prev"></a>
                <a class="next"></a>
            </div>
        </div>
        <!--简介板块-->
    </div>
    <!-- aboutend -->
    <!-- pro -->
    <div class="ind_pro bg_F5">
        <div class="block">
            <div class="title"></div>
            <ul>
               <asp:Literal ID="txt_prdct" runat="server" Visible="false"></asp:Literal>
                 <li class="ipro"> <img src="http://wj555.cn/UploadFile/images/EEEDAA995AD6882E71614469BA7F38AB.png"> <a href="products.aspx?type=1&txt=进门系列"> 
                   <div class="zz"> 
                    <p>Cupboard</p> 
                    <h5>鞋柜入户柜</h5> 
                   </div> </a> </li> 
                 <li class="ipro"> <img src="http://wj555.cn/UploadFile/images/5A37A0552483104154D12E4D63EDEB0D.png"> <a href="products.aspx?type=1004&txt=卧室系列"> 
                   <div class="zz"> 
                    <p>Closet and cloakroom</p> 
                    <h5>衣柜衣帽间</h5> 
                   </div> </a> </li> 
                 <li class="ipro"> <img src="http://wj555.cn/UploadFile/images/22FBD8B454C91DA75BED7E288BE4520D.png"> <a href="products.aspx?type=1007&txt=儿童房系列"> 
                   <div class="zz"> 
                    <p>High and low bed of tatami</p> 
                    <h5>榻榻米高低床</h5> 
                   </div> </a> </li> 
                 <li class="ipro"> <img src="http://wj555.cn/UploadFile/images/185FB03B1C72C033C4152EB595BCB039.png"> <a href="products.aspx" > 
                   <div class="zz"> 
                    <p>Full house custom furniture</p> 
                    <h5>全屋定制家具</h5> 
                   </div> </a> </li> 
            </ul>
        </div>
    </div>
    <!-- proend -->

    <!-- new -->
    <div class="ind_news">
        <div class="title"></div>
        <div class="ind_news_nav"><span class="on">企业新闻</span>  <span>产品资讯</span>  <span>装修攻略</span>   </div>
        <div class="ind_news_plate">
            <div class="block">
                <div class="plate">
                    <div class="bd">
                        <!-- <a class="prev"></a><a class="next"></a> -->
                        <div class="tempWrap">
                            <ul>
                                <asp:Literal ID="newsCompany" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="plate" style="display: none;">
                    <div class="bd">
                        <!-- <a class="prev"></a><a class="next"></a> -->
                        <div class="tempWrap">
                            <ul>
                                <asp:Literal ID="newsCompany1" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="plate" style="display: none;">
                    <div class="bd">
                        <!-- <a class="prev"></a><a class="next"></a> -->
                        <div class="tempWrap">
                            <ul>

                                <asp:Literal ID="newsCompany2" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                </div>


                <div id="Absolute-Center">
                    <div class="close"></div>
                    <div class="vcon"></div>
                </div>



            </div>
        </div>
    </div>
    <!-- newend -->

    <script type="text/javascript" >
        $(function () {
            var date = $(".inewslist").find(".date");
            date.each(function () {
                var str = $(this).text();
                var conStr = str.replace(/\//g, "-");
                var reg = conStr.split(" ")[0];
                $(this).html(reg);
            })
           
        })

    </script>



</body>
</html>
