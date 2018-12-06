$(function  () {
   
  header ();
	// footer
	footer ();
  urlName ();
  fllow ();
  browserRedirect();
	//banner
	$('#banner .a_bigImg').soChange({
	    botPrev: '#prev',
	    //按钮上一个
	    botNext: '#next',
	    //按钮下一个
	    thumbObj: '.ul_change_a2 em',
	    changeType: 'fade',
	    thumbNowClass: 'on',
	    //导航对象当前的class,默认为now
	    thumbOverEvent: true,
	    //鼠标经过thumbObj时是否切换对象，默认为true，为false时，只有鼠标点击thumbObj才切换对象
	    slideTime: 1000,
	    //平滑过渡时间，默认为1000ms，为0或负值时，忽略changeType方式，切换效果为直接显示隐藏
	    autoChange: true,
	    //是否自动切换，默认为true
	    clickFalse: true,
	    //导航对象如果有链接，点击是否链接无效，即是否返回return false，默认是return false链接无效，当thumbOverEvent为false时，此项必须为true，否则鼠标点击事件冲突
	    overStop: false,
	    //鼠标经过切换对象时，切换对象是否停止切换，并于鼠标离开后重启自动切换，前提是已开启自动切换，默认开启鼠标经过对象停止切换
	    changeTime: 5000,
	    //对象自动切换时间，默认为5000ms，即5秒
	    delayTime: 500 //鼠标经过时对象切换迟滞时间，推荐值为300ms
	});
    $('.m_ind_video').find('video').attr({'poster':'/kps01/M00/34/7E/wKiAiVk44oTy8BCBAAdkHkGE9XA873.jpg','width':'100%','height':'100%'});


	jQuery(".introduction").slide( { mainCell:".bd ul",titCell:".hd ul",effect:"leftLoop",vis:1,autoPlay:false,autoPage:false});
	// jQuery(".plate").slide( { mainCell:".bd ul",titCell:".hd ul",effect:"leftLoop",vis:3,autoPlay:false,autoPage:false});

	$('.ind_news_nav span').hover(function(){

	  $(this).addClass('on').siblings().removeClass('on');

	  $('.plate').eq($(this).index()).fadeIn('fast').siblings('.plate').hide(); 

	});

	$('.plate').eq(0).siblings('.plate').hide();

	
//$('.flow_window').hover(function(){

//  $(this).css({"right":"0px","transition":"all 0.5s"});

//  //$(this).children('.flow_icon').css({"right":"-78px","transition":"all 0.5s"});

//},function(){

//  $(this).css({"right":"-78px","transition":"all 0.5s"});

//  //$(this).children('.flow_icon').css({"right":"0","transition":"all 0.5s"});

//});

$('.flow_window li').hover(function(){

  $(this).children('.par').stop(true,true).fadeIn(300); 

},function(){

  $(this).children('.par').stop(true,true).fadeOut(300);    

});

$(".ficon_top").click(function(){

  $('html,body').animate({scrollTop:0},700); 

}); 

$('.play_btn').click(function(){

  $('.play').fadeOut('fast');
  $('.video').fadeIn('fast'); 
  $('.video').find('video').attr({'autoplay':'true','loop':'','width':'740','height':'420'});

});





$('.recruitment_system ul li').mouseover(function () {
    $(this).toggleClass('openup');
    if($(this).hasClass('openup')){
    	$(this).next('.dis_recruit').stop(true,true).slideDown();
	}else{
        $(this).next('.dis_recruit').stop(true,true).slideUp()
    }
});

$('.fil_select .default').click(function(){
	$(this).next('ul').stop(true,true).slideToggle(333);	
});
$('.fil_select .sname').each(function(index, element) {
	if($(this).siblings('ul').find('li.on').length!=0)
    $(this).html($(this).html()+" ： "+$(this).siblings('ul').find('.on').html());
});





$('.nav-trigger').click(function(){
  if($(this).hasClass("nav-open")){
    $(this).removeClass("nav-open")
    $('.topnav').hide();
    $("body").attr("style","");
    $('.topnav li ').find(".navico").removeClass("active");
    $('.topnav li ').stop(true, true).find('dl').hide();
    $(".zhezhao").remove();
  }
  else{
        $(this).addClass("nav-open");
        $('.topnav').removeClass("ihpopnehide").show();
        $("body").css({ "position": "fixed", "overflow": "hidden", " height": "100%", "width": "100%" });
        $(".nav-trigger").before("<div class='zhezhao'></div>");
        $(".zhezhao").click(function () {
            $('.nav-trigger').removeClass("nav-open")
            $('.topnav').hide();
            $("body").attr("style", "");
            $('.topnav li ').find(".navico").removeClass("active");
            $('.topnav li ').stop(true, true).find('dl').hide();
            $(".zhezhao").remove();
        })
  }
   
});
})



