<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModKeHu.aspx.cs" Inherits="account_ModKeHu" %>
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
        .news-img{
            width:120px;
            height:120px;
            margin:0 10px 10px 0;
            float:left;
        }
        .set-up-img{
            width:120px;
            height:120px;
        }
        
        .news-default{
            background-image:url(/images/kzj_apply.png);
            background-size:120px 120px;
            background-repeat:no-repeat;
            position:relative;
        }
        .file-loading{
            width:120px;
            height:120px;
            position:absolute;
            top:0;
            left:0;
            cursor:pointer;
            opacity:0;
        }
         .img-del {
            position: absolute;
            width:120px;
            display:none;
        }

        .set-del-img{
            position:absolute;
            top:0px;
            right:0px;
            width:20px;
            height:20px;
            float: right;
            cursor:pointer;
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
                  
                    <!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <form>

                                <hr />
                            </form>
                            <form class="form-horizontal" role="form" runat="server">

                           
                                <div class="form-group" >
                                   

                                    <div class="col-md-6"id="imgup">
                                       
                                        <div class="news-img news-default"> <input id="txt_file" name="txt_file" type="file" multiple class="file-loading"></div>
                                        <input name="uploadFile" type="hidden" id="pro_img" value="" runat="server">                                                                                                                     
                                    </div>
                                    <div class="col-md-12">
                                         <p style="color:red">注意：建议上传300*225的封面图</p>
                                    </div>
                                    <script>
                                        $(function () {
                                            //初始化操作
                                            $('#txt_file').localResizeIMG({
                                                //width: 480,//缩略图宽度
                                                quality: 1,//图片质量，0—1，越大越好
                                                success: function (result, _this) {
                                                    //result.base64:带图片类型的base64编码，可直接用于img标签的src
                                                    //result.clearBase64:不带图片类型的编码
                                                    //_this:当前绑定对象
                                                   // console.log(result);
                                                    var _html = '';
                                              
                                                    _html += '<div class="news-img"><div class="img-del"><img src="/images/set-img-del.png" class="new-upload set-del-img"/></div><img src="' + result.base64 + '" alt="" class="set-up-img"/></div>';
                                                    //$('.news-img').css({ 'background-image': 'url(' + result.base64 + ')', 'background-size': 'cover' });
                                                    $("#imgup").prepend(_html);
                                                    $('.news-img').mouseenter(function () {
                                                        $(this).children('.img-del').show();

                                                    });
                                                    $('.news-img').mouseleave(function () {
                                                        $(this).children('.img-del').hide();

                                                    });
                                                    base64uploadimg(result.clearBase64, _this);
                                                
                                                }
                                            });

                                            //删除1
                                            $("#imgup").on('click', '.img-del img', function () {
                                                var img_name = $(this).attr("data-img");
                                                // $layerOpen(img_name);
                                                $(this).parents('.news-img').remove();
                                                var aa = $('#pro_img').val();
                                                var kk = [];
                                                for (var i = 0, len = aa.split("|").length; i < len; i++) {
                                                    if (aa.split("|")[i] != img_name) {
                                                        kk.push(aa.split("|")[i]);
                                                    }

                                                }

                                                $('#pro_img').val(kk.join('|'));
                                            });



                                        });

                                            //上传图片 imgs:[数组/以'|'分割字符串] _this:[可选对象]
                                            function base64uploadimg(imgs, _this) {
                                                var _imgs = '';
                                                if (typeof (imgs) == 'object') {
                                                    _imgs = imgs.join('|');
                                                } else if (typeof (imgs) == 'string') {
                                                    _imgs = imgs;
                                                }
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'AJAX/Base64ImgUpload.ashx',
                                                    data: { base64imgs: _imgs },
                                                    cache: true,
                                                    dataType: "json",
                                                    async: true,
                                                    beforesend: function () { },
                                                    success: function (data) {
                                                        //if (data.data0 = 1000) {
                                                        //    //$('#pro_img').val(data.data1);
                                                        //    //{data0:"1000",data1:"[以'|'分割的文件名]"}
                                                        //    //{data0:"1001",data1:"未执行操作"}
                                                        //    //{data0:"1002",data1:"数据传输错误"}
                                                        //    //{data0:"1003",data1:"上传图片时错误"}
                                                           
                                                        //    //console.log(data);
                                                        //}
                                                        if (data.data0 == '1000') {
                                                            
                                                            var aa = []
                                                            if ($('#pro_img').val().length == 0) {
                                                                aa.push(data.data1)
                                                                
                                                            } else {
                                                                aa = $('#pro_img').val().split('|');
                                                                aa.push(data.data1)

                                                            }
                                                            $('#pro_img').val(aa.join('|'));
                                                            $('.new-upload').attr("data-img", data.data1).removeClass('new-upload');
                                                        }
                                                    },
                                                    error: function () { }
                                                });
                                            }
                                        
                                    </script>
                                </div>
                                <div class="clearfix">
                                    <div class="col-md1">
                                        <asp:Button ID="btn" runat="server" Text="确定" CssClass="btn btn-info btn-block no-border" OnClick="btn_Click" OnClientClick="return ks();" />
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
       

            //图片

            //修改信息
            $.ajax({
                url: "AJAX/commlist.ashx",
                type: "Post",
                async: true,
                data: { parms: ["2", "9"], num: 7 },
                cache: true,
                dataType: "json",
                beforeSend: function () { },
                success: function (data) {
                    if (data) {
                        var dt = data;
                        if (dt.data2 != "") {
                            $('#pro_img').val(dt.data2);//图片  
                            var _html = '';
                            $.each(dt.data2.split('|'), function (i) {

                                _html += '<div class="news-img"><div class="img-del"><img src="/images/set-img-del.png" class="new-upload set-del-img" data-img="' + dt.data2.split('|')[i] + '"/></div><img src="../UploadFile/images/' + dt.data2.split('|')[i] + '" alt="" class="set-up-img"/></div>';
                            });
                            $("#imgup").prepend(_html);
                        }



                        $('.news-img').mouseenter(function () {
                            $(this).children('.img-del').show();

                        });
                        $('.news-img').mouseleave(function () {
                            $(this).children('.img-del').hide();

                        });
                    }
                    else {

                    }


                },
                error: function () { }
            });
            







            //提交
            //$('#btn').click(function () {
            //    var _typeid = $('#city_custom select:visible:last').val();//新闻类别
            //    var _content = $('#editor1').text();
            //    $('#txt_nid').val(_typeid);
            //    $('#txt_cont').val(_content);
            //});


            //$('#city_custom').cxSelect({

            //    selects: ['first', 'second', 'third', 'fourth', 'fifth'],

            //    required: true,

            //    url: _data,

            //    nodata: 'none'

            //});







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
   

}
    </script>

</body>
</html>
