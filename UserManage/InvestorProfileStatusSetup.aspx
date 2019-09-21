<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorProfileStatusSetup.aspx.cs" Inherits="Portfolio.InvestorProfileStatusSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Risk Tolerence </title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            GetInvestor();
            $('#btnUpdQuestionType').hide();
            $('#btnAddQuestionType').click(function () {
                AddInvestor();

            });
            $('#btnUpdQuestionType').click(function () {
                UpdateInvestor();
            });


        });
        function AddInvestor() {



            var ajax_data = {
                timeHorizonScore: $('#txtTimeHorizon').val(),
                RiskToleranceScore: $('#txTimeTolerance').val(),
                status: $('#txtStatus').val()

            };
            $.ajax({
                url: "api/XBRL/GetInsertInvestorStatus",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');

                    document.getElementById("txtTimeHorizon").value = '';
                    document.getElementById("txTimeTolerance").value = '';
                    document.getElementById("txtStatus").value = '';
                    GetInvestor();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetInvestor() {

            $.ajax({
                url: "api/XBRL/GetInvestorStatus",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadInvestor(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadInvestor(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblInvestor')) {
                tblQuestType = $('#tblInvestor').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblInvestor').DataTable({
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
                    { "data": "IDX" },
                    { "data": "TIME_HORIZON_SCORE" },
                    { "data": "RISK_TOLERANCE_SCORE" },
                    { "data": "STATUS" },




                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnInvestorEdit(\'' + full["IDX"] + '\',\'' + full["TIME_HORIZON_SCORE"] + '\',\'' + full["RISK_TOLERANCE_SCORE"] + '\',\'' + full["STATUS"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnInvestorDelete(\'' + full["IDX"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var InvestorCode;

        function OnInvestorEdit(IDX, TIME_HORIZON_SCORE, RISK_TOLERANCE_SCORE, STATUS) {

            InvestorCode = IDX;
            $('#btnAddQuestionType').hide();
            $('#btnUpdQuestionType').show();
            document.getElementById("txtTimeHorizon").value = TIME_HORIZON_SCORE;
            document.getElementById("txTimeTolerance").value = RISK_TOLERANCE_SCORE;
            document.getElementById("txtStatus").value = STATUS;



        }
        function OnInvestorDelete(IDX) {

            var ajax_data = {

                IDX: IDX

            };

            $.ajax({
                url: "api/XBRL/GetDeleteInvestorStatus",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetInvestor();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateInvestor() {



            var ajax_data = {
                timeHorizonScore: $('#txtTimeHorizon').val(),
                RiskToleranceScore: $('#txTimeTolerance').val(),
                status: $('#txtStatus').val(),
                InvestorCode:InvestorCode
            };
            $.ajax({
                url: "api/XBRL/GetUpdateInvestorStatus",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetInvestor();
                    $('#btnUpdQuestionType').hide();
                    $('#btnAddQuestionType').show();
                    document.getElementById("txtTimeHorizon").value = '';
                    document.getElementById("txTimeTolerance").value = '';
                    document.getElementById("txtStatus").value = '';
                   

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Risk Tolerance Definition</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-4">
                    <label class="control-label">Time Horizon Sore:</label>
                    <input type="text" placeholder="Please Enter Time Horizon" id="txtTimeHorizon" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <label class="control-label">Risk Tolerance Score:</label>
                    <input type="text" placeholder="Please Enter Time Tolerannce" id="txTimeTolerance" class="form-control" />
                </div>
                <div class="col-sm-4">
                    <label class="control-label">Risk Tolerance Definition:</label>
                    <input type="text" placeholder="Please Enter Status" id="txtStatus" class="form-control" />
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddQuestionType" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdQuestionType" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblInvestor" class="display" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Investor Status Code</th>
                                <th>Time Horizon Sore </th>
                                <th>Risk Tolerance Score</th>
                                <th>Status</th>
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