function openWindow(url,obj){
    $(obj).addClass('on').siblings().removeClass('on')
    var myframe = document.getElementById("frame");
    myframe.src=url;
  }



function inc_top_position(){
	var inc_top_initial_height = $('.inc_top').height();
    if($(window).scrollTop()>$('.toper').height()){

    $('.append_inc_top').css("height",inc_top_initial_height);

    $('.head').addClass('inc_top_fixed');

    }else{

    $('.head').removeClass('inc_top_fixed');

    $('.append_inc_top').css({"height":"0px"});

    }

}


function to(id,el){

    var offset=$(id).offset();

    var top=$(document).scrollTop();

    var height=offset.top-150;

    $('html,body').stop(true,true).animate({scrollTop:height},500);

}




function footer () {

	var _footer=$("<div class='footer'> "+
 " <div class='block'> "+
     " <ul> "+
      " <div class='tit'>"+
       " 企业介绍"+
     "  </div> "+
      " <li><a href='introduce.aspx#01'>企业概况</a></li> "+
      " <li><a href='introduce.aspx#02'>品牌荣誉</a></li> " +
      " <li><a href='introduce.aspx#03'>设备工艺</a></li> "+
 " <li><a href='introduce.aspx#04'>合作伙伴</a></li> "+
     "  <li><a href='recruitment.aspx'>人才招聘</a></li> "+
     " </ul> "+
    "  <ul> "+
     "  <div class='tit'>"+
       " 实景案例"+
     "  </div> "+
     "  <li><a href='cases.aspx?type=2&txt=展厅案例'>展厅案例</a></li> " +
      " <li><a href='cases.aspx?type=1009&txt=客户案例'>客户案例</a></li>" +
     " </ul> "+
    
 	" <ul> "+
      " <div class='tit'>"+
       " 我嘉服务"+
      " </div> "+
      " <li><a href='service.aspx#01'>预约定制</a></li> "+
      " <li><a href='service.aspx#02'>客户见证</a></li> "+
      " <li><a href='service.aspx#03'>售后服务</a></li> "+
     " </ul> "+
    "  <ul> "+
      " <div class='tit'>"+
      "  品牌加盟"+
      " </div> "+
      " <li><a href='join.aspx#01'>品牌优势</a></li> "+
      " <li><a href='join.aspx#02'>加盟支持</a></li> "+
     "  <li><a href='join.aspx#03'>加盟流程</a></li> " +
      "  <li><a href='join.aspx#04'>我要加盟</a></li> " +
     " </ul> "+
     " <ul style=' margin-right: 0!important;'> "+
     "<div class='tit'>"+
     " 最新资讯"+
    " </div> "+
    " <li><a href='news.aspx?type=1'>公司新闻</a></li> "+
     "<li><a href='news.aspx?type=2'>产品资讯</a></li> "+
    " <li><a href='news.aspx?type=3'>装修向导</a></li> "+
    "</ul>"+ 
    "<ul class='ul_ct'> "+
     "<div class='hotline'>"+
       "全国免费服务热线："+
      "<br /> "+
      "<b>400-9219-808</b> "+
     "</div> "+
     "<div class='ewm1'> "+
      "<img src='images/code.jpg' /> "+
      "<p>官方微信</p> "+
     "</div> "+
     "<div class='ewm2'> "+
      "<img src='images/tbcode.jpg' /> " +
      "<p>官方淘宝店</p> "+
     "</div> "+
     "<div class='clear'></div> "+
    "</ul> "+
    "<div class='clear'></div> "+
   "</div> "+
  "</div> "+
  "<div class='frlink'> "+
   "<div class='block'> "+
    "<ul> "+
     "<span>友情链接：</span> "+
     "<a href='https://www.taobao.com/' target='_blank'>淘宝</a>"+
     "<font>|</font> "+
     "<a href='https://sale.jd.com/act/XAhdysDo4P.html' target='_blank'>京东</a>"+
     "<font>|</font> "+
     "<a href='http://www.abc188.cn/' target='_blank'>首龙建材家居网</a> " +
     "<div class='clear'></div> "+
    "</ul> "+
   "</div> "+
  "</div> "+
  "<div class='bottom'> "+
   "<div class='block'> "+
    "<div class='copyright'>"+
     "沪ICP备18025397号-1&nbsp;厂址:上海市嘉定区美裕路600号 绿港工业园2栋" +
    "</div> "+
   "</div> "+
  "</div>");
$("body").append(_footer);

}


