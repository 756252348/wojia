<%@ Page Language="C#" AutoEventWireup="true" CodeFile="goodsaddspecification.aspx.cs" Inherits="account_goodsaddspecification" %>

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
            margin-right: 2.3334%;
        }

        .file-preview, .file-drop-zone {
            border-radius: 0;
        }

        input[type=radio].ace + .lbl::before {
            line-height: 17px;
            margin-right: 5px;
            vertical-align: initial;
        }

        input[type=radio].ace + .aaa::before {
            padding-right: 1px;
        }

        .form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline {
            padding-top: 2px;
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
                    <h3 class="header smaller lighter blue">商品规格管理</h3>
                    <!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <form>

                                <hr />
                            </form>
                            <form class="form-horizontal" role="form" runat="server">

                        <div class="form-group">
                            <label for="form-field-select-1" class="col-md-1">规格名称</label>
                            <div class="col-md-3">
                                <input type="text" id="txt_name" runat="server" />
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="form-field-select-1" class="col-md-1">原价</label>
                            <div class="col-md-3">
                                <input type="text" id="txt_omoney" runat="server" />
                            </div>

                        </div>
                        
                        <div class="form-group">
                            <label for="form-field-select-1" class="col-md-1">现价</label>
                            <div class="col-md-3">
                                <input type="text" id="txt_nmoney" runat="server" />
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="form-field-select-1" class="col-md-1">库存</label>
                            <div class="col-md-3">
                                <input type="text" id="txt_num" runat="server" />
                            </div>

                        </div>
                       
                        <div class="clearfix">
                            <div class="col-md-5">
                             <asp:Button ID="btn" runat="server" Text="确认" CssClass="btn btn-info btn-block no-border" OnClick="btn_Click" />
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

            function showErrorAlert(reason, detail) {
                var msg = '';
                if (reason === 'unsupported-file-type') { msg = "Unsupported format " + detail; }
                else {
                    console.log("error uploading file", reason, detail);
                }
                $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                 '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
            }
 
          


        });

        function ks() {
            if ($("#txt_name").val() == "") {
                alert("规格名称不能为空！！");
                return false;
            }
            if ($("#txt_omoney").val() == "") {
                alert("原价不能为空！！");
                return false;
            }
            if ($("#txt_nmoney").val() == "") {
                alert("现价不能为空！！");
                return false;
            }
            if ($("#txt_num").val() == "") {
                alert("库存不能为空！！");
                return false;
            }
           

        }

    </script>

</body>
</html>