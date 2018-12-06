<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recruitment.aspx.cs" Inherits="recruitment" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>人才招聘</title>
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
<!-- header -->
 <div class="banner peo">
  <h2>人才招聘</h2>
</div>
  <div class="append_inc_top"></div>
<!-- headerend -->
<!-- 内容 -->
<div class="main">
  <div class="block">
    <div class="contain">
     <div class="contain_content">
      <div class="topic_title">
         
      </div>

      <div class="rec-l">
          <div class="biaoti2">招聘岗位</div>
          <div class="rec-con"><p>&nbsp; &nbsp; &nbsp; 如果您正在寻找一个施展才华的机会，我嘉诚邀您的加入，让我们一起创造美好的未来！</p>
          <p><br>
          </p>
          </div>
        </div>
        <!-- 招聘列表 -->
        <div class="recruitment_system"> 
   <div class="recruitment_title">
    <span>招聘职位</span>
    <span class="phonehide">招聘人数</span>
    <span>工作地点</span>
    <span class="phonehide">发布时间</span>
    <span class="end_time">截止时间</span>
   </div> 
   <ul> <asp:Literal ID="Literal1" runat="server"></asp:Literal>
 
   </ul> 
  </div>

        <!-- 招聘列表end -->


     </div>

    </div>
  </div>
</div>

<!-- 内容end -->












</body>
</html>