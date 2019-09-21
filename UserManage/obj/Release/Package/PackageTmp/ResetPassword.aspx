<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Portfolio.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-themecolor">Reset Password</h3>
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
                    <div class="card card-outline-success">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Reset Password</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <div class="row p-t-20">
                                    <div class="col-md-3 col-sm-3 col-xl-3 col-3">
                                        <div class="form-group">
                                            <label>User Name:</label>
                                            <select id="ddlUser" class="js-example-basic-single form-control custom-select">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xl-3 col-3">
                                        <div class="form-group">
                                            <label>New Password:</label>
                                            <input id="txtPassword" class="form-control" type="password" placeholder="New Password" onblur="return matchPassword()" />
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xl-3 col-3">
                                        <div class="form-group">
                                            <label>Confirm Password:</label>
                                            <input id="txtConfirmPassword" class="form-control" type="password" placeholder="Confirm Password" onblur="return matchPassword()" />
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xl-3 col-3">
                                        <div class="form-group">
                                            <button type="button" id="btnSave" class="btn btn-success m-t-30" onclick="return Reset()">Reset</button>
                                        </div>
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
        var localHostApiAddress = '<%= ConfigurationManager.AppSettings["LocalHostApi"].ToString() %>';

        $(document).ready(function () {
            $('.js-example-basic-single').select2({
                theme: "classic"
            });
            UsersList();
            
        });

        var isMatch = false;
        var matchPassword = function () {

            if (($('#txtPassword').val() != "" && $('#txtConfirmPassword').val() != "") && ($('#txtPassword').val() != $('#txtConfirmPassword').val())) {
                $('#errormsg').html('Both Password do not Match.').fadeIn().delay(5000).fadeOut();
                isMatch = false;

            } else {
                isMatch = true;
            }
            return isMatch;
        }

        var Reset = function () {

            if (matchPassword() == true) {

                var utility = new Object();
                utility.UserId = $('#ddlUser').val();
                utility.NewPassword = $('#txtPassword').val();
                utility.ConfirmPassword = $('#txtConfirmPassword').val();

                $(".preloader").fadeIn();
                $.ajax({
                    url: localHostApiAddress + '/api/Utility/ResetPassword',
                    type: 'POST',
                    dataType: 'json',
                    data: utility,
                    success: function (data, textStatus, xhr) {
                        $(".preloader").fadeOut();

                        if (data.Action == true) {
                            $('#msg').html(data.Message).fadeIn().delay(5000).fadeOut();
                            $("html, body").animate({ scrollTop: 0 }, 1000);
                            ActivityLog(localHostApiAddress + '/api/ActivityLog/Save', 57, 2, $('#userName1').html());

                            /*window.location.href = "Login.aspx";*/
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

            } else {
                return false;
            }

        }

        function UsersList() {

            $.ajax({
                type: 'GET',
                url: localHostApiAddress + '/api/Utility/UsersList',
                data: '{}',
                async: true,
                dataType: "json",
                success: function (Result) {
                    $.each(Result, function (index, value) {
                        $("#ddlUser").append($("<option></option>").val(this.Id.toLowerCase().replace(/\b[a-z]/g, function (letter) { return letter.toUpperCase(); })).html(this.Value.toLowerCase().replace(/\b[a-z]/g, function (letter) { return letter.toUpperCase(); })));
                    });                    
                },
                error: function (xhr) {
                    alert('error' + xhr.responseText);
                }
            });
        }

        

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foot" runat="server">
</asp:Content>
