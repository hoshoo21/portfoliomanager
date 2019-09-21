<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssociationSetup.aspx.cs" Inherits="Portfolio.AssociationSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Association Setup</title>
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

            GetAssociation();
            $('#btnUpdAssociation').hide();

            $('#btnAddAssociation').click(function () {
                AddAssociation();

            });
            $('#btnUpdAssociation').click(function () {
                UpdateAssociation();
            });


        });


        function AddAssociation() {



            var ajax_data = {
                AssociationName: $('#txtAssociation').val(),
                StandardAssociation: $('#txtStandardAssociation').val(),
                EffectiveTodate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val()


            };
            $.ajax({
                url: "api/XBRL/GetInsertAssociation",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');

                    document.getElementById("txtAssociation").value = '';
                    document.getElementById("txtStandardAssociation").value = '';
                    document.getElementById("txtEffToDate").value = '';
                    document.getElementById("txtEffEndDate").value = '';
                    GetAssociation();
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function GetAssociation() {

            $.ajax({
                url: "api/XBRL/GetAssociation",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadAssociation(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadAssociation(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblAssociation')) {
                tblQuestType = $('#tblAssociation').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblAssociation').DataTable({
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

                    { "data": "ASSOCIATION_CODE" },
                    { "data": "ASSOCIATION_NAME" },

                    { "data": "STANDARD_ASSOCIATION" },
                    { "data": "EFFECTIVE_START_DATE" },
                    { "data": "EFFECTIVE_END_DATE" },


                    {
                        "date": "ASSOCIATION_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnAssociationeEdit(\'' + full["ASSOCIATION_CODE"] + '\',\'' + full["ASSOCIATION_NAME"] + '\',\'' + full["STANDARD_ASSOCIATION"] + '\',\'' + full["EFFECTIVE_START_DATE"] + '\',\'' + full["EFFECTIVE_END_DATE"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "ASSOCIATION_CODE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnAssociationDelete(\'' + full["ASSOCIATION_CODE"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var AssociationCode;
        function OnAssociationeEdit(ASSOCIATION_CODE, ASSOCIATION_NAME, STANDARD_ASSOCIATION, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE) {

            AssociationCode = ASSOCIATION_CODE;
            $('#btnAddAssociation').hide();
            $('#btnUpdAssociation').show();
            document.getElementById("txtAssociation").value = ASSOCIATION_NAME;
            document.getElementById("txtStandardAssociation").value = STANDARD_ASSOCIATION;
            document.getElementById("txtEffToDate").value = EFFECTIVE_START_DATE;
            document.getElementById("txtEffEndDate").value = EFFECTIVE_END_DATE;

        }
        function OnAssociationDelete(ASSOCIATION_CODE) {

            var ajax_data = {

                ASSOCIATION_CODE: ASSOCIATION_CODE

            };

            $.ajax({
                url: "api/XBRL/GetDeleteAssociation",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetAssociation();

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateAssociation() {



            var ajax_data = {
                AssociationName: $('#txtAssociation').val(),
                StandardAssociation: $('#txtStandardAssociation').val(),
                EffectiveTodate: $('#txtEffToDate').val(),
                EffectiveEnddate: $('#txtEffEndDate').val(),
                AssociationCode:AssociationCode
            };
            $.ajax({
                url: "api/XBRL/GetUpdateAssociation",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetAssociation();
                    $('#btnAddAssociation').show();
                    $('#btnUpdAssociation').hide();


                   document.getElementById("txtAssociation").value = '';
                    document.getElementById("txtStandardAssociation").value = '';
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
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center">Association</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Association Name :</label>
                    <input type="text" placeholder="Please Enter Association Name" id="txtAssociation" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Standard Association :</label>
                    <input type="text" placeholder="Please Enter Standard Association" id="txtStandardAssociation" class="form-control" />
                </div>
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
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddAssociation" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdAssociation" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblAssociation" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Association  Code </th>
                                <th>Association Name</th>
                                <th>Standard  Association</th>
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

