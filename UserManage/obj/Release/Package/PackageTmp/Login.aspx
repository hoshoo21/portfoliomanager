<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ClientManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
    <title>Client Management</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />
    <!-- Date picker plugins css -->
    <link href="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/icheck/skins/all.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- You can change the theme colors from here -->
    <link href="assets/css/colors/megna.css" id="theme" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--  -->
</head>
<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <section id="wrapper" class="login-register login-sidebar" style="background-image: url(assets/images/background/contact.jpg);">
        <div class="login-box card">
            <div class="card-body">
                <form class="form-horizontal form-material" id="loginform" runat="server">
                    <a href="javascript:void(0)" class="text-center db">
                        <img src="assets/images/logo-icon.png" alt="Home" /><%--<br />--%>
                        <%--<img src="assets/images/logo-text.png" alt="Home" />--%>
                    </a>
                    <div class="form-group m-t-40">
                        <div class="col-xs-12">
                            <input class="form-control" id="txtUserName" type="text" placeholder="Username" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" id="txtPassword" type="password" placeholder="Password" runat="server" />
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="checkbox-signup" type="checkbox" />
                                <label for="checkbox-signup">Remember me </label>
                            </div>
                            <a href="javascript:void(0)" id="to-recover" class="text-dark pull-right"><i class="fa fa-lock m-r-5"></i>Forgot pwd?</a>
                        </div>
                    </div>--%>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <asp:LinkButton ID="btnLogin" CssClass="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" OnClick="LoginMethod_Click" runat="server">Log In</asp:LinkButton>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <div id="errormsg" runat="server" style="display: none;" class="alert alert-danger"></div>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" id="recoverform" action="index.html">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>Recover Password</h3>
                            <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email" />
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">

                            <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.min.js"></script>
    <script src="scripts/js/Helper.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    <script type="text/javascript">
        var isValid = true;
        $(document).ready(function () {
            $('form').keyup(function (e) {
                if (e.keyCode == 13) {
                    if (SValidate() == false) {
                        $('#txtUserName').val('');
                        $('#txtPassword').val('');
                        $('#errormsg').html('UserName or Password Is Incorrect.').fadeIn().delay(5000).fadeOut();
                        return false;

                    } else {
                        document.getElementById('btnLogin').click()
                    }
                }
            });
        });

        var SValidate = function () {
            if ($('#txtUserName').val().length < 3 && $('#txtPassword').val().length < 3) {
                isValid = false;
            } else if ($('#txtUserName').val().length < 3 || $('#txtPassword').val().length < 3) {
                isValid = false;
            } else {
                isValid = true;
            }
            return isValid;
        }

        $('#btnLogin').click(function () {
            if (SValidate() == false) {
                $('#txtUserName').val('');
                $('#txtPassword').val('');
                $('#errormsg').html('UserName or Password Is Incorrect.').fadeIn().delay(5000).fadeOut();
                return false;
            }
        })

        //$('form').focusout(function(){ document.getElementById("btnLogin").focus() })
        /*var global = {

            loginName: null,
            loginPassword: null,

            Init: function () {
                return global.Login();
            },

            Login: function () {

                this.loginName = $('#txtUserName').val();
                this.loginPassword = $('#txtPassword').val();

                methods.ajaxAsp('Login/LoginMethod.aspx', 'POST', $(".preloader").fadeIn(), 'json', 'b');*/
                //methods.ajax()

                /*$.ajax({
                    url: localHostApiAddress + '/api/TabsContent/Save',
                    type: 'POST',
                    dataType: 'json',
                    data: tabsContent,
                    success: function (data, textStatus, xhr) {
                        $(".preloader").fadeOut();

                        if (data.Action == true) {
                            Reset();
                            $('#msg').html(data.Message).fadeIn().delay(5000).fadeOut();
                            $("html, body").animate({ scrollTop: 0 }, 1000);
                            setTimeout("BindData()", 5000);
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
                });*/

            /*}

        }*/

        //global.Init();
        //var localHostApiAddress = '<%= ConfigurationManager.AppSettings["LocalHostApi"].ToString() %>';
        /*var data = JSON.stringify({
            "Idx": 0,
            "Description": "AAA",
            "ShortName": "A",
            "IsActive": 1
        });

        var a = methods.ajaxAsp('Login.aspx/LoginMethod', 'POST', $(".preloader").fadeIn(), 'json', '{ b: "b" }');*/

    </script>
</body>
</html>
