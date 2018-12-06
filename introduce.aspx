<%@ Page Language="C#" AutoEventWireup="true" CodeFile="introduce.aspx.cs" Inherits="introduce" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业介绍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />

    <script src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
    <script src="js/soChange.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/type.js"></script>
    <link rel="stylesheet" type="text/css" href="js/fancybox/fancybox.css" media="screen" />
    <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <![endif]-->
    <link rel="stylesheet" type="text/css" media="screen and (min-width:640px)" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen and (max-width:640px)" href="css/phone_style.css">
    <script>
        $(function () {
            $("#btnClick").click(function () {
                var kk = [];
                var _name = $("#feedback_name1").val(), _phone = $("#feedback_name2").val(), _email = $("#feedback_name3").val(), _address = $("#feedback_name4").val(),
                    _cnt = $("#feedback_name5").val();
                if (_name == "") {
                    alert("姓名不能为空");
                    return false;
                }
                if (_phone == "") {
                    alert("电话号码不能为空");
                    return false;
                }
                if (_email == "") {
                    alert("邮箱不能为空");
                    return false;
                }
                if (_address == "") {
                    alert("地址不能为空");
                    return false;
                }
                if (_cnt == "") {
                    alert("留言内容不能为空");
                    return false;
                }
                kk.push(_name);
                kk.push(_phone);
                kk.push(_email);
                kk.push(_address);
                kk.push(_cnt);
                $.ajax({
                    url: "AJAX/websystem.ashx",
                    type: "POST",
                    async: true,
                    data: { dataType: "ly", parms: kk },
                    cache: true,
                    dataType: "json",
                    beforeSend: function () { },
                    success: function (dt) {
                        if (dt.meg == "1000") {
                            alert("提交成功")
                            window.location.href = window.location.href;
                        } else {
                            alert("提交失败")
                            window.location.href = window.location.href;
                        }
                    },
                    error: function () { }
                });

            })
        })
    </script>
