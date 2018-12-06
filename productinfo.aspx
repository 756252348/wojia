<%@ Page Language="C#" AutoEventWireup="true" CodeFile="productinfo.aspx.cs" Inherits="productinfo" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>产品中心</title>
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
<div class="banner pro">
  <h2 >产品中心</h2>
</div>
  <div class="append_inc_top"></div>
  <div class="main">
  <div class="block">
    <div class="contain">
  
     <div class="contain_content">
         <div class="dis_pro"> 
   <div class="dis_pro_left"> 
    <div class="bd"> 
     <a class="prev" style="display: none;"></a>
     <a class="next" style="display: none;"></a> 
     <div class="tempWrap ">
      <ul style="">
    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
     
      </ul>
     </div> 
    </div> 
    <div class="hd"> 
        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
   
    </div> 
   </div> 
   <div class="dis_pro_right"> 
    <h1>
     <div class="pro_name" id="divtit" runat="server">
      加载中...
     </div></h1> 
    <div class="pro_desc" id="divdec" runat="server">
     加载中...
    </div> 
    <div class="pro_para"> 
     <p><span style="font-family: 黑体; font-weight: bold;">品牌：</span><span style="font-family: 黑体;" id="divpinpai" runat="server">我嘉</span><br /> <span style="font-family: 黑体; font-weight: bold;">系列：</span><span style="font-family: 黑体;" id="divxl" runat="server"></span><br /> <span style="font-family: 黑体; font-weight: bold;">定位：</span><span style="font-family: 黑体;" id="divdw" runat="server"></span></p> 
     <p><span style="font-family: 黑体; font-weight: bold;">风格：</span><span style="font-family: 黑体;" id="divfg" runat="server"></span></p> 
     <p><span style="orphans: 2; text-align: start; text-indent: 0px; widows: 2; text-decoration-style: initial; text-decoration-color: initial; font-family: 黑体; font-weight: bold;">木种：</span><span id="divmz" runat="server" style="orphans: 2; text-align: start; text-indent: 0px; widows: 2; text-decoration-style: initial; text-decoration-color: initial; font-family: 黑体;"></span><br /> </p> 
     <p><span style="font-family: 黑体; font-weight: bold;">颜色：</span><span style="font-family: 黑体;" id="divys" runat="server"></span></p> 
     <p><span style="font-family: 黑体; orphans: 2; text-align: start; text-indent: 0px; widows: 2; text-decoration-style: initial; text-decoration-color: initial; font-weight: bold;">空间：</span><span style="orphans: 2; text-align: start; text-indent: 0px; widows: 2; text-decoration-style: initial; text-decoration-color: initial;" id="divkj" runat="server"></span><br /> </p> 
    </div> 
   </div> 
   <div class="clear"></div> 
   <div class="dis_pro_bot"> 
    <div class="dis_bot_title">
     <span class="on">详情介绍</span>
    </div> 
    <div class="dis_bot_con"> 
     <p style='font-size: 14px;
    line-height: 30px;'>详情介绍</p>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>

    </div> 
   </div> 
  </div>

     </div>

    </div>
  </div>
</div>






<script type="text/javascript">

jQuery(".dis_pro_left").slide({ mainCell:".bd ul",titCell:".hd ul",effect:"leftLoop",vis:1,mouseOverStop:false,autoPlay:true,autoPage:false});

$('.dis_pro_left .bd').hover(function(){

  $(this).find('a').stop(true,true).fadeIn(300);

},function(){

  $(this).find('a').stop(true,true).fadeOut(300);

});

</script>

</body>
</html>