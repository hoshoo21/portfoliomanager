<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormulaSetup.aspx.cs" Inherits="Portfolio.FormulaSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formula Setup</title>
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

            GetFormula();
            GetStandredDropdown();
            $('#btnUpdFormula').hide();

            $('#btnAddFormula').click(function () {
                AddFormula();

            });
            $('#btnUpdFormula').click(function () {
                UpdateFormula();
            });


        });
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

        function AddFormula() {



            var ajax_data = {
                StanderType: $('#ddlStandardType option:Selected').text(),
                FormulaCode: $('#txtFormulaCode').val(),
                FormulaName: $('#txtFormulaName').val(),
                NumeratorCode: $('#txtNumeratorCode').val(),
                DenominatorCode: $('#txtDenominatorCode').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val(),
                FormulaType: $('#txtFormulaType').val(),



            };
            $.ajax({
                url: "api/XBRL/GetInsertFormula",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');

                   
                    document.getElementById("txtFormulaCode").value = '';
                    document.getElementById("txtFormulaName").value = '';
                    document.getElementById("txtNumeratorCode").value = '';
                    document.getElementById("txtDenominatorCode").value = '';

                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    document.getElementById("txtFormulaType").value = '';
                    $('#ddlStandardType').val('0');
                    GetFormula();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetFormula() {

            $.ajax({
                url: "api/XBRL/GetFormula",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadFormula(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadFormula(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblFormula')) {
                tblQuestType = $('#tblFormula').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblFormula').DataTable({
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

                    { "data": "STANDARD_TYPE" },
                    { "data": "FORMULA_CODE" },

                    { "data": "FORMULA_NAME" },
                    { "data": "NUMERATOR_CODE" },
                    { "data": "DENOMINATOR_CODE" },
                    { "data": "EFFECTIVE_START_DATE" },
                    { "data": "EFFECTIVE_END_DATE" },
                    { "data": "FORMULA_TYPE" },
                    //{
                    //    "date": "FORMULA_CODE",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnFormulaEdit(\'' + full["STANDARD_TYPE"] + '\',\'' + full["FORMULA_CODE"] + '\',\'' + full["FORMULA_NAME"] + '\',\'' + full["NUMERATOR_CODE"] + '\',\'' + full["DENOMINATOR_CODE"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\',\'' + full["FORMULA_TYPE"] + '\')"></input>';

                    //    }
                    //},

                    {
                        "date": "FORMULA_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnFormulaDelete(\'' + full["FORMULA_CODE"] + '\',\'' + full["STANDARD_TYPE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var FormulaCode;
        function OnFormulaEdit(STANDARD_TYPE, FORMULA_CODE, FORMULA_NAME, NUMERATOR_CODE, DENOMINATOR_CODE, EFFECTIVE_START_DATE,
            EFFECTIVE_END_DATE, FORMULA_TYPE) {

            FormulaCode = FORMULA_CODE;
            $('#btnAddFormula').hide();
            $('#btnUpdFormula').show();
            $('#ddlStandardType option:selected').text(STANDARD_TYPE),
            
            document.getElementById("txtFormulaCode").value = FORMULA_CODE;
            document.getElementById("txtFormulaName").value = FORMULA_NAME;
            document.getElementById("txtNumeratorCode").value = NUMERATOR_CODE;
            document.getElementById("txtDenominatorCode").value = DENOMINATOR_CODE;
            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;
            document.getElementById("txtFormulaType").value = FORMULA_TYPE;
             $('#txtFormulaCode').prop("disabled", true); 
        }
        function OnFormulaDelete(FORMULA_CODE,STANDARD_TYPE) {

            var ajax_data = {

                FORMULA_CODE: FORMULA_CODE,
                STANDARD_TYPE:STANDARD_TYPE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteFormula",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetFormula();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateFormula() {



            var ajax_data = {
                StanderType: $('#ddlStandardType option:Selected').text(),
                FormulaCode: $('#txtFormulaCode').val(),
                FormulaName: $('#txtFormulaName').val(),
                NumeratorCode: $('#txtNumeratorCode').val(),
                DenominatorCode: $('#txtDenominatorCode').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val(),
                FormulaType: $('#txtFormulaType').val(),
            };
            $.ajax({
                url: "api/XBRL/GetUpdateFormula",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetFormula();
                    $('#btnAddFormula').show();
                    $('#btnUpdFormula').hide();
                     $('#ddlStandardType').val('0');
                    
                    document.getElementById("txtFormulaCode").value = '';
                    document.getElementById("txtFormulaName").value = '';
                    document.getElementById("txtNumeratorCode").value = '';
                    document.getElementById("txtDenominatorCode").value = '';

                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    document.getElementById("txtFormulaType").value = '';

                    document.getElementById("txtVariableType").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    $('#txtFormulaCode').prop("disabled", false); 
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
                <h1 style="text-align: center">Formula</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Formula Code:</label>
                    <input type="text" placeholder="Please Enter Formula Code" id="txtFormulaCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Standard Type:</label>
                    <select id="ddlStandardType" class="form-control"></select>
                </div>
                
                <div class="col-sm-3">
                    <label class="control-label">Formula Name:</label>
                    <input type="text" placeholder="Please Enter Formula Name" id="txtFormulaName" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Numerator Code :</label>
                    <input type="text" placeholder="Please Enter Numerator Code" id="txtNumeratorCode" class="form-control" />
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Denominator Code :</label>
                    <input type="text" placeholder="Please Enter Numerator Code" id="txtDenominatorCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Effective Start Date :</label>
                        <div class="input-group date" id="EffToDate">
                            <input type="text" placeholder="Select Effective To Date" class="form-control" id="txtEffToDate" />
                            <span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
                        </div>


                    </div>
                </div>
                <div class="col-sm-3">

                    <div class="form-group">
                        <label class="control-label">Effective End Date :</label>
                        <div class="input-group date" id="EffEndDate">
                            <input type="text" placeholder="Select Effective End Date" class="form-control" id="txtEffEndDate" />
                            <span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
                        </div>


                    </div>

                </div>
                <div class="col-sm-3">
                    <label class="control-label">Formula Type :</label>
                    <input type="text" placeholder="Please EnterFormula Type" id="txtFormulaType" class="form-control" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddFormula" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdFormula" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblFormula" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Standard Type</th>
                                <th>Formula Code</th>
                                <th>Formula  Name</th>
                                <th>Numerator Code</th>
                                <th>Denominator  Code</th>
                                <th>Effective Start Date</th>
                                <th>Effective End Date</th>
                                <th>Formula Type</th>

                                <%--<th></th>--%>
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