function header () {
  // body...
  var _header=$("<div class='toper'> "+
  " <div class='top'> "+
    "<div class='block'> "+
     "<div class='float-left m_logo'>"+
      " 欢迎进入我嘉全屋定制官网！"+ 
     "</div> "+
    " <div class='float-right'> "+
      "<a href='store.aspx'> "+
       "<div class='outline_store'>"+
         "全国线下门店 "+
      " </div></a> "+
     " <a href='https://shop136362279.taobao.com/' target='_blank'> "+
      " <div class='online_shop'>"+
         "我嘉淘宝店 "+
      " </div></a> "+
      "<div class='ser'> "+
       "<form action='products.aspx' method='post' name='searchForm'> "+
        "<div class='ser_con'> "+
        " <input type='text' value='请输入产品名称' class='Itext' ' id='searchtxt' /> "+
       
       " </div> "+
        "<input type='submit' name='submit' value='' class='ser_btn' id='search' /> " +
       "</form> "+
     " </div> "+
   "  </div>"+    
    " </div> "+
  " </div> "+
   "<div class='head'> "+
  "<div class='block'> "+
     "<div class='logo'> "+
      "<table height='100%' width='100%'> "+
       "<tbody> "+
        "<tr> "+
         "<td valign='middle'> <h1> <a href='index.aspx'><img src='images/logo.png' /></a> </h1> </td> "+
        "</tr> "+
      " </tbody> "+
     " </table> "+
     "</div> "+
     "<a class='nav-trigger'><span ></span></a>"+
     "<div class='topnav'> "+
     " <ul> "+
      " <li><a href='index.aspx'>网站首页</a></li> "+
      " <li class='slt'><a href='introduce.aspx '>企业介绍</a><i class='navico'></i>" +
        "<dl> "+
         "<dd> "+
         " <a href='introduce.aspx#01' target='_blank'  >企业概况</a> " +
        " </dd> "+
        " <dd> "+
         " <a href='introduce.aspx#02 ' target='_blank' >品牌荣誉</a> " +
         "</dd> "+
        "<dd> "+
          "<a href='introduce.aspx#03' target='_blank'  >设备工艺</a> " +
         "</dd> "+
         "<dd> "+
          "<a href='introduce.aspx#04' target='_blank'  >合作伙伴</a> " +
         "</dd> "+
         "<dd> "+
          "<a href='introduce.aspx#05' target='_blank'  >联系我们</a> " +
         "</dd> "+
         "<dd> "+
          "<a href='recruitment.aspx' target='_blank'>人才招聘</a> " +
         "</dd> "+
        "</dl> </li> "+
       "<li class='slt'><a href='products.aspx' >产品中心</a><i class='navico'></i>" +
       "<dl> "+
         "<dd> "+
          "<a href='products.aspx' target='_blank'>我嘉全屋定制</a> " +
         "</dd> "+
        "</dl> "+
        "</li> "+
       "<li  class='slt'><a href='cases.aspx' >实景案例</a> <i class='navico'></i>" +
        "<dl> "+
         "<dd> "+
          "<a href='cases.aspx?type=2&txt=展厅案例' target='_blank' >展厅案例</a> " +
         "</dd> "+
         "<dd> "+
          "<a href='cases.aspx?type=1009&txt=客户案例' target='_blank'>客户案例</a> " +
        " </dd> "+
      "</dl> </li> "+
      " <li  class='slt'><a href='service.aspx'>我嘉服务</a> <i class='navico'></i>" +
       " <dl>  "+
         "<dd> "+
         " <a href='service.aspx#01 ' target='_blank' >预约定制</a> " +
         "</dd> "+
        " <dd> "+
         " <a href='service.aspx#02' target='_blank' >客户见证</a> " +
        " </dd> "+
        "<dd>"+          
        " <a href='service.aspx#03'target='_blank'  >售后服务</a> " +
        " </dd> "+
       " </dl> </li> "+
      " <li  class='slt'><a href='join.aspx' >品牌加盟</a><i class='navico'></i>" +
      " <dl>  "+
        " <dd> "+
          "<a href='join.aspx#01' target='_blank' >品牌优势</a> " +
         "</dd> "+
         "<dd> "+
         " <a href='join.aspx#02' target='_blank' >加盟支持</a> " +
         "</dd> "+
         "<dd> "+
         " <a href='join.aspx#03' target='_blank' >加盟流程</a> " +
         "</dd> " +
         "<dd> " +
         " <a href='join.aspx#04' target='_blank' >我要加盟</a> " +
         "</dd> " +
       " </dl> </li> "+
      " <li  class='slt'><a href='news.aspx' >最新资讯</a><i class='navico'></i>" +
        "<dl> "+
         "<dd> "+
          "<a href='news.aspx?type=1 ' target='_blank'>公司新闻</a> " +
         "</dd> "+
         "<dd> "+
          "<a href='news.aspx?type=2' target='_blank'>产品资讯</a> " +
         "</dd> "+
         "<dd> "+
         " <a href='news.aspx?type=3' target='_blank'>装修向导</a> " +
         "</dd> "+
        "</dl> </li> "+
      "</ul> "+

     "</div> "+
    "</div> "+
   "</div> "+
  "</div>");
  $("body").prepend(_header);
  //$('.topnav li.slt').bind("mouseover", function () {
  //    if ($(this).hasClass("active")) {
  //        $(this).removeClass("active");
  //        $(this).find("dl").hide();
  //    }
  //    else {
  //        $('.topnav li').removeClass("active");
  //        $('.topnav li').find("dl").hide();
  //        $(this).addClass("active");
  //        $(this).find("dl").show();
  //    }
  //});

  $('.topnav li').find("a").click(function () {
      $(this).parents('dl').hide();
      $(".nav-trigger").removeClass("nav-open")
      $('.topnav').addClass("ihpopnehide");
      $("body").attr("style", '');
      $(".zhezhao").remove();
  })

  $("#search").bind("click", function () {
      var a=$("#searchtxt").val();
      window.open("products.aspx?keywords="+a+"");
  })


}

