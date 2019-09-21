<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetMapRiskTolerence.aspx.cs" Inherits="Portfolio.AssetMapRiskTolerence" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asset Map Risk Toloerence </title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            GetAsset();
            GeRiskTolerence();
            GetAssetMapRiskTol();
            $('#btnUpdAssetMapRiskTol').hide();
            $('#btnAddAssetMapRiskTol').click(function () {
                AddAssetMapRiskTol();
            });
            $('#btnUpdAssetMapRiskTol').click(function () {
                UpdateAssetMapRiskTol();
            });

        });

        function GeRiskTolerence() {
            $.ajax({
                url: "api/XBRL/GetRiskTolerence",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#ddlRiskTolerence').empty();
                    $('#ddlRiskTolerence').append($('<option>').text("Select Risk Tolerence"));

                    $.each(data, function (i, value) {
                        $('#ddlRiskTolerence').append($('<option>').text(value.STATUS).attr('value', value.STATUS));

                    });




                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function GetAsset() {
            $.ajax({
                url: "api/XBRL/GetAsset",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#ddlAsset').empty();
                    $('#ddlAsset').append($('<option>').text("Select Asset"));

                    $.each(data, function (i, value) {
                        $('#ddlAsset').append($('<option>').text(value.ASSET_DESC).attr('value', value.ASSET_IDX));

                    });




                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }


        function AddAssetMapRiskTol() {


            var ajax_data = {
                riskTol: $('#ddlRiskTolerence option:selected').val(),
                Asset: $('#ddlAsset option:selected').val(),
                ScoreFrom: $('#txtScoreFrom').val(),
                ScoreTo: $('#txtScoreTo').val(),
                AssetPer: $('#txtAssetPer').val()

            };
            $.ajax({
                url: "api/XBRL/GetInsertAssetMapRisk",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    GetAssetMapRiskTol();
                    document.getElementById("txtScoreFrom").value = '';
                    document.getElementById("txtScoreTo").value = '';
                    document.getElementById("txtAssetPer").value = '';
                    document.getElementById("ddlAsset").selectedIndex = 0;
                    document.getElementById("ddlRiskTolerence").selectedIndex = 0;

                },
                error: function (reAssetMapRiskTol) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function GetAssetMapRiskTol() {

            $.ajax({
                url: "api/XBRL/GetAssetMapRisk",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadAssetMapRiskTol(data);

                },
                error: function (reAssetMapRiskTol) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function LoadAssetMapRiskTol(data) {
            var tblQues;

            if ($.fn.dataTable.isDataTable('#tblAssetMapRiskTol')) {
                tblQues = $('#tblAssetMapRiskTol').DataTable().clear().destroy();
            }
            tblQues = $('#tblAssetMapRiskTol').DataTable({
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
                    { "data": "RISK_TOLERENCE_DEF" },
                    { "data": "ASSET_DESC" },

                    { "data": "SCORE_FROM" },
                    { "data": "SCORE_TO" },
                    { "data": "ASSET_PERCENTAGE" },



                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnAssetMapRiskTolEdit(\'' + full["IDX"] + '\',\'' + full["RISK_TOLERENCE_DEF"] + '\',\'' + full["ASSET_IDX"] + '\',\'' + full["SCORE_FROM"] + '\',\'' + full["SCORE_TO"] + '\',\'' + full["ASSET_PERCENTAGE"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnAssetMapRiskTolDelete(\'' + full["IDX"] + '\')"></input>';

                        }
                    },




                ],

            });


        }

        var AssetMapRiskTolCode;
        function OnAssetMapRiskTolEdit(IDX, RISK_TOLERENCE_DEF, ASSET_IDX, SCORE_FROM,
            SCORE_TO, ASSET_PERCENTAGE) {

            debugger
            AssetMapRiskTolCode = IDX;
            $('#btnAddAssetMapRiskTol').hide();
            $('#btnUpdAssetMapRiskTol').show();
            document.getElementById("txtScoreFrom").value = SCORE_FROM;
            document.getElementById("txtScoreTo").value = SCORE_TO;
            document.getElementById("txtAssetPer").value = ASSET_PERCENTAGE;
          
            $("#ddlRiskTolerence").val(RISK_TOLERENCE_DEF).trigger('change');
             $("#ddlAsset").val(ASSET_IDX).trigger('change');

        }
        function OnAssetMapRiskTolDelete(IDX) {

            var ajax_data = {

                IDX: IDX

            };

            $.ajax({
                url: "api/XBRL/GetDeleteAssetMapRisk",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetAssetMapRiskTol();

                },
                error: function (reAssetMapRiskTol) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateAssetMapRiskTol() {

            var ajax_data = {
                riskTol: $('#ddlRiskTolerence option:selected').val(),
                Asset: $('#ddlAsset option:selected').val(),
                ScoreFrom: $('#txtScoreFrom').val(),
                ScoreTo: $('#txtScoreTo').val(),
                AssetPer: $('#txtAssetPer').val(),
                AssetMapRiskTolCode: AssetMapRiskTolCode


            };
            $.ajax({
                url: "api/XBRL/GetUpdateAssetMapRisk",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    $('#btnAddAssetMapRiskTol').show();
                    $('#btnUpdAssetMapRiskTol').hide();
                    GetAssetMapRiskTol();
                    document.getElementById("txtScoreFrom").value = '';
                    document.getElementById("txtScoreTo").value = '';
                    document.getElementById("txtAssetPer").value = '';
                    document.getElementById("ddlAsset").selectedIndex = 0;
                    document.getElementById("ddlRiskTolerence").selectedIndex = 0;


                },
                error: function (reAssetMapRiskTol) {
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
                <h1 style="text-align: center">Asset Map Risk Tolerance</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Risk Tolerence:</label>
                    <select id="ddlRiskTolerence" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Asset:</label>
                    <select id="ddlAsset" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Score From:</label>
                    <input type="text" class="form-control" placeholder="Please Enter Score Form" id="txtScoreFrom" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Score To:</label>
                    <input type="text" placeholder="Please Enter Score To" id="txtScoreTo" class="form-control" />
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Asset Percentage:</label>
                    <input type="text" placeholder="Please Enter Asset %" id="txtAssetPer" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddAssetMapRiskTol" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdAssetMapRiskTol" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblAssetMapRiskTol" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Code </th>
                                <th>Risk Tolerence </th>
                                <th>Asset </th>
                                <th>Score From</th>
                                <th>Score To </th>
                                <th>Asset %</th>
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
