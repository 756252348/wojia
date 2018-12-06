<%@ Page Language="C#" AutoEventWireup="true" CodeFile="join.aspx.cs" Inherits="join" %>
<!DOCTYPE html>
<html lang="en">
 <head> 
  <meta charset="UTF-8" /> 
  <title>品牌加盟</title> 
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
        <script>
            $(function () {
                $("#btnClick").click(function () {
                    var kk = [];
                    var _name = $("#feedback_name1").val(), _phone = $("#feedback_name2").val(), _email = $("#feedback_name3").val(), _address = $("#feedback_name4").val(), _qq = $("#feedback_name6").val(),
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
                    if (_qq == "") {
                        alert("QQ不能为空");
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
                    kk.push(_qq);
                    $.ajax({
                        url: "AJAX/websystem.ashx",
                        type: "POST",
                        async: true,
                        data: { dataType: "jm", parms: kk },
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
<div class="banner jiameng">
  <h2>品牌加盟</h2>
</div>
  <div class="main"> 
   <div class="block"> 
    <div class="contain"> 
    
     <div class="contain_content"> 
      
     <div class="join_title"> 
      <font>品牌优势</font> 
      <p>Brand advantage</p> 
     </div> 
     <div class="join01"> 
      <div class="l_a_r_p "> 
       <table style="width:100%;"> 
        <tbody>
         <tr> 
          <!--左文右图--> 
          <td valign="middle" width="100%" height="100%">
           <div class="artic"> 
            <div class="a_content">
             <div>
             为全家、选我嘉！我公司主营衣柜、衣帽间、书柜、电视柜、酒柜、榻榻米等定制家具。我们在上海拥有10多年代工生产经验，合作商户300多家，服务业主超万家。工厂设有直购展厅，已进入几大电商平台，为更多客户提供个性化定制家具！

             </div>  
            </div> 
           </div></td> 
         </tr> 
        </tbody>
       </table> 
      </div> 
      <div class="r_a_l_p bgf8f8f8"> 
       <table> 
        <tbody>
         <tr> 
          <!--右文左图--> 
          <td >
           <div class="artic"> 
            <div class="a_title"> 
             <div class="cn">
              设备先进
             </div> 
             <div class="en">
              Advanced equipment
             </div> 
            </div> 
            <div class="a_content">
             我公司主营衣柜、衣帽间、书柜、电视柜、酒柜、榻榻米等定制家具。我们在上海拥有10多年代工生产经验
            </div> 
           </div></td> 
          <td >
           <div class="artic"> 
            <div class="a_title"> 
             <div class="cn">
              设计团队
             </div> 
             <div class="en">
              Design team
             </div> 
            </div> 
            <div class="a_content">
             我嘉广东大塘生产基地位于广东佛山市三水区中心科技工业区大塘工业园，是国内定制家具水平先进、技术力量雄厚的现.
            </div> 
           </div></td> 
           <td >
           <div class="artic"> 
            <div class="a_title"> 
             <div class="cn">
              安装团队
             </div> 
             <div class="en">
              Installation team
             </div> 
            </div> 
            <div class="a_content">
             自有专业团队与好好装强大团队相结合。化的标准进行硬件、软件建设，打造北方地.
            </div> 
           </div></td> 
           <td >
           <div class="artic"> 
            <div class="a_title"> 
             <div class="cn">
              售后服务
             </div> 
             <div class="en">
              After-sale service
             </div> 
            </div> 
            <div class="a_content">
             我嘉天津生产基地位于天津静海经济开发区，采用智能化、信息化的标准进行硬件、软件建设，打造北方地.
            </div> 
           </div></td> 





         </tr> 
        </tbody>
       </table> 
      </div> 
     </div> 
         <div  id="02"></div>
     <div class="line"></div>
     <div class="join02 "> 
      <div class="join_title"> 
      
       <font>加盟支持</font>
        <p>Franchise support</p> 
      </div> 
      <div class="join03_content">
        <div class="tempWrap">
          <div class="bd_list" >
               <div class="pic"><img class="spic" src="images/d1.png"></div>
              <h2>店面设计</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d2.png"></div>
              <h2>产品设计</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d3.png"></div>
              <h2>专业培训</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d4.png"></div>
              <h2>盛大开业</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d5.png"></div>
              <h2>电商引流</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d6.png"></div>
              <h2>微信广告支持</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
            <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d7.png"></div>
              <h2>店铺小程序开发引流</h2>
              <p>为加盟商度身设计一个外表美观、参观流畅、演示性能出色的展厅、展现”量身定制“理念。</p>
            </div>
             <div class="bd_list" >
              <div class="pic"><img class="spic" src="images/d8.png"></div>
              <h2>上海本地服务</h2>
              <p>上海本地提供测量、设计、安装、售后一条龙服务，让您做个无忧的甩手掌柜！</p>
            </div>
        </div>
      


      </div> 
           <div id="03"></div> 
     </div>
       
      <div class="line"></div>
     <div class="join_title" > 
      
      <font>加盟流程</font>
      <p>Franchise Process</p> 
     </div> 
     <div class="join05"> 
      <div class="artic"> 
        
            <div class="con" style="float:left">
               <span style="font-size: 18px;font-weight: 500;color: #333;margin-bottom:12px;margin-top:12px;display:block;">加盟要求</span>
                <div>1、具有致力于定制家具事业的创业热情，专心专注。</div>
                  <div>2、具备一定的经商经验和商业背景，熟悉当地市场情况。  </div>
                  <div>3、信任、了解我嘉的发展思路与经营理念。</div>  
                  <div>4、有良好的信誉和一定的经济实力，对投资风险和收益的两面性有正确的认知和充分的心理准备。  </div>
                  <div>5、具有法人资格或合法经营资格  </div>
                <div>
                 6、按照所在区域市场的规模建立相应面积的展厅
                 </div>
          </div>
          
       <div class="con" style="float:right"> 
       
          <span style="font-size: 18px;font-weight: 500;color: #333;margin-bottom:12px;margin-top:12px;display:block;" >加盟标准</span>
        
         <div>
          高端市场面积≥200
         </div> 
         <div>
          地级城市：中断市场展厅面积≥100-200
         </div> 
         <div>
          低端城市：展厅面积≥50-100
         </div> 
        </div> 
           </div> 
       </div>
       <div class="clear"></div> 
      </div> 
     </div> 
     <div class="join06_list"> 
      <div class="join06_lister"> 
       <div class="pic">
        <img src="images/wKiAiVkvq7DDxBitAAATadQL9g4156.png" class="spic" />
       </div> 
       <div class="name">1、选定目标市场
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq6eD9Q7SAAAW8wQliIg473.png" class="spic" />
       </div> 
       <div class="name">
        2、意向加盟申请
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq56XRP7xAAAUDhZW2aE561.png" class="spic" />
       </div> 
       <div class="name">
        3、加盟商评审
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq5OSeWosAAAVK-E83SU433.png" class="spic" />
       </div> 
       <div class="name">
        4、市场考察
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq8OlFQSNAAAUaUGuQZ4570.png" class="spic" />
       </div> 
       <div class="name">
        5、签订协议书
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq9SrnvKFAAAV05HDxqQ414.png" class="spic" />
       </div> 
       <div class="name">
        6、专卖店装修
       </div> 
      </div> 
      <div class="join06_lister "> 
       <div class="pic">
        <img src="images/wKiAiVkvq-TdNBhIAAAW25kDMDk514.png" class="spic" />
       </div> 
       <div class="name">
        7、运营管理
       </div> 
      </div> 
      <div class="clear"></div> 
         <div  id="04"></div>
     </div> 

     </div> 
    </div> 
      <div class="clear"></div> 
     <div class="contain wyjm" style="margin-top:40px;">
         <div class="contain_content">
             <div class="join_title"> 
                  <font>我要加盟</font> 
                  <p>Join In</p> 
             </div>
             <p style="line-height: 30px; text-align: center; color: #666;font-size:16px;margin-bottom:30px;">欢迎您我嘉全屋定制加盟事业，衷心感谢您对我嘉的厚爱和支持！我们尽可能在24小时内联系您。</p>
                        <div class="suggestion" style="max-width:1050px;margin:0 auto;">
                            <%--<div class="hr"></div>--%>
                            <div class="suggestion_note" onclick="kefu()">
                                <img src="images/kf3.jpg" border="0">
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
                                        <span>QQ：</span>
                                        <input type="text" id="feedback_name6" name="feedback_name3" maxlength="100" value="">
                                    </div>
                                    <div class="ipt">
                                        <p class="erro"></p>
                                        <span>地址：</span>
                                        <input type="text" id="feedback_name4" name="feedback_name4" maxlength="100" value="">
                                    </div>
                                    <div class="clear"></div>
                                    <div class="iptextarea">
                                        <p class="erro"></p>
                                        <span>加盟留言：</span>
                                        <textarea name="feedback_name19" id="feedback_name5"></textarea>
                                    </div>

                                    <div class="ipt" style="text-align: right;width:580px;">
                                        <input type="reset" class="reset" value="重置">
                                        <a class="submit" id="btnClick">申请加盟</a>
                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                            <div class="clear"></div>

                        </div>
         </div>
     </div>
  
 
 </body>
</html>