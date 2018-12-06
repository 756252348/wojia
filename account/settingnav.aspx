<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settingnav.aspx.cs" Inherits="account_settingnav" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <!-- basic styles -->

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/font-awesome.min.css" />

    <!--[if IE 7]>
		  <link rel="stylesheet" href="../css/font-awesome-ie7.min.css" />
		<![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />-->

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
        .add-a {
            float: right;
            margin: 10px 10px 0 0;
            text-decoration: none;
        }

            .add-a:hover {
                text-decoration: none !important;
            }

            .add-a i {
                float: left;
                margin-top: 2px;
                margin-right: 5px !important;
            }
        .dd{
            max-width:none;
        }
    </style>
</head>

<body>


    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try { ace.settings.check('main-container', 'fixed') } catch (e) { }
        </script>

        <div class="main-container-inner">
            <div class="main-content">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <h3 class="header smaller lighter blue">导航管理</h3>
										
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="widget-box">
                                        <div class="widget-header header-color-green2">
                                            <h4 class="lighter smaller">导航设置</h4>
                                            <a class="white add-a newitem" href="javascript:;" data-id="0" data-pid="0">
                                                <i class="icon-plus bigger-130"></i>
                                                添加大类
                                            </a>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-8">
                                                <div class="dd" id="nestable">
                                                    <asp:Literal ID="navlist" runat="server">
                                                    <ol class="dd-list">
                                                        <li class="dd-item" data-id="1">
                                                            <div class="dd-handle">
                                                                Item 1
														        <div class="pull-right action-buttons">
                                                                    <a class="green" href="#" data-toggle="tooltip" data-placement="top" title="添加子类">
                                                                        <i class="icon-plus bigger-130"></i>
                                                                    </a>
                                                                    <a class="blue" href="#" data-toggle="tooltip" data-placement="top" title="编辑">
                                                                        <i class="icon-pencil bigger-130"></i>
                                                                    </a>

                                                                    <a class="red" href="#" data-toggle="tooltip" data-placement="top" title="删除">
                                                                        <i class="icon-trash bigger-130"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <ol class="dd-list">
                                                                <li class="dd-item" data-id="10">
                                                                    <div class="dd-handle">
                                                                        Item 10
                                                                        <div class="pull-right action-buttons">
                                                                            <a class="blue" href="#">
                                                                                <i class="icon-pencil bigger-130"></i>
                                                                            </a>

                                                                            <a class="red" href="#">
                                                                                <i class="icon-trash bigger-130"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="dd-item" data-id="10">
                                                                    <div class="dd-handle">
                                                                        Item 10
                                                                        <div class="pull-right action-buttons">
                                                                            <a class="blue" href="#">
                                                                                <i class="icon-pencil bigger-130"></i>
                                                                            </a>

                                                                            <a class="red" href="#">
                                                                                <i class="icon-trash bigger-130"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ol>
                                                        </li>

                                                    </ol>
                                                    </asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-6">
                                    <div class="widget-box">
                                        <div class="widget-header header-color-blue2">
                                            <h4 class="lighter smaller">设置内容</h4>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main padding-8">
                                                <form class="form-horizontal" role="form" runat="server">
                                                    <div class="form-group">
                                                        <label class="col-xs-3 control-label no-padding-right" for="form-field-1">类别 </label>

                                                        <div class="col-xs-9">
                                                            <input type="text" class="col-xs-10 col-sm-5" id="txt_name" runat="server" />
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-xs-3 control-label no-padding-right" for="form-field-1">图标 </label>

                                                        <div class="col-xs-9">
                                                            <input type="text" class="col-xs-10 col-sm-5" id="txt_img" runat="server" />
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-xs-3 control-label no-padding-right" for="form-field-1">链接 </label>

                                                        <div class="col-xs-9">
                                                            <input type="text" class="col-xs-10 col-sm-5" id="txt_url" runat="server" />
                                                        </div>

                                                    </div>
                                                    <input id="txt_id" runat="server" type="hidden" value="0"/>
                                                    <input id="txt_pid" runat="server" type="hidden" value="0" />

                                                    <div class="clearfix">
                                                        <div class="col-md-offset-3 col-xs-9" style="float: right; padding-left: 7px;">

                                                            <asp:Button ID="btn" runat="server" Text="确定" CssClass="btn btn-info btn-sm"  OnClick="btn_Click" OnClientClick="return ks();" />

                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script type="text/javascript">
                                var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
                            </script>

                            <!-- PAGE CONTENT ENDS -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.page-content -->
            </div>
            <!-- /.main-content -->


        </div>
        <!-- /.main-container-inner -->

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="icon-double-angle-up icon-only bigger-110"></i>
        </a>
    </div>
    <!-- /.main-container -->

    <!-- basic scripts -->

    <!--[if !IE]> -->


    <script src="../js/jquery-2.0.3.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>

<script src="../js/jquery-1.10.2.min.js"></script>
<![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='../js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='../js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/typeahead-bs2.min.js"></script>

    <!-- page specific plugin scripts -->

    <script src="../js/jquery.nestable.min.js"></script>

    <!-- ace scripts -->

    <script src="../js/ace-elements.min.js"></script>
    <script src="../js/ace.min.js"></script>

    <!-- inline scripts related to this page -->

    <script type="text/javascript">
        jQuery(function ($) {

            $('.dd').nestable('serialize');
            $('.dd').nestable('collapseAll');
            $('.dd-handle a').on('mousedown', function (e) {
                e.stopPropagation();
            });
            $('[data-toggle="tooltip"]').tooltip()
            //新增添加删除
            $('.newitem').click(function () {
                var _this = $(this);
                var _id = _this.attr('data-id');
                var _pid = _this.attr('data-pid');
                var _img = _this.attr('data-img');
                var _url = _this.attr('data-url');
                $('#txt_id').val(_id);
                $('#txt_pid').val(_pid);
                $('#txt_name').val("");
                $('#txt_img').val("");
                $('#txt_url').val("");
                var _title = _this.parent().parent().children('span').text();
                if (_this.hasClass('blue')) {

                    $('#txt_name').val(_title);
                    $('#txt_img').val(_img);
                    $('#txt_url').val(_url);
                } else {
                    $('#txt_name').attr('placeholder', '请输入' + _title + '子类名称');
                    $('#txt_img').val("icon-double-angle-right");
                }

            });
            //删除
            $('.icon-trash').click(function () {
                var _this = $(this);
                var _id = _this.parent().parent().parent().parent().attr('data-id');
                $.ajax({
                    url: "AJAX/delpage.ashx",
                    type: "POST",
                    async: true,
                    data: { dataType: "navtype", parms: [_id, "", "","",""] },
                    cache: true,
                    dataType: "json",
                    beforeSend: function () { },
                    success: function (data) {
                        if (data.data0 == "1000") {
                            alert(data.data1);
                            setTimeout(function () {
                                location.reload();
                            }, 500)

                        } else {
                            alert(data.data1);
                        }
                    },
                    error: function () { }
                });


            });


        });
        function ks() {
            if ($("#txt_name").val() == "") {
                alert("添加类别不能为空！！");
                return false;
            }
            if ($("#txt_img").val() == "") {
                alert("添加图标不能为空！！");
                return false;
            }
            if ($("#txt_url").val() == "") {
                alert("添加链接不能为空！！");
                return false;
            }

        }
    </script>

</body>
</html>