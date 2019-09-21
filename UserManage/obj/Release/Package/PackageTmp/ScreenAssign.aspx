<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ScreenAssign.aspx.cs" Inherits="Portfolio.ScreenAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-themecolor">Assign Screen</h3>
            </div>
            <div class="col-md-7 align-self-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div id="msg" style="display: none;" class="alert alert-success"></div>
                    <div id="errormsg" style="display: none;" class="alert alert-danger"></div>
                    <input id="hdnmode" type="hidden" runat="server" />
                    <input id="hdnLstMenuItm" type="hidden" runat="server" />
                    <div class="card card-outline-success">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Assign Screen</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <div class="row p-t-20">
                                    <div class="col-md-3">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Role:</label>
                                                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control custom-select">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12 text-right">
                                            <button type="button" id="btnSave" class="btn btn-success" onclick="return Save()">Save</button>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div id="tree_2" class="tree-demo"></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {            
            //BindRole();
            //GenerateTree(1)
        });

        var localHostApiAddress = '<%= ConfigurationManager.AppSettings["LocalHostApi"].ToString() %>';
        var res = null;
        var mode;
        var values = new Object();
        function GenerateTree(role) {
            values.UserRole = role;            

            $.ajax({
                type: 'GET',
                url: localHostApiAddress + '/api/ScreenAssign/CreateTreeView',
                data: values,
                dataType: "json",
                success: function (Result) {
                    res = Result;
                    AppendTreeView()
                },
                error: function (xhr) {
                    alert('error' + xhr.responseText);
                }
            });
            AppendTreeView()
        }

        function AppendTreeView() {

            $('#tree_2').jstree('destroy');
            var tree = $('#tree_2').jstree({
                'plugins': ["wholerow", "checkbox", "types"],
                'core': {
                    "themes": {
                        "responsive": true
                    },
                    'data': res,
                    'checkbox': {
                        three_state: true
                    }
                },
                'types': {
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg"
                    },
                    "file": {
                        "icon": "fa fa-file icon-state-warning icon-lg"
                    }
                },
                'plugins': ["checkbox"]
            });
        }

        function GetTreeData() {
            var UrMnu = { "MenuItemId": "" };
            var DtlArr = [UrMnu];
            $('#ContentPlaceHolder1_hdnLstMenuItm').val('');
            $("#tree_2").jstree('open_all')
            $('#tree_2 li').each(function () {
                if ($(this).attr('aria-selected') == "true" || $(this).find('a.jstree-anchor > i').hasClass('jstree-undetermined')) {
                    UrMnu.ScreenIdx = $(this).attr('id');
                    UrMnu.IsShow = 1;
                    $('#ContentPlaceHolder1_hdnLstMenuItm').val($('#ContentPlaceHolder1_hdnLstMenuItm').val() + JSON.stringify(UrMnu) + ",");
                } else {
                    UrMnu.ScreenIdx = $(this).attr('id');
                    UrMnu.IsShow = 0;
                    $('#ContentPlaceHolder1_hdnLstMenuItm').val($('#ContentPlaceHolder1_hdnLstMenuItm').val() + JSON.stringify(UrMnu) + ",");
                }
            });
            $('#ContentPlaceHolder1_hdnLstMenuItm').val("[" + $('#ContentPlaceHolder1_hdnLstMenuItm').val() + "]");
        }

        function BindRole() {

            $.ajax({
                type: 'GET',
                url: localHostApiAddress + '/api/ScreenAssign/BindRole',
                data: '{}',
                async: true,
                dataType: "json",
                success: function (Result) {
                    $.each(Result, function (index, value) {
                        $("#ContentPlaceHolder1_ddlRole").append($("<option></option>").val(this.Id).html(this.Value));
                    });
                },
                error: function (xhr) {
                    alert('error' + xhr.responseText);
                }
            });
        }

        $('#ContentPlaceHolder1_ddlRole').change(function () {
            GenerateTree(parseInt($(this).val()));
        });

        var Save = function () {

            $(".preloader").fadeIn();

            GetTreeData();
                
            var screenAssign = new Object();
            screenAssign.UserGroupIdx = parseInt($('#ContentPlaceHolder1_ddlRole').val());
            screenAssign.hdnUserMnu = $('#ContentPlaceHolder1_hdnLstMenuItm').val();
            
            $.ajax({
                url: localHostApiAddress + '/api/ScreenAssign/SaveScreenAssign',
                type: 'POST',
                dataType: 'json',
                data: screenAssign,
                success: function (data, textStatus, xhr) {
                    $(".preloader").fadeOut();

                    if (data.Action == true) {
                        $('#msg').html(data.Message).fadeIn().delay(5000).fadeOut();
                        $("html, body").animate({ scrollTop: 0 }, 1000);

                        ActivityLog(localHostApiAddress + '/api/ActivityLog/Save', 4, 2, $('#userName1').html());

                    } else {
                        $('#errormsg').html(data.ErrorMessage).fadeIn().delay(5000).fadeOut();
                    }
                    return false;
                },
                error: function (xhr, textStatus, errorThrown) {
                    $(".preloader").fadeOut();

                    if (textStatus == 'error') {
                        $('#errormsg').html('Some Error Occured').fadeIn().delay(5000).fadeOut();
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foot" runat="server">
</asp:Content>
