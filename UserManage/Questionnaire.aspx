<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Questionnaire.aspx.cs" Inherits="Portfolio.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">
    <title>Questionnaire</title>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- uikit -->
    <link rel="stylesheet" href="bower_components/uikit/css/uikit.almost-flat.min.css" media="all">

    <!-- flag icons -->
    <link rel="stylesheet" href="assets/icons/flags/flags.min.css" media="all">

    <!-- style switcher -->
    <link rel="stylesheet" href="assets/css/style_switcher.min.css" media="all">

    <!-- altair admin -->
    <link rel="stylesheet" href="assets/css/main.min.css" media="all">

    <!-- themes -->
    <link rel="stylesheet" href="assets/css/themes/themes_combined.min.css" media="all">
    <script src="Javascript/GraphJs.js"></script>
<%--    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#RiskHeading').hide();
            $('#TotalRiskHead').hide();

            var ansseq, seq = 0;
            var totalHorizon, TotalRisk;

            GetHorizonQuestions();
            GetQuestions();

            //GetQuestions();

            $('#exampleModalLong').on('shown.bs.modal', function () {
              alert()
            })

            $('#btnResult').click(function () {
                var HorizontotalPoints = 0;

                $('#btnSubmit').show();
                //var obj = {}; 

                $('input[name=HorizonAnsChecKbox]').each(function () {

                    if ($(this).is(':checked')) {

                        HorizontotalPoints += Number($(this).val());
                        totalHorizon = HorizontotalPoints;
                    }


                });




                if (Number(HorizontotalPoints) < 3) {
                    alert('If your Time Horizon Score is less than 3, stop here. If your score is 3 or more, please continue to Risk Tolerance.');
                    $('#btnSubmit').hide();


                }
                else {

                    $('#RiskHeading').show();
                    $('#HorizonHeading').hide();
                    $('#TotalRiskHead').show();
                    $('#TotalHorizonHead').hide();
                    $('#page_content_inner_Horizon').hide();
                    $('#page_content_inner').show();

                    $('#btnResult').hide();
                    $('#btnPrevious').show();


                }

                document.getElementById("HorizonTotal").innerHTML = totalHorizon;


            });



            $('#btnSubmit').click(function () {

                var RiskTotalPoints = 0;


                if (RiskTotalPoints == '0') {
                    $('input[name=AnsChecKbox]').each(function () {

                        if ($(this).is(':checked')) {

                            RiskTotalPoints += Number($(this).val());
                            TotalRisk = RiskTotalPoints;
                        }


                    });
                    document.getElementById("RiskTotal").innerHTML = TotalRisk;
                }

                var ajax_data = {
                    totalHorizon: totalHorizon,
                    TotalRisk: TotalRisk
                };

                $.ajax({
                    url: "api/XBRL/GetInvestorStatusResult",
                    data: ajax_data,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {

                        if (data.length > 0) {
                            InestorStatus = data[0].STATUS;

                            var totalScore = totalHorizon + TotalRisk;
                            $('#ResultTable').empty();
                            $('#ResultTable').append('<thead><tr><th>Time Horizon Score</th><th>Risk Tolerance Score</th><th>Total Score</th><th>Risk Tolerence Result</th></tr></tbody>');
                            $('#ResultTable').append('<tbody><tr><td>' + totalHorizon + '</td><td>' + TotalRisk + '</td><td>' + totalScore + '</td><td>' + InestorStatus + '</td></tr></tbody>');

                            BindAssetChart(totalScore, InestorStatus);



                        }
                    },
                    error: function (request) {
                        //notifyError('Saving User Detail failed!');
                    }
                });


            });
            $('#btnPrevious').click(function () {

                $('#page_content_inner_Horizon').show();
                $('#page_content_inner').hide();
                $('#btnSubmit').hide();
                $('#TotalHorizonHead').show();
                $('#HorizonHeading').show();
                $('#btnResult').show();
                $('#btnPrevious').hide();
                $('#TotalRiskHead').hide();
                $('#RiskHeading').hide();


            });
            //$(document).on("change", "input[name='AnsChecKbox']", function () {

            //    var AnsSeqChk = $(this).data('section_list');

            //    alert(AnsSeqChk);
            //    if (AnsSeqChk == seq) {
            //        $('input[name=AnsChecKbox]').not(this).prop('checked', false);
            //    }
            //    else {
            //        $('input[name=AnsChecKbox]').not(this).prop('checked', true);
            //    }

            //});
        });





        function GetAnsersData(questionCode, seq) {




            var ajax_data = {
                questionCode: questionCode
            };

            $.ajax({
                url: "api/XBRL/GetAnswer",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {


                    if (data.length > 0) {
                        $.each(data, function (i, value) {
                            var points = data[i].POINTS;
                            ansseq = i;
                            answer = value.ANSWER;
                            $('#ansAppend' + seq).append('<p><input type="checkbox"  data-section_list="' + seq + '" class="checkbocStyle" name="AnsChecKbox"  value=' + points + ' id="chk"  /><span class="AnsStyle">' + answer + '</span><span class="PointsStyle">' + points + '</span> </p>');


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

                    if (data.length > 0) {
                        var pattern, nodes = $();
                        $.each(data, function (i, value) {
                            var question = value.QUESTIONS;
                            var questionCode = value.QUESTION_CODE;
                            seq = i + 1;
                            //var MainGrid = '<div class="row"> <div class="col-sm-4"><div id="TestGrid" style="display: -webkit-box;" ><div  class="thumbnail card"> <div class="img-event">'+seq+'<h4>' + question + '</h4></div><div class="caption card-body"><div id="anslabel' + i + '"></div></div></div></div></div></div>';
                            var QuestionSection = '<div class="uk-grid uk-grid-medium uk-grid-width-small-1-2 uk-grid-width-medium-1-3 uk-grid-width-large-1-4 grid_view" id="list_grid"><div class="uk-margin-medium-top" style"width: 360px;"><div class="md-card"><div id="QuestionAppend" class="md-card-head uk-text-center uk-position-relative"><h4 class="heading_c uk-margin-bottom"><span class="sqlbl">' + seq + ':' + '</span><span class="Questlbl">' + question + '</span></h4></div><div id="ansAppend' + i + '" class="md-card-content"></div></div></div></div>';
                            if (i % 5 == 0) {
                                $('#page_content_inner').append('<div class="col-sm-4">' + QuestionSection + '</div>');
                            }
                            else {
                                $('#page_content_inner').append('<div class="col-sm-4">' + QuestionSection + '</div>');
                            }



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
        function GetHorizonQuestions() {

            $.ajax({
                url: "api/XBRL/GetHoriozQuest",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    if (data.length > 0) {

                        $.each(data, function (i, value) {
                            var Horizonquestion = value.QUESTIONS;
                            var HorizonquestionCode = value.QUESTION_CODE;
                            seq = i + 1;
                            //var MainGrid = '<div class="row"> <div class="col-sm-4"><div id="TestGrid" style="display: -webkit-box;" ><div  class="thumbnail card"> <div class="img-event">'+seq+'<h4>' + question + '</h4></div><div class="caption card-body"><div id="anslabel' + i + '"></div></div></div></div></div></div>';
                            var HorizonQuestionSection = '<div class="uk-grid uk-grid-medium uk-grid-width-small-1-2 uk-grid-width-medium-1-3 uk-grid-width-large-1-4 grid_view" id="list_grid"><div class="uk-margin-medium-top" style"width: 360px;"><div class="md-card"><div id="QuestionAppend" class="md-card-head uk-text-center uk-position-relative"><h4 class="heading_c uk-margin-bottom"><span class="sqlbl">' + seq + ':' + '</span><span class="Questlbl">' + Horizonquestion + '</span></h4></div><div id="ansAppendHorizon' + i + '" class="md-card-content"></div></div></div></div>';
                            if (i % 5 == 0) {
                                $('#page_content_inner_Horizon').append('<div class="col-sm-4">' + HorizonQuestionSection + '</div>');
                            }
                            else {
                                $('#page_content_inner_Horizon').append('<div class="col-sm-4">' + HorizonQuestionSection + '</div>');
                            }



                            GetHorizonAnsersData(HorizonquestionCode, i);


                            //pattern = createHotelPattern([i], value.QUESTIONS, value.QUESTION_CODE);




                        });


                    }
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function GetHorizonAnsersData(questionCode, seq) {




            var ajax_data = {
                questionCode: questionCode
            };

            $.ajax({
                url: "api/XBRL/GetAnswer",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {


                    if (data.length > 0) {
                        $.each(data, function (i, value) {
                            var Horizonpoints = data[i].POINTS;
                            ansseq = i;
                            Horizonanswer = value.ANSWER;
                            $('#ansAppendHorizon' + seq).append('<p><input type="checkbox"  data-section_list="' + seq + '" class="checkbocStyle" name="HorizonAnsChecKbox"  value=' + Horizonpoints + ' id="chk"  /><span class="AnsStyle">' + Horizonanswer + '</span><span class="PointsStyle">' + Horizonpoints + '</span> </p>');


                        });

                    }
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }



            });


        }


        function BindAssetChart(totalScore, InestorStatus) {


            var ajax_data = {
                totalScore: totalScore,
                InestorStatus: InestorStatus

            };
            $.ajax({
                url: "api/XBRL/GetAssetChart",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    //var AssetPercentage = [];
                    //var Asset = [];
                    var chartPoints = [];

                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            //var RowPercentage = data[i].ASSET_PERCENTAGE;
                            // var Asset = data[i].ASSET_DESC;
                            //AssetPercentage.push(RowPercentage);
                            //Asset.push(Asset);
                            chartPoints.push({ y: data[i].ASSET_PERCENTAGE, label: data[i].ASSET_DESC });
                        }
                        console.log(chartPoints);



                        var chart = new CanvasJS.Chart("chartContainer", {
                            animationEnabled: true,
                            title: {
                                text: "Asset Chart"
                            },
                            data: [{
                                type: "pie",
                                startAngle: 240,
                                yValueFormatString: "##0\"%\"",
                                indexLabel: "{label} {y}",
                                dataPoints: chartPoints
                            }]
                        });
                        chart.render();
                    }


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');
                }
            });
        }

    </script>
    <style type="text/css">
        .sqlbl {
            font-size: 17px;
            font-weight: bold;
            float: left;
            color: black;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
            display: inline-block;
            margin-left: 15px;
        }

        
        .checkbocStyle {
            width: 1.2em;
            height: 1.2em;
        }

        .PointsStyle {
            font-size: 17px;
            float: right;
        }



        .Questlbl {
            font-size: 17px;
            font-weight: bold;
            /* float: left; */
            color: black;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
            /* display: inline-block; */
            /* margin-left: -51px; */
            margin-top: 5px;
            text-align: center;
        }

        .AnsStyle {
            font-size: 17px;
            margin-left: 10px;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
        }

        .MainHeading {
            font-size: 34px;
            font-weight: bold;
            /* float: left; */
            color: #53b789;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
            display: block;
            /* margin-left: -51px; */
            margin-top: -38px;
            text-align: center;
        }

        .NoteHeading {
            font-size: 19px;
            font-weight: bold;
            /* float: left; */
            color: #53b789;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
            display: block;
            margin-left: 10px;
        }

        .TotalHeading {
            font-size: 19px;
            font-weight: bold;
            float: right;
            color: #53b789;
            text-decoration: none;
            font-family: "Times New Roman", Times, serif;
            display: block;
            margin-right: 133px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="row" id="HorizonHeading">
            <div class="col-sm-12">
                <label class="MainHeading">TIME HORIZON</label>
            </div>
        </div>
        <div class="row" id="RiskHeading">
            <div class="col-sm-12">
                <label class="MainHeading">RISK TOLERANCE</label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="NoteHeading">Note:Check the number of points for each of your answers</label>
                </div>
                <div class="col-sm-6" id="TotalHorizonHead">
                    <label class="TotalHeading">Total Horizon Score: <span id="HorizonTotal"></span></label>
                </div>
                <div class="col-sm-6" id="TotalRiskHead">
                    <label class="TotalHeading">Total Risk Tolerance: <span id="RiskTotal"></span></label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="page_content_inner_Horizon">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="page_content_inner" style="display: none">
                </div>
            </div>
        </div>
        <br />


        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4">
                    <input type="button" class="btn btn-success" id="btnResult" onclick="javascript: return false;" value="Next" />
                    <input type="button" class="btn btn-success" style="display: none" id="btnPrevious" onclick="javascript: return false;" value="Previous" />
                    <input type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalLong" style="display: none" id="btnSubmit" onclick="javascript: return false;" value="Submit" />
                </div>
                <div class="col-sm-4">
                </div>

            </div>
        </div>

        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 121%;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Investor Risk Tolerence Result</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="md-card uk-margin-medium-bottom">
                            <div class="md-card-content">
                                <div class="uk-overflow-container">
                                    <table class="uk-table uk-table-hover" id="ResultTable">
                                        <thead>
                                            <tr>
                                                <th>Time Horizon Score</th>
                                                <th>Risk Tolerance Score</th>
                                                <th>Total Score</th>
                                                <th>Customer Risk Tolerence Result </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>

                                
                                        <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                                   
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- common functions -->
        <script src="assets/js/common.min.js"></script>
        <!-- uikit functions -->
        <script src="assets/js/uikit_custom.min.js"></script>
        <!-- altair common functions/helpers -->
        <script src="assets/js/altair_admin_common.min.js"></script>

        <!-- page specific plugins -->

        <!--  list/grid toggle -->
        <script src="assets/js/pages/components_list_grid_view.min.js"></script>
    </form>
</body>
</html>
