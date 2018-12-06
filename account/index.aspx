<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="account_index" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>后台管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="../css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="../css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

        <!--<link href="../css/css.css" rel="stylesheet" />-->

		<!-- ace styles -->

		<link rel="stylesheet" href="../css/ace.min.css" />
		<link rel="stylesheet" href="../css/ace-rtl.min.css" />
		<link rel="stylesheet" href="../css/ace-skins.min.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="../js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<script src="../js/respond.min.js"></script>
		<![endif]-->
        <style>
            .nav-list a{
                cursor:pointer;
            }
            .breadcrumbs{
                margin-left:190px;
            }
            .main-container-inner .aabreadcrumbs{
                margin-left:43px;
            }
            .iframe-div{
                margin-left:190px;
                float:none;
            }
            @media only screen and (max-width: 991px){               
                 .breadcrumbs{
                margin-left:0;
            }
            }
        </style>
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="index.aspx" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							后台管理系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
					

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临,</small>
									Jason
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<%--<li>
									<a href="#">
										<i class="icon-cog"></i>
										设置
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										个人资料
									</a>
								</li>--%>

								<%--<li class="divider"></li>--%>

								<li>
									<a href="/logout.aspx">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					

					<ul class="nav nav-list" runat="server" id="nav_list">
					
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
					    try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
					    
					</script>
				</div>

				<div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home home-icon"></i>
                            <a href="index.aspx">首页</a>
                        </li>
                        <li class="active" id="title">控制台</li>
                    </ul><!-- .breadcrumb -->

                
                </div>

                <div class="iframe-div">
                    <iframe src="banner.aspx" name="cont"  width="100%" heigth="100%" frameborder="0" id="iframe">
                        
                    </iframe>
                </div>
                    
                    
                    
				

				
			</div><!-- /.main-container-inner -->

			
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

        <script src="../js/jquery-2.0.3.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="../js/jquery-1.10.2.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='../js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='../js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="../js/excanvas.min.js"></script>
		<![endif]-->

		<script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="../js/jquery.ui.touch-punch.min.js"></script>
		<script src="../js/jquery.slimscroll.min.js"></script>
		<script src="../js/jquery.easy-pie-chart.min.js"></script>
		<script src="../js/jquery.sparkline.min.js"></script>
		<script src="../js/flot/jquery.flot.min.js"></script>
		<script src="../js/flot/jquery.flot.pie.min.js"></script>
		<script src="../js/flot/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->

		<script src="../js/ace-elements.min.js"></script>
		<script src="../js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		    jQuery(function ($) {
		        var _height = $(window).height() - 89;

		        //alert(_height)
		        $('.iframe-div').css('height', _height);
		        $('iframe').css('height', _height);
		        var _width = $(window).width();
		        if ($('.sidebar').hasClass('menu-min')) {
		            $('#breadcrumbs').addClass('aabreadcrumbs');
		            $('.iframe-div').css('width', _width - 43);
		            $('.iframe-div').css('margin-left', '43px');
		        }
		        else {
		            if ($(window).width() < 992) {
		                $('.iframe-div').css('margin-left', '0px');
		                $('.iframe-div').css('width', $(window).width());
		            } else {
		                $('.iframe-div').css('margin-left', '190px');
		                $('.iframe-div').css('width', _width - 190);
		            }
		            $('#breadcrumbs').removeClass('aabreadcrumbs');
		        }
		        window.onresize = function () {
		            var _height = $(window).height() - 89;
		            $('.iframe-div').css('height', _height);
		            $('iframe').css('height', _height);
		                var _width = $(window).width();
		                if ($('.sidebar').hasClass('menu-min')) {
		                    if ($(window).width() < 992) {
		                        $('.iframe-div').css('margin-left', '0px');
		                        $('.iframe-div').css('width', $(window).width());
		                    } else {
		                        $('.iframe-div').css('width', _width - 43);
		                        $('.iframe-div').css('margin-left', '43px');
		                    }
		                    $('#breadcrumbs').addClass('aabreadcrumbs');
		                   
		                }
		                else {
		                    if ($(window).width() < 992) {
		                        $('.iframe-div').css('margin-left', '0px');
		                        $('.iframe-div').css('width', $(window).width());
		                    } else {
		                        $('.iframe-div').css('margin-left', '190px');
		                        $('.iframe-div').css('width', _width - 190);
		                    }
		                    $('#breadcrumbs').removeClass('aabreadcrumbs');
		                }
		                
		            }
		            
		           
		           
		            
		        

		        
                //侧边栏
		        $('.nav-list li a').click(function () {                    
		            var _this = $(this);
		            if (_this.hasClass('dropdown-toggle')) {
		                
		                _this.next('.submenu').children().children('a').click(function () {
		                    $(this).addClass('active');
		                    var _title = $(this).text();
		                    $('#title').text(_title);
		                    //alert(_title);
		                    $(this).parent().addClass('active');
		                   
		                    
		                    _this.parent().siblings().removeClass('active');
		                });
		               
		            } else {
		                _this.parent().addClass('active').siblings().removeClass('active');
		                $('.submenu li').removeClass('active');
		                var _title = _this.children('span').text();
		                //alert(_title);
		                $('#title').text(_title);
		                
		                
		            }


		            
		        });
		        //侧边栏伸缩
		        $('.sidebar-collapse').click(function () {
		            if ($('.sidebar').hasClass('menu-min')) {
		                $('#breadcrumbs').addClass('aabreadcrumbs');
		                $('.iframe-div').css('width', _width - 43);
		                $('.iframe-div').css('margin-left', '43px');
		                
		            } else {
		                $('#breadcrumbs').removeClass('aabreadcrumbs');
		                $('.iframe-div').css('width', _width - 190);
		                $('.iframe-div').css('margin-left', '190px');
		            }
		            
		        });



				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
				});
			
			
			
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
			
			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			
			  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
			 });
			
			
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').slimScroll({
					height: '300px'
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
				
				    
			    

				   
				
			
			})
		</script>
	
</body>
</html>
