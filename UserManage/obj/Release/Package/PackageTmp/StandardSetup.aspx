<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandardSetup.aspx.cs" Inherits="Portfolio.StandardSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Standard Analysis</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />


    <link rel="stylesheet" href="assets/css/main.min.css" media="all" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#EffToDate').datetimepicker({ format: "DD-MMM-YYYY" });
            $('#EffEndDate').datetimepicker({ format: "DD-MMM-YYYY" });

            GetStandard();
            GetStandredDropdown()
            $('#btnUpdStandard').hide();

            $('#btnAddStandard').click(function () {
                AddStandard();

            });
            $('#btnUpdStandard').click(function () {
                UpdateStandard();
            });

            GetAssociationCode();


            GetStandredDropdown();
        });


        function AddStandard() {

            var ajax_data = {
                StandardType: $('#ddlStandardType option:Selected').val(),
                StandardName: $('#txtStandardName').val(),
                AssociationCode: $('#ddlAssociation option:selected').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffEndDate: $('#txtEffEndDate').val()
            };
            $.ajax({
                url: "api/XBRL/GetInsertStandard",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    $('#ddlAssociation').val('0');
                    $('#txtStandardType').val('0');

                    document.getElementById("txtStandardName").value = '';

                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    $('#ddlAssociation').val('0');


                    GetStandard();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetStandard() {

            $.ajax({
                url: "api/XBRL/GetStandard",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadStandard(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadStandard(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblStandard')) {
                tblQuestType = $('#tblStandard').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblStandard').DataTable({
                orderCellsTop: true,
                fixedHeader: true,
                columnDefs: [{ format: 'dd-mm-yyyy', "targets": 3 }],
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

                    { "data": "STANDARD_TYPE_DESC" },
                    { "data": "STANDARD_NAME" },

                    { "data": "ASSOCIATION_NAME" },

                    { "data": "EFFECTIVE_START_DATE" },
                    { "data": "EFFECTIVE_END_DATE" },

                    {
                        "date": "STANDARD_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnStandardEdit(\'' + full["STANDARD_CODE"] + '\',\'' + full["STANDARD_TYPE_CODE"] + '\',\'' + full["STANDARD_NAME"] + '\',\'' + full["ASSOCIATION_CODE"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "STANDARD_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnStandardDelete(\'' + full["STANDARD_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var StandardCode;
        function OnStandardEdit(STANDARD_CODE, STANDARD_TYPE_CODE, STANDARD_NAME, ASSOCIATION_CODE, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE) {

            StandardCode = STANDARD_CODE;
            $('#btnAddStandard').hide();
            $('#btnUpdStandard').show();
            $('#ddlStandardType').val(STANDARD_TYPE_CODE);
            StandardType: $('#ddlStandardType option:Selected').val(),

                document.getElementById("txtStandardName").value = STANDARD_NAME;

            $('#ddlAssociation').val(ASSOCIATION_CODE);
            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;

        }
        function OnStandardDelete(STANDARD_CODE) {

            var ajax_data = {

                STANDARDCODE: STANDARD_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteStandard",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetStandard();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateStandard() {



            var ajax_data = {
                StandardType: $('#ddlStandardType option:selected').val(),
                StandardName: $('#txtStandardName').val(),
                AssociationCode: $('#ddlAssociation option:selected').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffEndDate: $('#txtEffEndDate').val(),
                StandardCode:StandardCode


            };
            $.ajax({
                url: "api/XBRL/GetUpdateStandard",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetStandard();
                    $('#btnAddStandard').show();
                    $('#btnUpdStandard').hide();


                    document.getElementById("txtStandardName").value = '';
                    //document.getElementById("txtAssociationCode").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    $('#ddlAssociation').val('0');
                    $('#ddlStandardType').val('0');
                    $('#txtEffToDate').val('');
                    $('#txtEffEndDate').val('');
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }



        function GetAssociationCode() {
            $.ajax({
                url: "api/XBRL/GetAssociationList",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {
                    console.log(data);
                    $('#ddlAssociation').empty();
                    $('#ddlAssociation').append($('<option value="0">').text("Select Association"));

                    $.each(data, function (i, value) {
                        $('#ddlAssociation').append($('<option>').text(value.ASSOCIATION_NAME).attr('value', value.ASSOCIATION_CODE));



                    });


                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetStandredDropdown() {
            $.ajax({
                url: "api/XBRL/GetStandardTypeList",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    $('#ddlStandardType').empty();
                    $('#ddlStandardType').append($('<option value="0">').text("Select Standard Type"));

                    $.each(data, function (i, value) {
                        $('#ddlStandardType').append($('<option>').text(value.STANDARD_TYPE_DESC).attr('value', value.STANDARD_TYPE_CODE));



                    });


                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
    </script>
</head>
<body style="margin-top: -48px">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Standard</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-4">
                    <label class="control-label">Standard Type:</label>
                    <select id="ddlStandardType" class="form-control"></select>
                    <%-- <input type="text" placeholder="Please Enter Standard Type" id="txtStandardType" class="form-control" />--%>
                </div>
                <div class="col-sm-4">
                    <label class="control-label">Standard Name:</label>
                    <input type="text" placeholder="Please Enter Standard Name" id="txtStandardName" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <label class="control-label">Association:</label>
                    <select id="ddlAssociation" class="form-control"></select>
                    <%--     <input type="text" placeholder="Please Enter Asscociation Code" id="txtAssociationCode" class="form-control" />--%>
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Effective Start Date :</label>
                        <div class="input-group date" id="EffToDate">
                            <input type="text" placeholder="Select Effective To Date" class="form-control" id="txtEffToDate" />
                            <span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
                        </div>


                    </div>
                </div>
                <div class="col-sm-4">

                    <div class="form-group">
                        <label class="control-label">Effective End Date :</label>
                        <div class="input-group date" id="EffEndDate">
                            <input type="text" placeholder="Select Effective End Date" class="form-control" id="txtEffEndDate" />
                            <span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
                        </div>


                    </div>

                </div>
                <div class="col-sm-4">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddStandard" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdStandard" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblStandard" class="display" style="width: 100%">
                        <thead>
                            <tr>


                                <th>Standard Type</th>
                                <th>Standard  Name</th>
                                <th>Association Code</th>
                                <th>Effective Start Date</th>
                                <th>Effective End Date</th>


                                <th></th>
                                <th></th>
                            </tr>
                        </thead>


                        <tbody></tbody>
                    </table>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
