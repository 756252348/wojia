<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModRenCai.aspx.cs" Inherits="account_ModRenCai" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/font-awesome.min.css" />
    <%--<link href="../css/fileinput.css" rel="stylesheet" />--%>
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
    <script src="../js/base.js"></script>
    <!--[if lte IE 8]>
		  <link rel="stylesheet" href="../css/ace-ie.min.css" />
		<![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="../js/ace-extra.min.js"></script>
        <script type="text/javascript" src="../js/laydate/laydate.js"></script>
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
            margin-right: 2.3334%;
        }

        .news-img {
            width: 120px;
            height: 120px;
            margin: 0 10px 10px 0;
            float: left;
        }

        .set-up-img {
            width: 120px;
            height: 120px;
        }

        .news-default {
            background-image: url(/images/kzj_apply.png);
            background-size: 120px 120px;
            background-repeat: no-repeat;
            position: relative;
        }

        .file-loading {
            width: 120px;
            height: 120px;
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
            opacity: 0;
        }

        .img-del {
            position: absolute;
            width: 120px;
            display: none;
        }

        .set-del-img {
            position: absolute;
            top: 0px;
            right: 0px;
            width: 20px;
            height: 20px;
            float: right;
            cursor: pointer;
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
                    <h3 class="header smaller lighter blue">人才招聘</h3>
                    <!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <form>

                                <hr />
                            </form>
                            <form class="form-horizontal" role="form" runat="server">

                           
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">名称</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_title" runat="server" />
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">招聘人数</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_num" runat="server" />
                                    </div>

                                </div>
                                  <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">工作地址</label>
                                    <div class="col-md-3">
                                        <input type="text" id="txt_adder" runat="server" />
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">日期</label>
                                    <div class="col-md-3">
                                        <%--<input type="text" id="txt_modtime" runat="server" class="dataTime" />--%>
                                         <input type="text" id="test6" class="dataTime" runat="server" readonly="readonly"/>
                                    </div>

                                </div>
                             
                                <div class="form-group">
                                    <label for="form-field-select-1" class="col-md-1">内容</label>
                                </div>
                                <div class="editorbox">


                                    <div class="wysiwyg-editor" id="editor1" runat="server"></div>
                                    <div class="hr hr-double dotted"></div>
                                </div>
                                <input type="hidden" id="txt_cont" runat="server" />

                                <div class="clearfix">
                                    <div class="col-md3">
                                        <asp:Button ID="btn" runat="server" Text="确定" CssClass="btn btn-info btn-block no-border"  OnClick="btn_Click"  OnClientClick="return ks();" />
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
    <%--<script src="../js/fileinput.js"></script>--%>
    <%--<script src="../js/fileinput_locale_zh.js"></script>--%>
    <script src="../js/localResizeIMG2.js"></script>
    <!-- ace scripts -->

    <script src="../js/ace-elements.min.js"></script>
    <script src="../js/ace.min.js"></script>
    <script src="../js/date-time/daterangepicker.min.js"></script>
    <script src="../js/date-time/datetimepicker_cn.js"></script>
    <!-- inline scripts related to this page -->

    <script type="text/javascript">
        jQuery(function ($) {

            function showErrorAlert(reason, detail) {
                var msg = '';
                if (reason === 'unsupported-file-type') { msg = "Unsupported format " + detail; }
                else {
                    console.log("error uploading file", reason, detail);
                }
                $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                    '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
            }

            //$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons

            //but we want to change a few buttons colors for the third style
            $('#editor1').ace_wysiwyg({
                toolbar:
                [
                    'font',
                    null,
                    'fontSize',
                    null,
                    { name: 'bold', className: 'btn-info' },
                    { name: 'italic', className: 'btn-info' },
                    { name: 'strikethrough', className: 'btn-info' },
                    { name: 'underline', className: 'btn-info' },
                    null,
                    { name: 'insertunorderedlist', className: 'btn-success' },
                    { name: 'insertorderedlist', className: 'btn-success' },
                    { name: 'outdent', className: 'btn-purple' },
                    { name: 'indent', className: 'btn-purple' },
                    null,
                    { name: 'justifyleft', className: 'btn-primary' },
                    { name: 'justifycenter', className: 'btn-primary' },
                    { name: 'justifyright', className: 'btn-primary' },
                    { name: 'justifyfull', className: 'btn-inverse' },
                    null,
                    { name: 'createLink', className: 'btn-pink' },
                    { name: 'unlink', className: 'btn-pink' },
                    null,
                    { name: 'insertImage', className: 'btn-success' },
                    null,
                    'foreColor',
                    null,
                    { name: 'undo', className: 'btn-grey' },
                    { name: 'redo', className: 'btn-grey' }
                ],
                'wysiwyg': {
                    fileUploadError: showErrorAlert
                }
            }).prev().addClass('wysiwyg-style2');
         


            //下拉


            //Add Image Resize Functionality to Chrome and Safari
            //webkit browsers don't have image resize functionality when content is editable
            //so let's add something using jQuery UI resizable
            //another option would be opening a dialog for user to enter dimensions.
            if (typeof jQuery.ui !== 'undefined' && /applewebkit/.test(navigator.userAgent.toLowerCase())) {

                var lastResizableImg = null;
                function destroyResizable() {
                    if (lastResizableImg == null) return;
                    lastResizableImg.resizable("destroy");
                    lastResizableImg.removeData('resizable');
                    lastResizableImg = null;
                }

                var enableImageResize = function () {
                    $('.wysiwyg-editor')
                        .on('mousedown', function (e) {
                            var target = $(e.target);
                            if (e.target instanceof HTMLImageElement) {
                                if (!target.data('resizable')) {
                                    target.resizable({
                                        aspectRatio: e.target.width / e.target.height,
                                    });
                                    target.data('resizable', true);

                                    if (lastResizableImg != null) {//disable previous resizable image
                                        lastResizableImg.resizable("destroy");
                                        lastResizableImg.removeData('resizable');
                                    }
                                    lastResizableImg = target;
                                }
                            }
                        })
                        .on('click', function (e) {
                            if (lastResizableImg != null && !(e.target instanceof HTMLImageElement)) {
                                destroyResizable();
                            }
                        })
                        .on('keydown', function () {
                            destroyResizable();
                        });
                }

                enableImageResize();

                /**
                //or we can load the jQuery UI dynamically only if needed
                if (typeof jQuery.ui !== 'undefined') enableImageResize();
                else {//load jQuery UI if not loaded
                    $.getScript($path_assets+"/js/jquery-ui-1.10.3.custom.min.js", function(data, textStatus, jqxhr) {
                        if('ontouchend' in document) {//also load touch-punch for touch devices
                            $.getScript($path_assets+"/js/jquery.ui.touch-punch.min.js", function(data, textStatus, jqxhr) {
                                enableImageResize();
                            });
                        } else	enableImageResize();
                    });
                }
                */
            }


        });
        function ks() {
            var _content = $('#editor1').html();
            $('#txt_cont').val(_content);
            if ($("#txt_title").val() == "") {
                alert("招聘名称不能为空！！");
                return false;
            }

            if ($("#txt_num").val() == "") {
                alert("人数不能为空！！");
                return false;
            }
            if ($("#txt_title").val() == "") {
                alert("发布日期不能为空！！");
                return false;
            }
            if ($("#txt_title").val() == "") {
                alert("截止日期不能为空！！");
                return false;
            }
            if ($("#editor1").text() == "") {
                alert("招聘内容不能为空！！");
                return false;
            }

        }
    </script>
     <script>
         $(function () {
             laydate.render({
                 elem: '#test6'
                , range: true
             });
         })
    </script>
</body>
</html>
