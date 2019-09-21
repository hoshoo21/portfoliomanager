<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="Portfolio.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-themecolor">Dashboard</h3>
            </div>
            <div class="col-md-7 align-self-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-outline-success">
                        <div class="card-header">
                            <h4 id="heading" class="m-b-0 text-white">Premium Report</h4>
                        </div>
                        <div class="card-body">
                            <%--<div class="row p-t-20">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">From:</label>
                                        <input type="text" runat="server" class="form-control" placeholder="Please select From Date" id="txtFrom" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">To:</label>
                                        <input type="text" runat="server" class="form-control" placeholder="Please select To Date" id="txtTo" />
                                    </div>
                                </div>
                            </div>--%>

                            <div id="bar-chart" style="width: 100%; height: 400px;">
                            </div>

                            <div class="modal fade bs-example-modal-lg" id="ViewRegionWise" tabindex="-1" role="dialog" aria-labelledby="RegionWiselbl" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="RegionWiselbl">Branch Wise Projections</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <table id="tblRegion" class="display table table-hover table-striped table-bordered" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Branch</th>
                                                        <th>Projected</th>
                                                        <th>Achieved</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade bs-example-modal-lg" id="ViewDepartmentWise" tabindex="-1" role="dialog" aria-labelledby="DepartmentWiselbl" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="DepartmentWiselbl">Department Wise Projections</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <table id="tblDepartment" class="display table table-hover table-striped table-bordered" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Branch</th>
                                                        <th>Fire</th>
                                                        <th>Marine</th>
                                                        <th>Motor</th>
                                                        <th>Misc</th>
                                                        <th>Eng</th>
                                                        <th>Health</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var c_Type, from, to, chartType, tabType, reportName, contentName;

        $(document).ready(function () {
            /*$('#ContentPlaceHolder1_txtFrom').bootstrapMaterialDatePicker({
                weekStart: 0,
                time: false,
                format: 'DD-MMM-YYYY',
                currentDate: '01-JAN-2018'
            });

            $('#ContentPlaceHolder1_txtTo').bootstrapMaterialDatePicker({
                weekStart: 0,
                time: false,
                format: 'DD-MMM-YYYY',
                currentDate: new Date()
            });*/

            c_Type = localStorage.getItem("c_Type");
            from = localStorage.getItem("from");
            tabType = localStorage.getItem("tabType");
            to = localStorage.getItem("to");
            chartType = localStorage.getItem("chartType");
            reportName = localStorage.getItem("reportName");
            contentName = localStorage.getItem("contentName");

            $('#heading').html(contentName);
            if (chartType != "") {
                BindCharts()
            }

            /*GetPremiumBranchWise()*/
            //$('#bar-chart').children().children().css('font-family', "Poppins");
        });

        var localHostApiAddress = '<%= ConfigurationManager.AppSettings["LocalHostApi"].ToString() %>';

        function BindCharts() {

            var param = {
                c_Type: c_Type,
                tabType: tabType,
                to: to,
                chartType: chartType,
                reportName: reportName
            };

            $(".preloader").fadeIn();
            $.ajax({
                url: localHostApiAddress + '/api/DashBoard/BindCharts',
                type: 'GET',
                dataType: 'json',
                data: param,
                async: false,
                cache: false,
                success: function (data, textStatus, xhr) {
                    $(".preloader").fadeOut();
                    if (chartType == "BRANCH") {
                        Date.prototype.getWeekEndDate = function () {
                            diff = 6 - this.getDay();
                            if (diff < 0) {
                                diff += 6;
                            }
                            this.setDate(this.getDate() + (1 * diff));
                            return this;
                        }

                        var branches = [];
                        var current = [];
                        var previous = [];
                        for (var i = 0; i < data.length; i++) {

                            branches.push(data[i].BRANCHNAME);
                            current.push(Math.abs(data[i].CURRENTVALUE));
                            previous.push(Math.abs(data[i].PREVIOUSVALUE));
                        }

                        Highcharts.chart('bar-chart', {
                            chart: {
                                type: 'column',
                                style: {
                                    fontFamily: '\'Tahoma\''
                                }
                            },
                            colors: ["#55ce63", "#009efb"],
                            title: {
                                text: 'Branch Wise ' + from + ' to ' + to,
                                widthAdjust: -200,
                                style: {
                                    textTransform: 'uppercase',
                                    fontSize: '17px'
                                }
                            },
                            exporting: {
                                buttons: {
                                    customButton: {
                                        text: 'Details',
                                        onclick: function () {
                                            ViewBranchWiseDetail();
                                        }
                                    }
                                }
                            },
                            xAxis: {
                                categories: branches,
                                title: {
                                    text: null,
                                },
                                labels: {
                                    useHTML: true,
                                    style: {
                                        textTransform: 'uppercase',
                                    }
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Volume (millions)',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                formatter: function () {
                                    return ' <b>' + this.x + '</b><br/> Total: <b>' + numberWithCommas(this.y) + '</b>'
                                }
                            },

                            plotOptions: {
                                bar: {
                                    pointWidth: 10,
                                    pointPadding: 10,
                                    dataLabels: {
                                        enabled: true
                                    }
                                },
                                series: {
                                    cursor: 'pointer',
                                    point: {
                                        events: {
                                            click: function () {
                                                Reports.Extractor.Rpt_Extractor_Inline("Viewer", { 'RptName': reportName, 'DeptText': 'All', 'UserText': 'Select User', 'c_Type': c_Type, 'tabType': tabType, 'chartType': chartType, 'ToDate': to, 'FromDate': from, Dept: '', 'BranchName': '', 'BranchValue': '0' });
                                                //location.href = Reports.ReportGenerator() //'https://www.google.com/';
                                            }
                                        }
                                    }
                                }
                            },
                            legend: {
                                align: 'center',
                                verticalAlign: 'bottom',
                                x: 0,
                                y: 0,
                                useHTML: true,
                                title: {
                                    style: {
                                        textTransform: 'uppercase'
                                    }
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            series: [{
                                name: 'Current ',
                                data: current
                            }, {
                                name: 'Previous',
                                data: previous
                            }],
                            showInLegend: true
                        });
                    } else if (chartType == "DEPARTMENT") {
                        var department = [];
                        var current = [];
                        var previous = [];
                        for (var i = 0; i < data.length; i++) {

                            department.push(data[i].PDP_DEPTDESC);
                            current.push(Math.abs(data[i].CURRENTVALUE));
                            previous.push(Math.abs(data[i].PREVIOUSVALUE));
                        } 
                        

                        Highcharts.chart('bar-chart', {
                            chart: {
                                type: 'column',
                                style: {
                                    fontFamily: '\'Tahoma\''
                                }
                            },
                            colors: ["#7250A0", "#4E783B"],
                            title: {
                                text: 'Department Wise ' + from + ' to ' + to,
                                widthAdjust: -200,
                                style: {
                                    textTransform: 'uppercase',
                                    fontSize: '17px'
                                }
                            },
                            exporting: {
                                buttons: {
                                    customButton: {
                                        text: 'Details',
                                        onclick: function () {
                                            viewAllDeparemntWiseGrid();
                                        }
                                    }
                                }
                            },
                            xAxis: {
                                categories: department,
                                title: {
                                    text: null,
                                },
                                labels: {
                                    useHTML: true,
                                    style: {
                                        textTransform: 'uppercase',
                                    }
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Volume (millions)',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                formatter: function () {
                                    return ' <b>' + this.x + '</b><br/> Total: <b>' + numberWithCommas(this.y) + '</b>'
                                }
                            },

                            plotOptions: {
                                bar: {
                                    pointWidth: 10,
                                    pointPadding: 10,
                                    dataLabels: {
                                        enabled: true
                                    }
                                },
                                series: {
                                    cursor: 'pointer',
                                    point: {
                                        events: {
                                            click: function () {
                                                Reports.Extractor.Rpt_Extractor_Inline("Viewer", { 'RptName': reportName, 'DeptText': 'All', 'UserText': 'Select User', 'c_Type': c_Type, 'tabType': tabType, 'chartType': chartType, 'ToDate': to, 'FromDate': from, 'BranchName': 'Select Branch', 'BranchValue': '0' });
                                            }
                                        }
                                    }
                                }
                            },
                            legend: {
                                align: 'center',
                                verticalAlign: 'bottom',
                                x: 0,
                                y: 0,
                                useHTML: true,
                                title: {
                                    style: {
                                        textTransform: 'uppercase'
                                    }
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            series: [{
                                name: 'Current ',
                                data: current,
                            }, {
                                name: 'Previous',
                                data: previous
                            }],
                            showInLegend: true
                        });
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    $(".preloader").fadeOut();

                    console.log();

                    if (textStatus == 'error') {
                        $('#errormsg').html('Some Error Occured').fadeIn().delay(5000).fadeOut();
                    }
                }
            });

        }

        function ViewBranchWiseDetail() {
            from_date = $('#ContentPlaceHolder1_txtFrom').val();
            to_date = $('#ContentPlaceHolder1_txtTo').val();
            var ajax_data = {
                from: from,
                to: to
            };

            $(".preloader").fadeIn();
            $.ajax({
                url: localHostApiAddress + '/api/DashBoard/GetAARegionGridData',
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    $(".preloader").fadeOut();

                    for (var i = 0; i < data.length; i++) {
                        data[i].PROJ = numberWithCommas(data[i].PROJ);
                        data[i].PREM = data[i].PREM == null ? 0 : numberWithCommas(data[i].PREM);
                    }
                    if ($.fn.dataTable.isDataTable('#tblRegion')) {
                        uassignedtablevar = $('#tblRegion').DataTable().clear().destroy();
                    }
                    $('#tblRegion').DataTable({
                        /*responsive: {
                            details: {
                                display: $.fn.dataTable.Responsive.display.modal({
                                    header: function (row) {

                                        var data = row.data();

                                        return 'Comments Detail';
                                    }
                                }),
                                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                                    tableClass: 'table'
                                })
                            }
                        },*/
                        data: data,
                        "columns": [
                            { "data": "PLC_LOCADESC" },
                            { "data": "PROJ" },
                            { "data": "PREM" }
                        ]
                    });

                    $('#ViewRegionWise').modal('show');

                },
                error: function (request) {
                    $(".preloader").fadeOut();
                    console.log('failure');
                }
            });
        }

        function viewAllDeparemntWiseGrid() {
            var param = {
                from: from,
                to: to
            };

            $(".preloader").fadeIn();
            $.ajax({
                url: localHostApiAddress + '/api/DashBoard/GetAllDepartments',
                type: 'GET',
                dataType: 'json',
                data: param,
                success: function (data) {
                    $(".preloader").fadeOut();

                    for (var i = 0; i < data.length; i++) {
                        data[i].FIRE = numberWithCommas(data[i].FIRE);
                        data[i].MARINE = numberWithCommas(data[i].MARINE);
                        data[i].MOTOR = numberWithCommas(data[i].MOTOR);
                        data[i].MISC = numberWithCommas(data[i].MISC);
                        data[i].ENG = numberWithCommas(data[i].ENG);
                        data[i].HEALTH = numberWithCommas(data[i].HEALTH);
                    }
                    if ($.fn.dataTable.isDataTable('#tblDepartment')) {
                        uassignedtablevar = $('#tblDepartment').DataTable().clear().destroy();
                    }
                    $('#tblDepartment').DataTable({
                        /*responsive: {
                            details: {
                                display: $.fn.dataTable.Responsive.display.modal({
                                    header: function (row) {

                                        var data = row.data();

                                        return 'Comments Detail';
                                    }
                                }),
                                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                                    tableClass: 'table'
                                })
                            }
                        },*/
                        data: data,
                        "columns": [
                            { "data": "PLC_LOCADESC" },
                            { "data": "FIRE" },
                            { "data": "MARINE" },
                            { "data": "MOTOR" },
                            { "data": "MISC" },
                            { "data": "ENG" },
                            { "data": "HEALTH" }
                        ]
                    });

                    $('#ViewDepartmentWise').modal('show');

                },
                error: function (request) {
                    $(".preloader").fadeOut();
                    console.log('failure');
                }
            });
        }

        function numberWithCommas(x) {
            x = x.toString();
            var pattern = /(-?\d+)(\d{3})/;
            while (pattern.test(x))
                x = x.replace(pattern, "$1,$2");
            return x;
        }
        
    </script>
</asp:Content>