function browserRedirect() {
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    if (!(bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM)) {
        //$('.topnav li').mouseover(function () {
        //    $(this).stop(true, true).find('dl').slideToggle(300);
        //});
        //$('.topnav li').mouseout(function () {
        //    $(this).stop(true, true).find('dl').slideToggle(300);
        //})

        $('.topnav li').hover(function () { $(this).stop(true, true).find('dl').slideToggle(300) });

        $(function () {
            inc_top_position();

        })
        $(window).scroll(function () {
            inc_top_position();
            var s = $(window).scrollTop();

            if (s > 600) {

                $('.flow_window').css({ "top": "20%", "transition": "all 0.5s" });

                $(".ficon_top").fadeIn(300);

            } else {

                $('.flow_window').css({ "top": "20%", "transition": "all 0.5s" });

                $(".ficon_top").fadeOut(300);

            };

        });
        
       
    }
    else {
        $('.topnav li ').find(".navico").click(function () {
            if ($(this).hasClass("active")) {
                
                $(this).removeClass("active");
                $(this).parent("li").stop(true, true).find('dl').hide();
               
            }
            else {
                $('.topnav li ').find(".navico").removeClass("active");
                $('.topnav li ').stop(true, true).find('dl').hide();
                $(this).addClass("active");
                $(this).parent("li").stop(true, true).find('dl').show();
               
            }
        });
        $("body").append("<div class='bottom_menu'>" +
        "<ul>" +
        "<li><a href='index.aspx'><span><img src='images/bottomico1.png'></span>首页</a></li>" +
        "<li><a href='products.aspx'><span><img src='images/bottomico2.png'></span>产品中心</a></li>" +
        "<li><a href='service.aspx'><span><img src='images/bottomico3.png'></span>预约定制</a></li>" +
        "<li><a href='store.aspx'><span><img src='images/bottomico4.png'></span>线下门店</a></li>" +
        "</ul>" +
        "</div>");
    }
}





