<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VariableSetup.aspx.cs" Inherits="Portfolio.VaraibleSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Variable Setup</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <script src="//cdn.datatables.net/plug-ins/1.10.19/dataRender/ellipsis.js"></script>
    <script src="//cdn.datatables.net/plug-ins/1.10.19/dataRender/datetime.js"></script>
    <link rel="stylesheet" href="assets/css/main.min.css" media="all" />

    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
    <script src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
           
          
            $('#EffToDate').datetimepicker({ format: "DD-MMM-YYYY" });
            $('#EffEndDate').datetimepicker({ format: "DD-MMM-YYYY" });

            GetVariable();
            $('#btnUpdVariable').hide();

            $('#btnAddVariable').click(function () {
                AddVariable();

            });
            $('#btnUpdVariable').click(function () {
                UpdateVariable();
            });


        });


        function AddVariable() {



            var ajax_data = {
                VariableCode: $('#txtVariableCode').val(),
                VariableName: $('#txtVariableName').val(),
                Variablequery: $('#txtVariablequery').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val(),
                VariableType: $('#txtVariableType').val(),
                VariableQueryDetail: $('#txtVariableQueryDetail').val()



            };
            $.ajax({
                url: "api/XBRL/GetInsertVaraible",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');

                    document.getElementById("txtVariableCode").value = '';
                    document.getElementById("txtVariableName").value = '';
                    document.getElementById("txtVariablequery").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';

                    document.getElementById("txtVariableType").value = '';
                    document.getElementById("txtVariableQueryDetail").value = '';


                    GetVariable();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetVariable() {

            $.ajax({
                url: "api/XBRL/GetVaraible",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadVariable(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadVariable(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblVariable')) {
                tblQuestType = $('#tblVariable').DataTable().clear().destroy();
            } $.fn.dataTable.moment('DD/MM/YY');
            tblQuestType = $('#tblVariable').DataTable({
                orderCellsTop: true,
                fixedHeader: true,
                columnDefs: [{
                    targets: [2, 6],
                    render: $.fn.dataTable.render.ellipsis(20)
                }, 

                ],
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

                    { "data": "VARIABLE_CODE" },
                    { "data": "VARIABLE_NAME" },

                    { "data": "VARIABLE_QUERY" },
                    { "data": "EFFECTIVE_START_DATE" },
                    { "data": "EFFECTIVE_END_DATE" },
                    { "data": "VARIABLE_TYPE" },
                    { "data": "VARIABLE_QUERY_DETAIL" },

                    {
                        "date": "VARIABLE_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnVariableEdit(\'' + full["VARIABLE_CODE"] + '\',\'' + full["VARIABLE_NAME"] + '\',\'' + full["VARIABLE_QUERY"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\',\'' + full["VARIABLE_TYPE"] + '\',\'' + full["VARIABLE_QUERY_DETAIL"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "VARIABLE_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnVariableDelete(\'' + full["VARIABLE_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var VariableCode;
        function OnVariableEdit(VARIABLE_CODE, VARIABLE_NAME, VARIABLE_QUERY, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE, VARIABLE_TYPE,
            VARIABLE_QUERY_DETAIL) {

            VariableCode = VARIABLE_CODE;
            $('#btnAddVariable').hide();
            $('#btnUpdVariable').show();
            document.getElementById("txtVariableCode").value = VARIABLE_CODE;
            document.getElementById("txtVariableName").value = VARIABLE_NAME;
            document.getElementById("txtVariablequery").value = VARIABLE_QUERY;
            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;
            document.getElementById("txtVariableType").value = VARIABLE_TYPE;
            document.getElementById("txtVariableQueryDetail").value = VARIABLE_QUERY_DETAIL;
        }
        function OnVariableDelete(VARIABLE_CODE) {

            var ajax_data = {

                VARIABLE_CODE: VARIABLE_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteVaraible",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetVariable();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateVariable() {



            var ajax_data = {
                VariableCode: VariableCode,
                VariableName: $('#txtVariableName').val(),
                Variablequery: $('#txtVariablequery').val(),
                EffToDate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val(),
                VariableType: $('#txtVariableType').val(),
                VariableQueryDetail: $('#txtVariableQueryDetail').val()
            };
            $.ajax({
                url: "api/XBRL/GetUpdateVaraible",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetVariable();
                    $('#btnAddVariable').show();
                    $('#btnUpdVariable').hide();


                    document.getElementById("txtVariableCode").value = '';
                    document.getElementById("txtVariableName").value = '';
                    document.getElementById("txtVariablequery").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';

                    document.getElementById("txtVariableType").value = '';
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
                <h1 style="text-align: center">Variable</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Variable Code :</label>
                    <input type="text" placeholder="Please Enter Variable Code" id="txtVariableCode" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Variable Name :</label>
                    <input type="text" placeholder="Please Enter Variable Name" id="txtVariableName" class="form-control" />
                </div>
                <div class="col-sm-6">
                    <label class="control-label">Variable Query :</label>
                    <input type="text" style="height: 100px" placeholder="Please Enter Variable Query" id="txtVariablequery" class="form-control" />
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
                    <label class="control-label">Variable Type :</label>
                    <input type="text" placeholder="Please Enter Variable Type" id="txtVariableType" class="form-control" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="control-label">Variable Query Detail :</label>
                    <input type="text" style="height: 100px" placeholder="Please Enter Variable Query Detail" id="txtVariableQueryDetail" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddVariable" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdVariable" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblVariable" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Variable  Code </th>
                                <th>Variable Name</th>
                                <th>Variable  Query</th>
                                <th>Effective Start Date</th>
                                <th>Effective End Date</th>
                                <th>Variable Type</th>
                                <th>Variable Query Detail</th>
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
