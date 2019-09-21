<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionSetup.aspx.cs" Inherits="Portfolio.QuestionSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Question Setup</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            GetQuestionType();
            GetQuestion();
            $('#btnUpdQuest').hide();
            $('#btnAddQuest').click(function () {
                AddQuestion();
            });
            $('#btnUpdQuest').click(function () {
                UpdateQuestion();
            });

        });
        function GetQuestionType() {
            $.ajax({
                url: "api/XBRL/GetQuestionType",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    $('#ddlQuesType').empty();


                    $('#ddlQuesType').append($('<option>').text("Select Question Type"));

                    $.each(data, function (i, value) {
                        $('#ddlQuesType').append($('<option>').text(value.TYPE_DESC).attr('value', value.QUESTION_TYPE_CODE));

                    });





                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function AddQuestion() {

            var QuesType = document.getElementById("ddlQuesType");
            var QuesTypeText = QuesType.options[QuesType.selectedIndex].text;
            var QuesTypeVal = QuesType.options[QuesType.selectedIndex].value;

            if (QuesTypeText == 'Select Question Type') {
                QuesTypeVal = '';
            }
            else {
                QuesTypeVal = QuesTypeVal;
            }
            var ajax_data = {
                question: $('#txtQuestion').val(),
                QuestType: QuesTypeVal
            };
            $.ajax({
                url: "api/XBRL/GetInsertQuestion",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    GetQuestion();
                    document.getElementById("txtQuestion").value = '';
                    document.getElementById("ddlQuesType").selectedIndex = 0;
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function GetQuestion() {

            $.ajax({
                url: "api/XBRL/GetQuestionDesc",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadQuestion(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function LoadQuestion(data) {
            var tblQues;

            if ($.fn.dataTable.isDataTable('#tblQuestion')) {
                tblQues = $('#tblQuestion').DataTable().clear().destroy();
            }
            tblQues = $('#tblQuestion').DataTable({
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


                    { "data": "QUESTION_CODE" },
                    { "data": "QUESTIONS" },
                    { "data": "TYPE_DESC" },



                    {
                        "date": "QUESTION_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnQuestionEdit(\'' + full["QUESTION_CODE"] + '\',\'' + full["QUESTIONS"] + '\',\'' + full["QUESTION_TYPE_CODE"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "QUESTION_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnQuestionDelete(\'' + full["QUESTION_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }

        var questCode;
        function OnQuestionEdit(QUESTION_CODE, QUESTIONS, QUESTION_TYPE_CODE) {
           
            questCode = QUESTION_CODE;
            $('#btnAddQuest').hide();
            $('#btnUpdQuest').show();
            document.getElementById("txtQuestion").value = QUESTIONS;
          
         
            document.getElementById("ddlQuesType").value = QUESTION_TYPE_CODE;
             
        }
        function OnQuestionDelete(QUESTION_CODE) {

            var ajax_data = {

                QUESTION_CODE: QUESTION_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteQuestion",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetQuestion();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateQuestion() {
            var QuesType = document.getElementById("ddlQuesType");
            var QuesTypeText = QuesType.options[QuesType.selectedIndex].text;
            var QuesTypeVal = QuesType.options[QuesType.selectedIndex].value;

            if (QuesTypeText == 'Select Question Type') {
                QuesTypeVal = '';
            }
            else {
                QuesTypeVal = QuesTypeVal;
            }
            var ajax_data = {
                question: $('#txtQuestion').val(),
                QuestType: QuesTypeVal,
                questCode: questCode

            };
            $.ajax({
                url: "api/XBRL/GetUpdateQuestion",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetQuestion();
                    $('#btnUpdQuest').hide();
                    $('#btnAddQuest').show();
                    document.getElementById("txtQuestion").value = '';
                    document.getElementById("ddlQuesType").selectedIndex = 0;
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
                <h1 style="text-align: center">Question Setup</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="control-label">Question:</label>
                    <input type="text" placeholder="Please Enter Question" id="txtQuestion" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Question Type:</label>
                    <select id="ddlQuesType" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddQuest" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdQuest" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblQuestion" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Question Code </th>
                                <th>Question Desc</th>
                                <th>Question Type</th>
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
