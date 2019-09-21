<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testDropdown.aspx.cs" Inherits="Portfolio.testDropdown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        .dropdown-submenu {
            position: relative;
        }

            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -1px;
            }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="dropdown">
                    <button id="btnCriteria" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                        Select Criteria
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">

                        <li class="dropdown-submenu"></li>
                    </ul>

                    <ul id="submenu" class="dropdown-menu" style="margin-left: 199px; display: none">
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <script>
        $(document).ready(function () {

            $(document).on("click", ".dropdown-submenu a", function (e) {

                $('#submenu').show();
                $(this).next('ul').toggle();
                e.stopPropagation();
                e.preventDefault();

                var critValue = $(this).attr("value");
                var critDesc = $(this).text();
                var ajax_data = {

                    critValue: critValue
                };

                $.ajax({
                    url: "api/Products/GETCriteriaDetail",
                    type: 'GET',
                    dataType: 'json',
                    data: ajax_data,
                    success: function (data) {

                        $('#submenu').empty();
                        if (data.length > 0) {
                            for (var i = 0; i < data.length; i++) {
                                $('#submenu').append('<li><a style="display: -webkit-box;" class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');



                            }
                        }
                    },
                    error: function (request) {
                        //notifyError('Data Load failed!');

                    }
                });



            });
            GetCriteriaDropDown();
            $(document).on("click", "#submenu li a", function () {

                var critDValue = $(this).attr("value");
                var critDDesc = $(this).text();
                $('#btnCriteria').val(critDValue);
                $('#btnCriteria').text(critDDesc);


            });
        });


        function GetCriteriaDropDown() {

            $.ajax({
                url: "api/Products/GETCriteria",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {


                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $('.dropdown-submenu').append('<a class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a>');



                            //< li class= "dropdown-submenu" > <a class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a></li > ');

                            // < li > <a value=' + data[i].CRITERIA_CODE + ' class="test" tabindex="-1" href="#">' + data[i].DESCRIPTION + ' <span style="margin-left: 7px;font - size: 18px;" class="fa fa-caret-right"></span></a></li > ');
                        }
                    }

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }
    </script>

</body>
</html>