</head>
<body class="page_bg"  id="01">


    <!-- header -->
    <div class="banner products">
    </div>
    <div class="append_inc_top" ></div>
    <!-- headerend -->
    <!-- 内容 -->
    <div class="main">
        <div class="block">
            <div class="contain">

                <div class="contain_content">
                    <!-- 企业概括 -->
                    <div class="profile ">
                        <div class="profile_title" name="01">
                            <span>企业概况</span>
                            <p>company profile</p>
                        </div>
                        <div class="profile_con">
                            <div class="profile_con_pic">
                                <table height="100%">
                                    <tbody>
                                        <tr>
                                            <td valign="middle">
                                                <img src="images/about/wKiAiVkyJGihCD23AAGaAobjC0A217.jpg" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                           
                        </div>

                           <div class="clear"></div>
                    </div>
                    <!-- 企业概况end -->
                   
                    <!-- 品牌荣誉 -->
                   <div  id="02" name="02" ></div>
                    <div class="topic_title" >
                        <span>品牌荣誉</span>
                        <p>Brand honor</p>
                    </div>
                    
                       
                    <div class="topic_title_desc" >
                        做一个客户的口碑就是最好的荣誉广告
                    </div>
                    <div class="honor_list  ppry" >
                        <div class="bd">
                            <!--<a class="prev"></a><a class="next"></a>-->
                            <ul>
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                <div class="clear"></div>
                            </ul>
                        </div>
                         <div id="03"></div>
                    </div>
                    <!-- 品牌荣誉end -->
                   
                    <!-- 设备工艺 -->
                    <div class="topic_title margin_ttop" >

                        <span>设备工艺</span>
                        <p>Equipment process</p>
                    </div>
                    <div class="ep_list">
                        <div class="c_a_c_p ">
                            <div class="pic">
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                            </div>
                             <div id="04"></div>
                        </div>
                         
                    </div>
                    <!-- 设备工艺end -->
                    <!-- 合作伙伴 -->
                    <div class="topic_title" style="margin-top:0px;padding-bottom: 20px;">
                        <span>合作伙伴</span>
                        <p>Cooperative partner</p>

                    </div>
                    <div class="honor_list content">
                        <div class="bd">
                            <div>
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                            </div>
                        </div>
                       
                    </div>
                    <!-- 合作伙伴end -->
                    <!-- 联系我们 -->
                      <div id="05"></div>
                    <div  class="topic_title" style="padding-top:60px;padding-bottom: 20px;">
                        <span>联系我们</span>
                        <p>Contact Us</p>
                    </div>
                    <div class="contact_column">
                        <ul class="contact_info_list">
                             
                         <li>
                                <p>
                                    <img src="images/DH.png"  />
                                     <span>
                                        <i>全国咨询热线</i>
                                         <b>400-9219-808</b>
                                    </span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <img src="images/SJ.png"  />
                                    <span>
                                        <i>客户咨询热线</i>
                                         <b>021-69973211</b>
                                    </span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <img src="images/CZ.png"  />
                                     <span>
                                        <i>公司传真</i>
                                         <b>021-69172186</b>
                                    </span>
                                </p>
                            </li>
                           
                            <li>
                                <p>
                                    <img src="images/QQ.png"  />
                                    <b></b>
                                     <span>
                                        <i>QQ/微信联系方式</i>
                                         <b>877801888（同微信）</b>
                                    </span>

                                </p>
                            </li>
                           
                        </ul>
                         <div class="clear"></div>
                        <p style="line-height:30px; text-align: center; color: #000; font-size: 24px;margin-top:20px;padding-bottom:10px;">在线留言</p>
                        <div class="suggestion">
                            <div class="hr"></div>
                            <div class="suggestion_note" onclick="kefu()">
                                <img src="images/zxkf.jpg" border="0">
                            </div>
                            <div class="suggestion_form">
                                <form name="feedbackActionForm" method="post" action="/front/action/feedback/saveFeedbackAction.do" enctype="multipart/form-data">
                                    <div class="ipt">
                                        <p class="erro"></p>
                                        <span>姓名：</span>
                                        <input type="text" id="feedback_name1" name="feedback_name1" maxlength="100" value="">
                                    </div>
                                    <div class="ipt">
                                        <p class="erro"></p>
                                        <span>手机：</span>
                                        <input type="number" id="feedback_name2" name="feedback_name2" maxlength="100" value="">
                                    </div>
                                    <div class="ipt">
                                        <p class="erro"></p>
                                        <span>邮箱：</span>
                                        <input type="text" id="feedback_name3" name="feedback_name3" maxlength="100" value="">
                                    </div>
                                    <div class="ipt">
                                        <p class="erro"></p>
                                        <span>地址：</span>
                                        <input type="text" id="feedback_name4" name="feedback_name4" maxlength="100" value="">
                                    </div>
                                    <div class="clear"></div>
                                    <div class="iptextarea">
                                        <p class="erro"></p>
                                        <span>请输入留言：</span>
                                        <textarea name="feedback_name19" id="feedback_name5"></textarea>
                                    </div>

                                    <div class="ipt" style="text-align: right;width:580px;">
                                        <input type="reset" class="reset" value="重置">
                                        <a class="submit" id="btnClick">提交</a>
                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                            <div class="clear"></div>

                        </div>





                        <div class="clear"></div>
                    </div>

                    <!-- 联系我们end -->
                </div>

            </div>
        </div>
    </div>
    <!-- 内容end -->





    <script type="text/javascript">

        $("a[rel=group]").fancybox({

            'padding': 5,           //浏览框内边距，和css中的padding一个意思,默认10 

            'margin': 0,           //浏览框外边距，和css中的margin一个意思，默认20

            'overlayShow': true,         //如果为true，则显示遮罩层

            'overlayColor': '#000',       //遮罩层的背景颜色

            'overlayOpacity': 0.3,          //遮罩层的透明度（范围0-1）,默认为0.3

            'transitionIn': 'elastic',    //设置打开弹出来效果. 可以设置为 'elastic', 'fade' 或 'none'

            'transitionOut': 'elastic',    //设置关闭收回去效果. 可以设置为 'elastic', 'fade' 或 'none'

            'speedIn': 300,      //fade 和 elastic 动画切换的时间间隔, 以毫秒为单位

            'speedOut': 300,      //fade 和 elastic 动画切换的时间间隔, 以毫秒为单位

            'changeSpeed': 300,          //切换时fancybox尺寸的变化时间间隔（即变化的速度），以毫秒为单位 

            'changeFade': 'fast',       //切换时内容淡入淡出的时间间隔（即变化的速度）

            'showCloseButton': true,         //如果为true，则显示关闭按钮

            'hideOnOverlayClick': true,         //如果为true则点击遮罩层关闭fancybox,默认为true 

            'hideOnContentClick': false,        //如果为true则点击播放内容关闭fancybox,默认为false

            'cyclic': true,

            'titleShow': true,        //如果为true，则显示标题,默认为true 

            'titlePosition': 'over',     //设置标题显示的位置.可以设置成 'outside', 'inside' 或 'over',默认为outside  

            'titleFormat': function (title, currentArray, currentIndex, currentOpts) {

                return '<span id="fancybox-title-over" style="color:#fff;">' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';

            }

        });

        $(function () {
            var _length = $(" .ppry ul li").length;
            if (_length == 0) {
               $(".ppry ul").after("<img src='images/22.jpg' class='load' />");
            }
        })
</script>

</body>
</html>
