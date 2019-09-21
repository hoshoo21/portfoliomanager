<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionPaper.aspx.cs" Inherits="Portfolio.QuestionPaper" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Question Paper</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="bootstrap/css/QuestipnPaper.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            debugger
            var ansseq,seq=0;



            GetQuestions();
            //$('input[type="checkbox"]').on('change', function () {
            //    $('input[type="checkbox"]').not(this).prop('checked', false);
            //});
            $(document).on('click', 'input[id="chk' + seq + '"]', function () {
                debugger

                var checkedValue = $('#chk' + seq + ':checked').val();
                alert(checkedValue)

                $('input[id="chk'+seq+'"]').not(this).prop('checked', false);
            });
        });

        function GetAnsersData(questionCode, seq) {
            debugger



            var ajax_data = {
                questionCode: questionCode
            };

            $.ajax({
                url: "api/XBRL/GetAnswer",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    console.log(data)
                    if (data.length > 0) {
                        $.each(data, function (i, value) {
                            debugger
                            ansseq = i;
                            answer = value.ANSWER;
                            $('#anslabel' + seq).append('<div class="row"><p class="group inner list-group-item-text"><input type="checkbox" id="chk'+seq+'" value="" />'+seq+'<h4>' + answer + '<h4/></p></div>');


                        });

                    }
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }



            });


        }



        function GetQuestions() {
            
            $.ajax({
                url: "api/XBRL/GetQuestions",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data)
                    if (data.length > 0) {
                        var pattern, nodes = $();
                        $.each(data, function (i, value) {
                            var question = value.QUESTIONS;
                            var questionCode = value.QUESTION_CODE;
                            seq =i+1;
                            var MainGrid = '<div class="row"> <div class="col-sm-4"><div id="TestGrid" style="display: -webkit-box;" ><div  class="thumbnail card"> <div class="img-event">'+seq+'<h4>' + question + '</h4></div><div class="caption card-body"><div id="anslabel' + i + '"></div></div></div></div></div></div>';


                            $('#TestGrid').append(MainGrid);
                            GetAnsersData(questionCode, i);


                            //pattern = createHotelPattern([i], value.QUESTIONS, value.QUESTION_CODE);




                        });


                    }
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-flud">
            <div class="row">
                <div class="col-sm-12">
                    <div id="TestGrid" style="display: -webkit-box;">
                    </div>
                </div>
            </div>

            <br />
            <%--   <div id="products" class="row view-group">--%>
            <%--    <div id="TestGrid" class="item col-xs-4 col-lg-4">
                <div class="thumbnail card">
                    <div class="img-event">
                        <h4>What is your  Name </h4>
                    </div>
                    <div class="caption card-body">

                        <p class="group inner list-group-item-text">
                            <input type="checkbox" value="" />
                            Kashif
                        </p>
                        <p class="group inner list-group-item-text">
                            <input type="checkbox" value="" />
                            Asif
                        </p>
                        <p class="group inner list-group-item-text">
                            <input type="checkbox" value="" />
                            Rahim
                        </p>
                        <p class="group inner list-group-item-text">
                            <input type="checkbox" value="" />
                            Ahmed
                        </p>
                    </div>
                </div>
            </div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </form>
</body>
</html>
