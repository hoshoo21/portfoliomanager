<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionTypeSetup.aspx.cs" Inherits="Portfolio.QuestionTypeSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Question Type</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            GetQuestionType();
            $('#btnUpdQuestionType').hide();
            $('#btnAddQuestionType').click(function () {
                AddQuestionType();

            });
            $('#btnUpdQuestionType').click(function () {
                UpdateAns();
            });


        });
        function AddQuestionType() {



            var ajax_data = {
                QuestionType: $('#txtQuestionType').val()

            };
            $.ajax({
                url: "api/XBRL/GetInsertQuestionType",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');

                    document.getElementById("txtQuestionType").value = '';
                    GetQuestionType();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetQuestionType() {

            $.ajax({
                url: "api/XBRL/GetQuestionType",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadQuestType(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadQuestType(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblQuestionType')) {
                tblQuestType = $('#tblQuestionType').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblQuestionType').DataTable({
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

                    { "data": "QUESTION_TYPE_CODE" },
                    { "data": "TYPE_DESC" },




                    {
                        "date": "QUESTION_TYPE_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnQuestionTypeEdit(\'' + full["QUESTION_TYPE_CODE"] + '\',\'' + full["TYPE_DESC"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "QUESTION_TYPE_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnQuestionTypeDelete(\'' + full["QUESTION_TYPE_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var QuestTypeCode;
        function OnQuestionTypeEdit(QUESTION_TYPE_CODE, TYPE_DESC) {

            QuestTypeCode = QUESTION_TYPE_CODE;
            $('#btnAddQuestionType').hide();
            $('#btnUpdQuestionType').show();
            document.getElementById("txtQuestionType").value = TYPE_DESC;



        }
        function OnQuestionTypeDelete(QUESTION_TYPE_CODE) {

            var ajax_data = {

                QUESTION_TYPE_CODE: QUESTION_TYPE_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteQuestionType",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetQuestionType();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateAns() {



            var ajax_data = {
                Questype: $('#txtQuestionType').val(),
                QuestTypeCode: QuestTypeCode


            };
            $.ajax({
                url: "api/XBRL/GetUpdateQuestionType",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetQuestionType();
                    $('#btnUpdQuestionType').hide();
                    $('#btnAddQuestionType').show();

             
                    document.getElementById("txtQuestionType").value = '';
                   
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
                <h1 style="text-align: center">Question Type</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="control-label">Question Type:</label>
                    <input type="text" placeholder="Please Enter Question" id="txtQuestionType" class="form-control" />
                </div>
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
                    <table id="tblQuestionType" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th >Question Type Code </th>
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
