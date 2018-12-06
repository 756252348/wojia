<%@ Page Language="C#" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="service" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我嘉服务</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/soChange.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/type.js"></script>
    <%--<script src="js/area.js"></script>--%>
    <script type="text/javascript" src="js/jquery.provincesCity1.js"></script>
    <script type="text/javascript" src="js/provincesData1.js"></script>
    <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <![endif]-->
    <link rel="stylesheet" type="text/css" media="screen and (min-width:640px)" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen and (max-width:640px)" href="css/phone_style.css">
    <style>
        #province select {
            margin-right:19px;
        }
       #province #area {
            margin-right:0;
        }
    </style>
    <script>
        $(function () {
            $("#province").ProvinceCity()
        });
        $(function () {
            $("#btnClick").click(function () {
                var kk = [];
                var _name = $("#feedback_name1").val(), _phone = $("#feedback_name2").val(), _prv = $("#province1").val(), _city = $("#city").val(), _area = $("#area").val();

                if (_name == "") {
                    alert("姓名不能为空");
                    return false;
                }
                if (_phone == "") {
                    alert("电话号码不能为空");
                    return false;
                }
                if (_prv == "") {
                    alert("请选择省");
                    return false;
                }
                if (_city == "") {
                    alert("请选择市");
                    return false;
                }
                if (_area == "") {
                    alert("请选择区");
                    return false;
                }
                kk.push(_name);
                kk.push(_phone);
                kk.push(_prv);
                kk.push(_city);
                kk.push(_area);
                $.ajax({
                    url: "AJAX/websystem.ashx",
                    type: "POST",
                    async: true,
                    data: { dataType: "yy", parms: kk },
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
<body class="page_bg" id="01">


    <div class="banner server">
        <h2>我嘉服务</h2>
    </div>
    <div class="append_inc_top" style="height: 280px;"></div>
    <div class="main">
        <div class="block">
            <div class="contain">
                <div class="contain_content">
                    <div class="yuyue" id="01">
                        <div class="customization">
                            <!-- <div class="pic"><img src="images/1.png" alt=""></div> -->

                            <div class="customization_note">
                                <div class="customization_title" >
                                    <div class="topic_title">

                                        <span>预约定制</span>
                                        <p>Reservation customization</p>
                                    </div>
                                </div>
                                <div class="con">
                                    <span style="font-size: 18px; font-weight: 500; color: #333; margin-bottom: 12px; margin-top: 12px; display: block;">个性化预约定制</span>
                                    <div>1、在线预约，你只需要提供一个原型</div>
                                    <div>2、设计师量测，精准量测，量身定制符合户型的家具</div>
                                    <div>3、3D效果图设计，全景呈现未来家居零风险、零担忧</div>
                                    <div>4、生产加工，一体化加工，专业的技术专业的加工模式</div>
                                    <div>5、送货安装，专业安装技术，品牌承诺后顾无忧 </div>
                                    <div>6、售后无忧，客服24小时在线随时随地为您服务</div>
                                </div>
                            </div>
                            <div class="customization_form">
                                <form name="feedbackActionForm">
                                    <div class="full_ipt">
                                        <p class="erro"></p>
                                        <span>姓名：</span>
                                        <input type="text" name="feedback_name1" id="feedback_name1" maxlength="100" value="" />
                                    </div>
                                    <div class="full_ipt">
                                        <p class="erro"></p>
                                        <span>手机：</span>
                                        <input type="text" name="feedback_name2" id="feedback_name2" maxlength="100" value="" />
                                    </div>
                                    <div class="full_ipt" id="show">
                                        <p class="erro"></p>
                                        <div id="province">


                                        </div>
                                         <%--<select id="province" onchange="changeSelect(this);">
                                            <option value="" selected>请选择省</option>
                                        </select>
                                       <select id="city" onchange="changeSelect(this);" class="mlr">
                                            <option value="" selected>请选择市</option>
                                        </select>
                                        <select id="area">
                                            <option value="" selected>请选择区</option>
                                        </select>--%>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="clear"></div>
                                    <div class="full_ipt">
                                        <a class="submit" id="btnClick">提交</a>
                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                           
                            <div class="clear"></div>
                        </div>
                    </div>
                     <div  id="02"></div>
                    <div class="clear"></div>
                    <div class="yuyue" style="padding-top:40px;">
                        <div class="topic_title">

                            <span>客户见证</span>
                            <p>Customer Testimonials</p>
                        </div>
                        <div class="gridalicious">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                           
                        </div>
                         
                    </div>
                     
                    <div  id="03"></div>
                    <div class="yuyue" style="padding-top:40px;">
                        <div class="topic_title">
                            <span>售后服务</span>
                            <p>Contact Us</p>
                        </div>


                        <div class="service_column">
                            <div class="ldiv on" id="0">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkGIG1odLBAAAT5onNV8E262.png" /><img class="bpic" src="images/wKiAiVkkGIGKXpPyAAAQ7E5FAQU116.png" /></div>
                                <div class="desc">免费量尺</div>
                            </div>
                            <div class="rarrow"></div>

                            <div class="ldiv " id="1">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkGJbNtWU7AAAXN26XoAA088.png" /><img class="bpic" src="images/wKiAiVkkGJbz0RygAAAU_-eJya8266.png" /></div>
                                <div class="desc">免费设计<br>
                                </div>
                            </div>
                            <div class="rarrow"></div>
                             <div class="ldiv " id="5">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkGNPeCfXZAAARn7EVc2o217.png" /><img class="bpic" src="images/wKiAiVkkH0mSIE6nAAAOEBRqBus655.png" /></div>
                                <div class="desc">免费安装</div>
                            </div>
                            <div class="rarrow"></div>
                               <div class="ldiv " id="4">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkH52h2ToLAAAQHaJLuHg765.png" /><img class="bpic" src="images/wKiAiVkkH53qkkW_AAAMLro8qto463.png" /></div>
                                <div class="desc">安装后免费清洁</div>
                            </div>
                            <div class="rarrow"></div>

                           
                            <div class="ldiv " id="2">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkGLjV-kdyAAAStitGYEk939.png" /><img class="bpic" src="images/wKiAiVkkGLjkJJoTAAAPHzd0Di4109.png" /></div>
                                <div class="desc">24个月质保</div>
                            </div>
                            <div class="rarrow"></div>

                            <div class="ldiv " id="3">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkH4TfwuE1AAASCovi5_A397.png" /><img class="bpic" src="images/wKiAiVkkH4Surs-UAAAOq_16JIk158.png" /></div>
                                <div class="desc">终身维护</div>
                            </div>
                            <div class="rarrow"></div>
                             <div class="ldiv " id="7">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVk6Tp74j9NXAAARq6g9ILs991.png" /><img class="bpic" src="images/wKiAiVk6Tp3WJdP-AAAQo3WHkJY216.png" /></div>
                                <div class="desc">确保正品<br>
                                </div>
                            </div>
                          <div class="rarrow"></div>

                            <div class="ldiv " id="6">
                                <div class="pic">
                                    <img class="spic" src="images/wKiAiVkkH7auvNtmAAASmuEYt_4755.png" /><img class="bpic" src="images/wKiAiVkkH7b_dcrzAAAPJJ3UVwM027.png" /></div>
                                <div class="desc">VIP客户微信专属服务</div>
                            </div>
                           

                           

                            <div class="clear"></div>
                        </div>
                        <div class="service_note" id="div_1029" runat="server"></div>
                        <div class="service_note" style="display: none" id="div_1030" runat="server">
                        </div>
                        <div class="service_note" style="display: none" id="div_1031" runat="server" >
                          
                        </div>



                        <div class="service_note" style="display: none" id="div_1032" runat="server" >
                         
                        </div>

                        <div class="service_note" style="display: none" id="div_1033" runat="server" >
                           
                        </div>
                        <div class="service_note" style="display: none" id="div_1034" runat="server" >
                         
                        </div>
                        <div class="service_note" style="display: none" id="div_1035" runat="server" >
                          
                        </div>
                        <div class="service_note" style="display: none" id="div_1036" runat="server" >
                           
                        </div>
                        <script>

                            $('.service_column div.ldiv').click(function () {

                                $(this).addClass('on').siblings('.ldiv').removeClass('on');

                                $('.service_note').eq($(this).attr('id')).show().siblings('.service_note').hide();

                            });


                        </script>










                    </div>

                </div>
            </div>
        </div>
    </div>







    <script language="javascript">

        function check() {

            $('.erro').html("");

            $('input').attr("placeholder", "");

            if (document.getElementById("feedback_name1").value == "") {

                $('#feedback_name1').val('').attr("placeholder", "姓名不能为空!");

                document.getElementById("feedback_name1").focus();

                return false;

            }

            if (document.getElementById("feedback_name2").value == "") {

                $('#feedback_name2').val('').attr("placeholder", "请输入手机号码!");

                document.getElementById("feedback_name2").focus();

                return false;

            }

            if (!(/^1[34578]\d{9}$/.test(document.getElementById("feedback_name2").value))) {

                $('#feedback_name2').val('').attr("placeholder", "请输入11位正确手机号码!");

                document.getElementById("feedback_name2").focus();

                return false;

            }

            if (document.getElementById('province1').value == '' || document.getElementById('city').value == '') {

                $('#show').find('.erro').html('请选择您所在省市区');

                return false;

            }

            document.getElementById("feedback_name3").value = $('#province1').children('option:selected').html() + " " + $('#city').children('option:selected').html() + " " + $('#area').children('option:selected').html();

            document.feedbackActionForm.submit();//提交

            return true;

        }

    </script>

</body>
</html>
