<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="account_orderdetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/font-awesome.min.css" />

    <!--[if IE 7]>
		  <link rel="stylesheet" href="../css/font-awesome-ie7.min.css" />
		<![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <link rel="stylesheet" href=" " />

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
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <h3 class="header smaller lighter blue">订单管理</h3>
                            <div class="space-6"></div>

                            <div class="row">
                                <div class="col-sm-10 col-sm-offset-1">
                                    <div class="widget-box transparent invoice-box">


                                        <div class="widget-body">
                                            <div class="widget-main padding-24">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="row">
                                                            <div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                                                <b>订单信息</b>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <ul class="list-unstyled spaced">
                                                                <asp:Literal ID="orderDetail" runat="server"></asp:Literal>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!-- /span -->

                                                    <div class="col-sm-6">
                                                        <div class="row">
                                                            <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                                <b>快递信息</b>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <div class="widget-body">
                                                                <div class="widget-main padding-8">
                                                                    <form class="form-horizontal" role="form" runat="server">
                                                                        <div class="form-group">
                                                                            <label class="col-xs-3 control-label no-padding-right" for="form-field-1">快递名称 </label>

                                                                            <div class="col-xs-9">
                                                                                <input type="text" class="col-xs-10 col-sm-5" id="txt_name" runat="server" />
                                                                            </div>

                                                                        </div>
                                                                       <div class="form-group">
                                                                            <label class="col-xs-3 control-label no-padding-right" for="form-field-1">快递单号 </label>

                                                                            <div class="col-xs-9">
                                                                                <input type="text" class="col-xs-10 col-sm-5" id="txt_code" runat="server" />
                                                                            </div>

                                                                        </div>

                                                                        <div class="clearfix">
                                                                            <div class="col-md-offset-3 col-xs-9" style="float: right; padding-left: 7px;">

                                                                                <asp:Button ID="btn" runat="server" Text="确定" CssClass="btn btn-info btn-sm" OnClick="btn_Click"  />

                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /span -->
                                                </div>
                                                <!-- row -->

                                                <div class="space"></div>

                                                <div>
                                                    <table class="table table-striped table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th class="center">编号</th>
                                                                <th>商品名称</th>
                                                                <th class="hidden-xs">原价</th>
                                                                <th class="hidden-480">现价</th>
                                                                <th>数量</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <asp:Literal ID="tablelist" runat="server"></asp:Literal>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="hr hr8 hr-double hr-dotted"></div>

                                               

                                                <div class="space-6"></div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

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

    <!-- ace scripts -->

    <script src="../js/ace-elements.min.js"></script>
    <script src="../js/ace.min.js"></script>

    <!-- inline scripts related to this page -->

</body>
</html>
