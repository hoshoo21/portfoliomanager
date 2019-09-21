<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportingStructure.aspx.cs" Inherits="Portfolio.CompanyReportingStructure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reporting Structure</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/XBRL.css" rel="stylesheet" />

    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            //GetCompany();
            GetCountry();
            GetStructure();
            //GetStructureVal();
            GetCompanyStructure();
            $('#btnUpdate').hide();
            $('#btnAdd').click(function () {

                GetInsertCompanyStructure();
            });
            $('#btnUpdate').click(function () {

                GetUpdateCompany();
              
            });
            $('#btnCopy').click(function () {

                GetReptStructure();
                 
            });

        });
        // function GetCompany() {

        //    $.ajax({
        //        url: "api/XBRL/GetCompanes",
        //        type: 'GET',
        //        dataType: 'json',
        //        data: '',
        //        success: function (data) {

        //         $('#ddlCompany').empty();
        //            $('#ddlCompany').append($('<option>').text("Select Company"));

        //            $.each(data, function (i, value) {
        //                $('#ddlCompany').append($('<option>').text(value.COMPANY_NAME).attr('value', value.COMPANY_CIK));

        //            });


        //        },
        //        error: function (request) {
        //            //notifyError('Data Load failed!');

        //        }
        //    });

        //}
        function GetCountry() {
            $.ajax({
                url: "api/XBRL/GetCountry",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#ddlCountry').empty();
                    $('#ddlCountryCopy').empty();
                    $('#ddlCountry').append($('<option>').text("Select Country"));
                    $('#ddlCountryCopy').append($('<option>').text("Select Country"));

                    $.each(data, function (i, value) {
                        $('#ddlCountry').append($('<option>').text(value.COUNTRY_DESC).attr('value', value.COUNTRY_CODE));
                        $('#ddlCountryCopy').append($('<option>').text(value.COUNTRY_DESC).attr('value', value.COUNTRY_CODE));
                    });





                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }


        function GetInsertCompanyStructure() {

            //var compnayCode = document.getElementById("ddlCompany").value;
            //if (compnayCode == 'Select Company') {
            //    compnayCode = '';

            //}
            //else {
            //    compnayCode: compnayCode;
            //}
            var strucutre = document.getElementById("ddlStructure").value;
            if (strucutre == 'Select Structure') {
                strucutre = '';
            }
            else {
                strucutre: strucutre;
            }
            var country = document.getElementById("ddlCountry").value;
            if (country == 'Select Country') {
                country = '';
            }
            else {
                country: country;
            }
            //var structVal = document.getElementById("ddlStructureValue").value;
            //if (structVal == 'Select Structure Value') {
            //    structVal = '';
            //}
            //else
            //{
            //    structVal: structVal;
            //}
            var ajax_data = {

                country: country,
                strucutre: strucutre,
                structVal: $('#txttructureValue').val(),
                structDesc: $('#txttructureDesc').val(),
                level: $('#ddlStructurlevel').val()


            };
            $.ajax({
                url: "api/XBRL/GetInsertStructure",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert('Add Successfully !')
                    GetCompanyStructure();

                    document.getElementById("ddlCountry").selectedIndex = "0";
                    document.getElementById("ddlStructure").selectedIndex = "0";

                    document.getElementById("ddlStructurlevel").value = "";
                    document.getElementById("txttructureDesc").value = "";
                    document.getElementById("txttructureValue").value = "";


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetStructure() {
            $.ajax({
                url: "api/XBRL/Getstructure",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#ddlStructure').empty();
                    $('#ddlStructure').append($('<option>').text("Select Structure"));
                    $('#ddlStructureCopy').empty();
                    $('#ddlStructureCopy').append($('<option>').text("Select Structure"));

                    $.each(data, function (i, value) {
                        $('#ddlStructure').append($('<option>').text(value.STRUCTURE_NAME).attr('value', value.STRUCTURE_CODE));
                        $('#ddlStructureCopy').append($('<option>').text(value.STRUCTURE_NAME).attr('value', value.STRUCTURE_CODE));
                    });




                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        //function GetStructureVal() {
        //    $.ajax({
        //        url: "api/XBRL/GetStructVal",
        //        data: {},
        //        type: 'GET',
        //        dataType: 'json',
        //        success: function (data) {
        //            console.log(data);
        //            $('#ddlStructureValue').empty();
        //            $('#ddlStructureValue').append($('<option>').text("Select Structure Value"));

        //            $.each(data, function (i, value) {
        //                $('#ddlStructureValue').append($('<option>').text(value.STRUCTURE_VALUE).attr('value', value.STRUCTURE_VALUE));

        //            });




        //        },
        //        error: function (request) {
        //            //notifyError('Saving User Detail failed!');

        //        }
        //    });
        //}

        function GetCompanyStructure() {
            $.ajax({
                url: "api/XBRL/GetCompanyStructure",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    LoadCompanyStructure(data);

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function LoadCompanyStructure(data) {


            if ($.fn.dataTable.isDataTable('#tblCompanyStructure')) {
                accounttablevar = $('#tblCompanyStructure').DataTable().clear().destroy();
            }
            var accounttablevar = $('#tblCompanyStructure').DataTable({
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


                    { "data": "COUNTRY_DESC" },
                    { "data": "STRUCTURE_NAME" },
                    { "data": "STRUCTURE_VALUE" },

                    { "data": "STRUCTURE_DESCRIPTION" },
                    { "data": "STRUCTURE_LEVEL_ID" },

                    { "data": "CREATED_BY" },

                    { "data": "CREATION_DATE" },

                    //{
                    //    "date": "COMPANY_CIK",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnCompanyEdit(\'' + full["COMPANY_CIK"] + '\')"></input>';

                    //    }
                    //},

                    //{
                    //    "date": "COMPANY_CIK",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnCompanyDelte(\'' + full["COMPANY_CIK"] + '\')"></input>';

                    //    }
                    //},



                ],

            });


        }

        function GetReptStructure() {


            var ajax_data = {
                country: $("#ddlCountry option:selected").val(),
                strcture: $("#ddlStructure option:selected").val()


            };
            $.ajax({
                url: "api/XBRL/GetReprotingStructureDetail",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    if (data.length > 0) {

                          var Copycountry = $("#ddlCountryCopy option:selected").val();
                            var Copystrcture = $("#ddlStructureCopy option:selected").val();
                        $.each(data, function (key, value) {
                            debugger
                            var structval = data[key].STRUCTURE_VALUE;
                            var structureDesc=data[key].STRUCTURE_DESCRIPTION;
                            var level=data[key].STRUCTURE_LEVEL_ID;
                            var ajax_data = {
                                Copycountry:Copycountry,
                                Copystrcture: Copystrcture,
                                structval: structval,
                                structureDesc: structureDesc,
                                level:level
                            };

                            $.ajax({
                                url: "api/XBRL/GetCopyReportingStructure",
                                data: ajax_data,
                                type: 'GET',
                                dataType: 'json',
                                success: function (data) {

                                }
                            });

                        });

                    }
                    alert('copy Successfully!');
                     GetCompanyStructure();

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Reporting Structure</h1>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <%-- <div class="col-sm-3">
                        <label class="control-label">Company :</label>
                       <select id="ddlCompany" class="form-control"></select>
                    </div>  --%>
                    <div class="col-sm-3">
                        <label class="control-label">Country:</label>
                        <select id="ddlCountry" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Structure:</label>
                        <select id="ddlStructure" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Structure Value:</label>
                        <input type="text" placeholder="Please Enter Structure" id="txttructureValue" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Structure Desc:</label>
                        <input type="text" placeholder="Please Enter Structure Desc" id="txttructureDesc" class="form-control" />
                    </div>

                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">

                    <div class="col-sm-3">
                        <label class="control-label">Structure Level:</label>
                        <input type="number" id="ddlStructurlevel" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <br />
                        <input type="button" style="margin-left: 14px" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                        <input type="button" class="btn btn-success" id="btnUpdate" onclick="javascript: return false;" value="UPDATE" />
                    </div>

                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label class="control-label">Country:</label>
                        <select id="ddlCountryCopy" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Structure:</label>
                        <select id="ddlStructureCopy" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <br />
                        <input type="button" style="margin-left: 14px" class="btn btn-success" id="btnCopy" onclick="javascript: return false;" value="Copy " />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">

                    <div class="table-responsive">
                        <table id="tblCompanyStructure" class="display" style="width: 100%">
                            <thead>
                                <tr>

                                    <th>Country </th>
                                    <th>Structure</th>
                                    <th>Structure Value</th>
                                    <th>Structure Desc</th>
                                    <th>Structure Level</th>
                                    <th>Created By</th>
                                    <th>Created Date</th>





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
