<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnswerSetup.aspx.cs" Inherits="Portfolio.AnswerSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Answer Setup</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            GetQuestion();
            GetAnsn();
            $('#btnUpdAns').hide();
            $('#btnAddAns').click(function () {
                AddAns();
            });
            $('#btnUpdAns').click(function () {
                UpdateAns();
            });


        });
        function GetQuestion() {

            $.ajax({
                url: "api/XBRL/GetQuestionDesc",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    $('#ddlQuestion').empty();

                    $('#ddlQuestion').append($('<option>').text("Select Question"));


                    $.each(data, function (i, value) {
                        $('#ddlQuestion').append($('<option>').text(value.QUESTIONS).attr('value', value.QUESTION_CODE));

                    });

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function AddAns() {

            var Ques = document.getElementById("ddlQuestion");

            var Quesal = Ques.options[Ques.selectedIndex].value;


            var ajax_data = {
                ans: $('#txtAns').val(),
                points: $('#txtPoints').val(),
                Quesal: Quesal
            };
            $.ajax({
                url: "api/XBRL/GetInsertAns",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    GetAnsn();
                    document.getElementById("txtAns").value = '';
                    document.getElementById("txtPoints").value = '';
                    document.getElementById("ddlQuestion").selectedIndex = 0;
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function GetAnsn() {

            $.ajax({
                url: "api/XBRL/GetAnsDesc",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadAns(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function LoadAns(data) {
            var tblAns;

            if ($.fn.dataTable.isDataTable('#tblAns')) {
                tblAns = $('#tblAns').DataTable().clear().destroy();
            }
            tblAns = $('#tblAns').DataTable({
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
                    { "data": "QUESTIONS" },
                    { "data": "ANSWER" },
                    { "data": "POINTS" },



                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnAnsEdit(\'' + full["IDX"] + '\',\'' + full["QUESTION_CODE"] + '\',\'' + full["ANSWER"] + '\',\'' + full["POINTS"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnAnsDelete(\'' + full["IDX"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var AnsCode;
        function OnAnsEdit(IDX, QUESTION_CODE, ANSWER, POINTS) {

            AnsCode = IDX;
            $('#btnAddAns').hide();
            $('#btnUpdAns').show();
            document.getElementById("txtAns").value = ANSWER;

            document.getElementById("txtPoints").value = POINTS;
            document.getElementById("ddlQuestion").value = QUESTION_CODE;

        }
        function OnAnsDelete(IDX) {

            var ajax_data = {

                IDX: IDX

            };

            $.ajax({
                url: "api/XBRL/GetDeleteAns",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetAnsn();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateAns() {
            var Ques = document.getElementById("ddlQuestion");

            var QuesVal = Ques.options[Ques.selectedIndex].value;


            var ajax_data = {
                ans: $('#txtAns').val(),
                points: $('#txtPoints').val(),
                QuesVal: QuesVal,
                AnsCode: AnsCode


            };
            $.ajax({
                url: "api/XBRL/GetUpdateAns",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetAnsn();
                    $('#btnUpdAns').hide();
                    $('#btnAddAns').show();
                    document.getElementById("txtPoints").value = '';
                    document.getElementById("txtAns").value = '';
                    document.getElementById("ddlQuestion").selectedIndex = 0;
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
                <h1 style="text-align: center">Answer Setup</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="control-label">Question:</label>
                    <select id="ddlQuestion" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Answer:</label>
                    <input type="text" placeholder="Please Enter Question" id="txtAns" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Points:</label>
                    <input type="text" placeholder="Please Enter Points" id="txtPoints" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddAns" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdAns" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblAns" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th style="width: 97px;">Answer Code </th>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Points</th>
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
