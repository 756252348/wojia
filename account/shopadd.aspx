<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopadd.aspx.cs" Inherits="account_shopadd" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/font-awesome.min.css" />
    <link href="../css/fileinput.css" rel="stylesheet" />
    <!--[if IE 7]>
		  <link rel="stylesheet" href="../css/font-awesome-ie7.min.css" />
		<![endif]-->

    <!-- page specific plugin styles -->

    <link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css" />

    <!-- fonts -->
    <script src="../js/jquery-1.10.2.min.js"></script>


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
        .form-group input {
            width: 100%;
        }

        .editorbox {
            width: 74%;
            margin-bottom: 15px;
        }

        .btn-block {
            width: 74% !important;
        }

        .news-category select {
            margin-bottom: 15px;
            margin-right:2.3334%;
        }
    </style>
</head>

<body>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try { ace.settings.check('main-container', 'fixed') } catch (e) { }
        </script>

        <div class="main-container-inner">
            <a class="menu-toggler" id="menu-toggler" href="#">
                <span class="menu-text"></span>
            </a>



            <div class="main-content">


                <div class="page-content">
                    <h3 class="header smaller lighter blue">店铺管理</h3>
                    <!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <form>

                                <hr />
                            </form>
                            <form class="form-horizontal" role="form" runat="server">

                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">店铺名称</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_name" runat="server" />
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">店铺简介</label>
                                    <div class="col-md-6">
                                        <input type="text" id="txt_intro" runat="server" />
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">店铺地址</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_addr" runat="server" />
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">经度</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_lng" runat="server" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" />
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">纬度</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_lat" runat="server" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1">店铺图片</label>

                                    <div class="col-md-6">
                                        <input name="uploadFile" type="hidden" id="pro_img" value="" runat="server">
                                        <input id="txt_file" name="txt_file" type="file" multiple class="file-loading">
                                        <div id="errorBlock" class="help-block"></div>
                                        <script>
                                            $(document).on('ready', function () {
                                                $("#txt_file").fileinput({
                                                    language: 'zh', //设置语言
                                                    showCaption: false,//是否显示标题
                                                    uploadUrl: 'AJAX/recImgFile.ashx',
                                                    allowedFileExtensions: ['jpg', 'png', 'gif'],
                                                    maxFilePreviewSize: 10240
                                                });
                                                //导入文件上传完成之后的事件
                                                $("#txt_file").on("fileuploaded", function (event, data, previewId, index) {
                                                    var dt = data.response.data1;
                                                    if (dt == undefined) {
                                                        toastr.error('文件上传错误');
                                                        return;
                                                    } else {
                                                        var aa = []
                                                        if ($('#pro_img').val().length == 0) {
                                                            aa.push(dt)
                                                        } else {
                                                            aa = $('#pro_img').val().split('|');
                                                            aa.push(dt)
                                                        }
                                                        $('#pro_img').val(aa.join('|'));
                                                    }

                                                });
                                                $("#txt_file").on("filesuccessremove", function (event, data, previewId, index) {
                                                    $('#pro_img').val("");
                                                });
                                                $("#txt_file").on("fileclear", function (event, data, previewId, index) {
                                                    $('#pro_img').val("");
                                                });
                                            });

                                        </script>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-md-1">移动图片</label>

                                    <div class="col-md-6">
                                        <input name="uploadFile" type="hidden" id="pro_img2" value="" runat="server">
                                        <input id="txt_file2" name="txt_file" type="file" multiple class="file-loading">
                                        <div id="errorBlock2" class="help-block"></div>
                                        <script>
                                            $(document).on('ready', function () {
                                                $("#txt_file2").fileinput({
                                                    language: 'zh', //设置语言
                                                    showCaption: false,//是否显示标题
                                                    uploadUrl: 'AJAX/recImgFile.ashx',
                                                    allowedFileExtensions: ['jpg', 'png', 'gif'],
                                                    maxFilePreviewSize: 10240
                                                });
                                                //导入文件上传完成之后的事件
                                                $("#txt_file2").on("fileuploaded", function (event, data, previewId, index) {
                                                    var dt = data.response.data1;
                                                    if (dt == undefined) {
                                                        toastr.error('文件上传错误');
                                                        return;
                                                    } else {
                                                        var aa = []
                                                        if ($('#pro_img2').val().length == 0) {
                                                            aa.push(dt)
                                                        } else {
                                                            aa = $('#pro_img2').val().split('|');
                                                            aa.push(dt)
                                                        }
                                                        $('#pro_img2').val(aa.join('|'));
                                                    }

                                                });
                                                $("#txt_file2").on("filesuccessremove", function (event, data, previewId, index) {
                                                    $('#pro_img').val("");
                                                });
                                                $("#txt_file2").on("fileclear", function (event, data, previewId, index) {
                                                    $('#pro_img').val("");
                                                });
                                            });

                                        </script>
                                    </div>

                                </div>
                                
                                

                                <div class="clearfix">
                                    <div class="col-md3">
                                        <asp:Button ID="btn" runat="server" Text="发布" CssClass="btn btn-info btn-block no-border" OnClick="btn_Click" OnClientClick="return ks();"  />
                                    </div>
                                </div>

                            </form>




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
    <script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="../js/jquery.ui.touch-punch.min.js"></script>
    <script src="../js/markdown/markdown.min.js"></script>
    <script src="../js/markdown/bootstrap-markdown.min.js"></script>
    <script src="../js/jquery.hotkeys.min.js"></script>
    <script src="../js/bootstrap-wysiwyg.min.js"></script>
    <script src="../js/bootbox.min.js"></script>
    <script src="../js/jquery.cxselect.js"></script>
    <script src="../js/fileinput.js"></script>
    <script src="../js/fileinput_locale_zh.js"></script>
    <!-- ace scripts -->

    <script src="../js/ace-elements.min.js"></script>
    <script src="../js/ace.min.js"></script>

    <!-- inline scripts related to this page -->

    <script type="text/javascript">
        jQuery(function ($) {

            

        });
        function ks() {
            if ($("#txt_name").val() == "") {
                alert("店铺名称不能为空！！");
                return false;
            }
            if ($("#txt_intro").val() == "") {
                alert("店铺简介不能为空！！");
                return false;
            }
            if ($("#pro_img").val() == "") {
                alert("店铺图片不能为空！！");
                return false;
            }
            if ($("#txt_addr").val() == "") {
                alert("店铺地址不能为空！！");
                return false;
            }

        }
    </script>

</body>
</html>
