<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountrySetup.aspx.cs" Inherits="Portfolio.CountrySetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Country</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/XBRL.css" rel="stylesheet" />

    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnUpdate').hide();
            GetCountry();
            $('#btnAdd').click(function () {

                GetInsertCountry();
            });
            $('#btnUpdate').click(function () {

                UpdateCountry();
            });
        });

        function GetInsertCountry() {
            if (document.getElementById("chkActive").checked) {
                active = "Y";
            }
            else {
                active = "N";
            }
            var ajax_data = {

                country: $('#txtCountry').val(),
                active: active
            };
            $.ajax({
                url: "api/XBRL/GetInsertCountry",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert('Add Successfully !')
                    document.getElementById("txtCountry").value = '';
                    $("#chkActive").prop("checked", false);
                    GetCountry();




                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function GetCountry() {
            $.ajax({
                url: "api/XBRL/GetCountry",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    LoadCountry(data);



                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function LoadCountry(data) {

            if ($.fn.dataTable.isDataTable('#tblCountry')) {
                accounttablevar = $('#tblCountry').DataTable().clear().destroy();
            }
            var accounttablevar = $('#tblCountry').DataTable({
                orderCellsTop: true,
                fixedHeader: true,

                "language": {
                    "info": "_END_ of _TOTAL_"
                },
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

                    { "data": "COUNTRY_CODE" },
                    { "data": "COUNTRY_DESC" },
                    { "data": "SEC_ACTIVE_FLAG" },




                    {
                        "date": "COUNTRY_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnCountryEdit(\'' + full["COUNTRY_CODE"] + '\',\'' + full["COUNTRY_DESC"] + '\',\'' + full["SEC_ACTIVE_FLAG"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "COUNTRY_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnCountryDelte(\'' + full["COUNTRY_CODE"] + '\')"></input>';

                        }
                    },



                ],

            });


        }
        var contcode, CountryDesc, flagActive;
        function OnCountryEdit(COUNTRY_CODE, COUNTRY_DESC, SEC_ACTIVE_FLAG) {
            debugger
            document.getElementById("txtCountry").value = COUNTRY_DESC;
            contcode = COUNTRY_CODE;
            CountryDesc = COUNTRY_DESC;
            flagActive = SEC_ACTIVE_FLAG;
             if (SEC_ACTIVE_FLAG == 'Y') {
                $("#chkActive").prop("checked", true);
            }
            else {
                $("#chkActive").prop("checked", false);
            }
           
               $('#btnUpdate').show();
              $('#btnAdd').hide();

        }

        function OnCountryDelte(COUNTRY_CODE) {
            if (confirm("Are you sure you want to Delete?")) {
                var ajax_data = {
                    countryCode: COUNTRY_CODE
                };

                $.ajax({
                    url: "api/XBRL/GETDeleteCountry",
                    data: ajax_data,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        alert('Delete Successfully');
                        GetCountry();


                    },
                    error: function (request) {
                        //notifyError('Saving User Detail failed!');

                    }
                });
            }
            else {

            }
        }


        function UpdateCountry() {
           
           
             if (document.getElementById("chkActive").checked) {
                active = "Y";
            }
            else {
                active = "N";
            }


            var ajax_data = {
                countryCode: contcode,
                country: $('#txtCountry').val(),
                active: active
            };

            $.ajax({
                url: "api/XBRL/GETUpdateCountry",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert('Update Successfully');
                      document.getElementById("txtCountry").value = '';
                    $("#chkActive").prop("checked", false);
                   $('#btnUpdate').hide();
              $('#btnAdd').show();

                    GetCountry();


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }


    </script>
    <style type="text/css">
        .checkbox label:after {
            content: '';
            display: table;
            clear: both;
        }

        .checkbox .cr {
            position: relative;
            display: inline-block;
            border: 1px solid #a9a9a9;
            border-radius: .25em;
            width: 1.3em;
            height: 1.3em;
            float: left;
            margin-right: .5em;
        }

            .checkbox .cr .cr-icon {
                position: absolute;
                font-size: .8em;
                line-height: 0;
                top: 50%;
                left: 15%;
            }

        .checkbox label input[type="checkbox"] {
            display: none;
        }

            .checkbox label input[type="checkbox"] + .cr > .cr-icon {
                opacity: 0;
            }

            .checkbox label input[type="checkbox"]:checked + .cr > .cr-icon {
                opacity: 1;
            }

            .checkbox label input[type="checkbox"]:disabled + .cr {
                opacity: .5;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Country</h1>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-4">
                        <label class="control-label">Country:</label>
                        <input type="text" id="txtCountry" placeholder="Please Enter Country" class="form-control" />
                    </div>

                    <div class="col-md-4">
                        <label class="control-label">Active Flag:</label>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="chkActive" />
                                <span class="cr"><i class=""></i></span>
                                Yes / No
                            </label>
                        </div>

                    </div>


                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                </div>
                <div class="col-sm-3">
                    <br />
                    <input type="button" style="margin-left: 14px" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                    <input type="button" class="btn btn-success" id="btnUpdate" onclick="javascript: return false;" value="UPDATE" />
                </div>
            </div>
            <br />


            <div class="row">
                <div class="col-sm-12">

                    <div class="table-responsive">
                        <table id="tblCountry" class="display" style="width: 100%">
                            <thead>
                                <tr>

                                    <th>Country Code </th>
                                    <th>Country</th>
                                    <th>Active Flag</th>
                                    <th></th>
                                    <th></th>





                                </tr>
                            </thead>


                            <tbody></tbody>
                        </table>
                    </div>

                </div>
            </div>


        </div>
    </form>
</body>
</html>
