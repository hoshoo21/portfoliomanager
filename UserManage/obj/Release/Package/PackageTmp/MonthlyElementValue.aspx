<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyElementValue.aspx.cs" Inherits="Portfolio.MonthlyElementValue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MonthlyElement Analysis</title>
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

            GetStandardType();
            GetCompany();
            GetMonthlyElement();
            $('#btnUpdMonthlyElement').hide();

            $('#btnAddMonthlyElement').click(function () {
                AddMonthlyElement();

            });
            $('#btnUpdMonthlyElement').click(function () {
                UpdateMonthlyElement();
            });


        });

        function GetStandardType() {
            var ajax_data = {


            };

            $.ajax({
                url: "api/XBRL/GetStandardType",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    $('#ddlStandardType').empty();
                    $('#ddlStandardType').append($('<option>').text("Select Standard Type"));

                    $.each(data, function (i, value) {
                        $('#ddlStandardType').append($('<option>').text(value.STANDARD_NAME).attr('value', value.STANDARD_TYPE));

                    });
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function GetCompany() {

            $.ajax({
                url: "api/XBRL/GetCompanes",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    $('#ddlCompany').empty();
                    $('#ddlCompany').append($('<option>').text("Select Company"));

                    $.each(data, function (i, value) {
                        $('#ddlCompany').append($('<option>').text(value.COMPANY_NAME).attr('value', value.COMPANY_CIK));

                    });


                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function AddMonthlyElement() {

            var ajax_data = {
                companyCode: $('#ddlCompany option:selected').val(),
                Reportingcode: $('#txtReportingcode').val(),
                ReportingMonth: $('#txtReportingMonth').val(),
                ReportingYear: $('#txtReportingYear').val(),
                StandardType: $('#ddlStandardType option:selected').val(),
                ElementName: $('#txtElementName').val(),
                ContextCode: $('#txtContextCode').val(),
                ContextId: $('#txtContextId').val(),
                UnitCode: $('#txtUnitCode').val(),
                DescimalRounding: $('#txtDescimalRounding').val(),
                ElementValue: $('#txtElementValue').val(),
                ElementLabel: $('#txtElementLabel').val(),
                FinancialYear: $('#txtFinancialYear').val(),
                ContextLabel: $('#txtContextLabel').val()

            };
            $.ajax({
                url: "api/XBRL/GetInsertMonthlyElementValue",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    GetMonthlyElement();
                    document.getElementById("txtReportingcode").value = '';
                    document.getElementById("txtReportingMonth").value = '';
                    document.getElementById("txtReportingYear").value = '';
                    document.getElementById("txtContextCode").value = '';
                    document.getElementById("txtContextId").value = '';


                    document.getElementById("txtUnitCode").value = '';
                    document.getElementById("txtDescimalRounding").value = '';
                    document.getElementById("txtElementValue").value = '';
                    document.getElementById("txtElementLabel").value = '';

                    document.getElementById("txtFinancialYear").value = '';
                    document.getElementById("txtContextLabel").value = '';
                    document.getElementById("ddlCompany").selectedIndex = 0;
                    document.getElementById("ddlStandardType").selectedIndex = 0;


                    GetMonthlyElement();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetMonthlyElement() {

            $.ajax({
                url: "api/XBRL/GetMonthlyElement",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadMonthlyElement(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadMonthlyElement(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblMonthlyElement')) {
                tblQuestType = $('#tblMonthlyElement').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblMonthlyElement').DataTable({
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

                    { "data": "COMPANY_NAME" },
                    { "data": "REPORTING_MONTH_NO" },

                    { "data": "REPORTING_YEAR" },

                    { "data": "STANDARD_NAME" },
                    { "data": "ELEMENT_NAME" },
                    { "data": "UNIT_CODE" },
                    { "data": "DECIMAL_ROUNDING" },
                    { "data": "ELEMENT_LABEL" },
                    //{
                    //    "date": "MonthlyElement_TYPE",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnMonthlyElementEdit(\'' + full["MonthlyElement_TYPE"] + '\',\'' + full["MonthlyElement_NAME"] + '\',\'' + full["ASSOCIATION_CODE"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\')"></input>';

                    //    }
                    //},

                    //{
                    //    "date": "MonthlyElement_TYPE",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnMonthlyElementDelete(\'' + full["MonthlyElement_TYPE"] + '\')"></input>';

                    //    }
                    //},




                ],

            });


        }
        var MonthlyElementCode;
        function OnMonthlyElementEdit(MonthlyElement_TYPE, MonthlyElement_NAME, ASSOCIATION_CODE, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE) {

            MonthlyElementCode = MonthlyElement_TYPE;
            $('#btnAddMonthlyElement').hide();
            $('#btnUpdMonthlyElement').show();
            document.getElementById("txtMonthlyElementType").value = MonthlyElement_TYPE;
            document.getElementById("txtMonthlyElementName").value = MonthlyElement_NAME;
            document.getElementById("txtAssociationCode").value = ASSOCIATION_CODE;

            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;

        }
        function OnMonthlyElementDelete(MonthlyElement_TYPE) {

            var ajax_data = {

                MonthlyElement_TYPE: MonthlyElement_TYPE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteMonthlyElement",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetMonthlyElement();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateMonthlyElement() {



            var ajax_data = {
                MonthlyElementType: $('#txtMonthlyElementType').val(),
                MonthlyElementName: $('#txtMonthlyElementName').val(),
                AssociationCode: $('#txtAssociationCode').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffEndDate: $('#txtEffEndDate').val()


            };
            $.ajax({
                url: "api/XBRL/GetUpdateMonthlyElement",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetMonthlyElement();
                    $('#btnAddMonthlyElement').show();
                    $('#btnUpdMonthlyElement').hide();

                    document.getElementById("txtMonthlyElementType").value = '';
                    document.getElementById("txtMonthlyElementName").value = '';
                    document.getElementById("txtAssociationCode").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
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
        <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Monthly Element Value</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Company:</label>
                    <select id="ddlCompany" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Reporting code :</label>
                    <input type="text" placeholder="Please Enter Reporting code" id="txtReportingcode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Reporting Month No:</label>
                    <input type="text" placeholder="Please Enter Reporting Month No" id="txtReportingMonth" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Reporting Year:</label>
                    <input type="text" placeholder="Please Enter Reporting Year" id="txtReportingYear" class="form-control" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <label class="control-label">Standard Type:</label>
                    <select id="ddlStandardType" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Element Name:</label>
                    <input type="text" placeholder="Please Enter Element Name" id="txtElementName" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Context Code:</label>
                    <input type="text" placeholder="Please Enter Context Code" id="txtContextCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Context Id:</label>
                    <input type="text" placeholder="Please Enter Context Id" id="txtContextId" class="form-control" />
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <label class="control-label">Unit Code:</label>
                    <input type="text" placeholder="Please Enter Unit Code" id="txtUnitCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Descimal Rounding:</label>
                    <input type="text" placeholder="Please Enter Descimal Rounding" id="txtDescimalRounding" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Element Value:</label>
                    <input type="text" placeholder="Please Enter Element Value" id="txtElementValue" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Element Label:</label>
                    <input type="text" placeholder="Please Enter Element Label" id="txtElementLabel" class="form-control" />
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <label class="control-label">Financial Year:</label>
                    <input type="number"  id="txtFinancialYear" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Context Label :</label>
                    <input type="text" placeholder="Please Enter Context Label" id="txtContextLabel" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddMonthlyElement" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdMonthlyElement" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblMonthlyElement" class="display" style="width: 100%">
                        <thead>
                            <tr>


                                <th>Company</th>
                                <th>Reporting Month</th>
                                <th>Reporting Year</th>
                                <th>Standard Names</th>
                                <th>Element Name</th>

                                <th>Unit Code</th>
                                <th>Descimal Rounding</th>
                                <th>Element Label</th>

                               <%-- <th></th>
                                <th></th>--%>
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
