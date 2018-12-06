<%@ Page Language="C#" AutoEventWireup="true" CodeFile="caseinfo.aspx.cs" Inherits="caseinfo" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>案例详情</title>
    <meta name="format-detection" content="telephone=no" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
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
    <div class="main" style="margin-top:40px;">
      <div class="block">
    <div class="contain">
      
      <div class="contain_content"> 
        
        
        <div class="dis_case">
          <div class="dc_left">
            <h1>
              <div class="tit" >  <asp:Literal ID="div_tit" runat="server"></asp:Literal></div>
            </h1>
            <div class="date"  ><asp:Literal ID="div_date" runat="server"></asp:Literal></div>
            <div class="desc1"></div>
            <div class="content">
                  <asp:Literal ID="div_content" runat="server"></asp:Literal>
            </div>
            <!--分享开始-->
            
            <div class="clear"></div>
            
            <!-- JiaThis Button BEGIN -->
            
            <div class="clear"></div>
           
            
            
          </div>
          <div class="dc_right">
            <div class="dc_right_title"><a href="cases.aspx">查看更多+</a><span>相关案例</span></div>
            <asp:Literal ID="left" runat="server"></asp:Literal>
             </div>
          <div class="clear"></div>
        </div>
        
        
      </div>
    </div>
  </div>
    </div>


    

    




</body>
    
</html>