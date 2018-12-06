<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allcategory.aspx.cs" Inherits="account_allcategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/font-awesome.min.css" />
    <link rel="stylesheet" href="../css/ace.min.css" />
    <link rel="stylesheet" href="../css/ace-rtl.min.css" />
    <link rel="stylesheet" href="../css/ace-skins.min.css" />
    <script src="../js/jquery-1.10.2.min.js"></script>
     <script src="../js/bootstrap.min.js"></script>
    <script src="../js/typeahead-bs2.min.js"></script>
    <script src="../js/ace-elements.min.js"></script>
    <script src="../js/ace.min.js"></script>
    <style>
        body{
            padding:0;
            margin:0;
        }
        .widget-box{
            margin:0;
            
        }
        .control-label{
            text-align:right;
            
        }
    </style>
</head>
<body style="background-color:transparent" >
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
                    <input id="txt_id" runat="server" type="hidden"  value="0"/>
                     <input id="txt_pid" runat="server" type="hidden"  value="0"/>
                  
                    <div class="clearfix">
                        <div class="col-md-offset-3 col-xs-9" style="float:right;padding-left:7px;">
                         
                            <asp:Button ID="btn" runat="server" Text="确定"  CssClass="btn btn-info btn-sm" OnClick="btn_Click" />

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
