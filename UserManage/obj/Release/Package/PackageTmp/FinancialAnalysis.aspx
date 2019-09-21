<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancialAnalysis.aspx.cs" Inherits="Portfolio.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Financial Analysis</title>
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

            GetFinancial();
            $('#btnUpdFinancial').hide();

            $('#btnAddFinancial').click(function () {
                AddFinancial();

            });
            $('#btnUpdFinancial').click(function () {
                UpdateFinancial();
            });


        });


        function AddFinancial() {

            var ajax_data = {
                FinancialCode: $('#txtFinancialCode').val(),
                FinancialAnalysis: $('#txtFinancialAnalysis').val(),
                FinancialType: $('#txtFinancialType').val(),
                FinancialNature: $('#txtFinancialNature').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffEndDate: $('#txtEffEndDate').val()




            };
            $.ajax({
                url: "api/XBRL/GetInsertFinancial",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    document.getElementById("txtFinancialCode").value = '';
                    document.getElementById("txtFinancialAnalysis").value = '';
                    document.getElementById("txtFinancialType").value = '';
                    document.getElementById("txtFinancialNature").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';

                  

                    GetFinancial();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetFinancial() {

            $.ajax({
                url: "api/XBRL/GetFinancial",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadFinancial(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadFinancial(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblFinancial')) {
                tblQuestType = $('#tblFinancial').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblFinancial').DataTable({
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

                    { "data": "FA_COA_CODE" },
                    { "data": "FA_COA_DESCRIPTION" },

                    { "data": "FA_COA_TYPE" },
                    { "data": "FA_COA_NATURE" },
                    { "data": "EFFECTIVE_START_DATE" },
                    { "data": "EFFECTIVE_END_DATE" },
                   
                    {
                        "date": "FA_COA_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnFinancialEdit(\'' + full["FA_COA_CODE"] + '\',\'' + full["FA_COA_DESCRIPTION"] + '\',\'' + full["FA_COA_TYPE"] + '\',\'' + full["FA_COA_NATURE"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "FA_COA_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnFinancialDelete(\'' + full["FA_COA_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var FinancialCode;
        function OnFinancialEdit(FA_COA_CODE, FA_COA_DESCRIPTION, FA_COA_TYPE, FA_COA_NATURE, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE) {

            FinancialCode = FA_COA_CODE;
            $('#btnAddFinancial').hide();
            $('#btnUpdFinancial').show();
            document.getElementById("txtFinancialCode").value = FA_COA_CODE;
            document.getElementById("txtFinancialAnalysis").value = FA_COA_DESCRIPTION;
            document.getElementById("txtFinancialType").value = FA_COA_TYPE;
            document.getElementById("txtFinancialNature").value = FA_COA_NATURE;
            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;
         
        }
        function OnFinancialDelete(Financial_CODE) {

            var ajax_data = {

                Financial_CODE: Financial_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteFinancial",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetFinancial();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateFinancial() {



            var ajax_data = {
                 FinancialCode: $('#txtFinancialCode').val(),
                FinancialAnalysis: $('#txtFinancialAnalysis').val(),
                FinancialType: $('#txtFinancialType').val(),
                FinancialNature: $('#txtFinancialNature').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffEndDate: $('#txtEffEndDate').val()
            };
            $.ajax({
                url: "api/XBRL/GetUpdateFinancial",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetFinancial();
                    $('#btnAddFinancial').show();
                    $('#btnUpdFinancial').hide();

                  document.getElementById("txtFinancialCode").value = '';
                    document.getElementById("txtFinancialAnalysis").value = '';
                    document.getElementById("txtFinancialType").value = '';
                    document.getElementById("txtFinancialNature").value = '';
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
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Financial Analysis</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Financial Analysis Code:</label>
                    <input type="text" placeholder="Please Enter Financial Analysis Code" id="txtFinancialCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Financial Analysis:</label>
                    <input type="text" placeholder="Please Enter Financial Analysis" id="txtFinancialAnalysis" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Financial Type:</label>
                    <input type="text" placeholder="Please Enter Financial Type" id="txtFinancialType" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Financial Nature:</label>
                    <input type="text" placeholder="Please Enter Financial Nature" id="txtFinancialNature" class="form-control" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

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
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddFinancial" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdFinancial" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblFinancial" class="display" style="width: 100%">
                        <thead>
                            <tr>


                                <th>Financial Code</th>
                                <th>Financial  Name</th>
                                <th>Financial Type</th>
                                <th>Financial Nature</th>

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

