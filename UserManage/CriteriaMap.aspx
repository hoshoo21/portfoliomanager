<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriteriaMap.aspx.cs" Inherits="Portfolio.CriteriaMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <script src="Javascript/Product.js"></script>
    <script src="bootstrap/js/NewSideBar.js"></script>
    <link href="bootstrap/css/NewSideBar.css" rel="stylesheet" />
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <%-- <link href="bootstrap/css/CustomCheckbox.css" rel="stylesheet" />--%>
    <link href="bootstrap/css/CustomDropdown.css" rel="stylesheet" />
    <%--<link href="assets/css/style.css" rel="stylesheet" />--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">


    <script type="text/javascript">
        $(document).ready(function () {

            GetCriteriaDropDown();
            GetCriteriaCond();
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
                            $('.dropdown-submenu').append('<a style="display: inherit;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a>');



                        }
                    }

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }

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
                            $('#submenu').append('<li><a style="display: -webkit-box;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');



                        }
                    }
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });



        });
        var SearchconditionCol;
        $(document).on("click", "#submenu li a", function () {
            debugger
            var critDValue = $(this).attr("value");
            var critDDesc = $(this).text();
            $('#btnCriteria').val(critDValue);
            $('#btnCriteria').text(critDDesc);
            SearchconditionCol = $(this).data('condcol');


            $('#submenu').hide();
            bindValue(critDValue);
        });

        $(document).on("click", "#btnUpdCritMap", function () {
       
            AddCritMap();

        });
       
        function AddCritMap() {

            var ajax_data = {
                criteria: $('#btnCriteria').val(),
                CriteriaMap: $('#txtCriMap').val()
            };
            $.ajax({
                url: "api/Products/GetUpdateCriteriacondition",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');

                    document.getElementById("txtCriMap").value = '';
                    
                    $('#btnCriteria').val('Select Criteria');
             
                    GetCriteriaCond();
                   
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetCriteriaCond() {

            $.ajax({
                url: "api/Products/GETCriteriaAll",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadCriteriaCondition(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadCriteriaCondition(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblCriteriaCond')) {
                tblQuestType = $('#tblCriteriaCond').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblCriteriaCond').DataTable({
                orderCellsTop: true,
                fixedHeader: true,
              
                bAutoWidth: false,

                responsive: {
                    details: {
                        type: 'column',
                        target: 'tr'
                    }
                },

                "sPaginationType": "simple",
                data: data,

                dom: 'Bfrtip',
                select: true,


                "columns": [

                    { "data": "CRITERIA_CODE" },
                    { "data": "DESCRIPTION" },

                    { "data": "SECTOR_DESC" },

                    

                     {
                        "date": "CRITERIA_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnCriteriacondEdit(\'' + full["CRITERIA_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["SECTOR_DESC"] + '\')"></input>';

                        }
                    },

                ],

            });


        }
        function OnCriteriacondEdit(CRITERIA_CODE,DESCRIPTION,SECTOR_DESC) {
            $('#btnCriteria').text(DESCRIPTION);
            $('#btnCriteria').val(CRITERIA_CODE);
             $('#txtCriMap').val(SECTOR_DESC);
        }
    </script>
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
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Criteria Map Condition</h1>
            </div>
        </div>
        <br />
        <div class="row">

            <div class="col-sm-12" style="display: -webkit-inline-box;">
                <div class="col-md-4 position-relative">
                    <div class="form-group">

                        <label class="control-label">Criteria:</label>
                        <div class="dropdown">

                            <button id="btnCriteria" style="border-color: gainsboro;" class="btn btn-default dropdown-toggle form-control" type="button" data-condcol="" data-toggle="dropdown">
                                <span>Select Criteria</span>

                            </button>
                            <ul class="dropdown-menu" style="width: 250px; height: 350px; overflow: scroll;">

                                <li class="dropdown-submenu"></li>
                            </ul>

                            <ul id="submenu" class="dropdown-menu" style="margin-left: 250px; display: none; width: 250px; height: 350px; overflow: scroll">
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 position-relative">
                    <label>Criteria Condition Map</label>
                    <input id="txtCriMap" placeholder="Please Enter Condition column" type="text" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <br />
                   <%-- <input type="button" class="btn btn-success" id="btnAddCritMap" onclick="javascript: return false;" value="ADD " />--%>
                    <input type="button" class="btn btn-success" id="btnUpdCritMap" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblCriteriaCond" class="display" style="width: 100%">
                        <thead>
                            <tr>


                                <th>Criteria Code</th>
                                <th>Criteria  Desc</th>
                                <th>Condition Column</th>
                                <th></th>
                            </tr>
                        </thead>


                        <tbody></tbody>
                    </table>
                </div>

            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    </form>
</body>
</html>