function fllow () {
  var fllow_=$("<div class='flow_window'>"+
      //"<div class='flow_icon'></div>"+
      "<ul>"+
        "<li class='ficon1' onclick=''><a style='width:100%;height:100%;display:block' target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=877801888&site=qq&menu=yes'></a></li>" +
        "<li class='ficon2'>"+
          "<div class='par'>"+
            "400-9219-808 </div>"+
        "</li>"+
         "<a href='service.aspx?typeid=2335425'>"+
        "<li class='ficon3'></li>"+
        "</a> "+
        "<li class='ficon4'>"+
          "<div class='par'>"+
            "<img src='images/code.jpg'/></div>"+
        "</li>"+
      "</ul>"+
    "</div>"+
    "<div class='ficon_top'>回到</br>顶部</div>");
  $("body").append(fllow_);
}


function urlName () {
  var strUrl = window.location.href;
    var lastIndex = strUrl.lastIndexOf('/');
    var indexofhtml = strUrl.indexOf('.aspx');
    var docId = strUrl.substring(lastIndex + 1, indexofhtml);
    if (docId== "" || docId == "index" || docId == "store" ) {
      $(".topnav li").eq(0).find("a").addClass("on");
    }
    else if(docId=="introduce"){
      $(".topnav li").eq(1).find("a").addClass("on");
      $(".topnav li").eq(1).addClass("activeslt");
    }
    else if(docId=="products"||docId=="productinfo"){
      $(".topnav li").eq(2).find("a").addClass("on");

    }
    else if(docId=="cases" || docId=="caseinfo"){
      $(".topnav li").eq(3).find("a").addClass("on");
      $(".topnav li").eq(3).addClass("activeslt");
    }
    else if(docId=="service"){
      $(".topnav li").eq(4).find("a").addClass("on");
      $(".topnav li").eq(4).addClass("activeslt");
    }
    else if(docId=="join"){
      $(".topnav li").eq(5).find("a").addClass("on");
      $(".topnav li").eq(5).addClass("activeslt");
    }
    else if(docId=="news" || docId=="newinfo"){
      $(".topnav li").eq(6).find("a").addClass("on");
      $(".topnav li").eq(6).addClass("activeslt");

    }
}





var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?69a84fde1ed6946081995b469f872a41 ";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
})();






