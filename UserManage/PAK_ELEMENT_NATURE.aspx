<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PAK_ELEMENT_NATURE.aspx.cs" Inherits="Portfolio.PAK_ELEMENT_NATURE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ElementNature Setup</title>
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
           
            GetElementNature();
            $('#btnUpdElementNature').hide();

            $('#btnAddElementNature').click(function () {
                AddElementNature();

            });
            $('#btnUpdElementNature').click(function () {
                UpdateElementNature();
            });


        });


        function AddElementNature() {
            if ($('#ddlElementMasterSheet option:selected').text() == "Select Element Nature") {
                alert('Please Select Element Nature ');

            }
            else {


                var ajax_data = {
                    elementName: $('#ddlElementMasterSheet option:selected').text(),
                    elementNatureName: $('#txtElementNatureName').val(),
                    GenericElement: $('#txtGenericElement').val()



                };
                $.ajax({
                    url: "api/XBRL/GetInsertElementNature",
                    type: 'GET',
                    dataType: 'json',
                    data: ajax_data,
                    success: function (data) {

                        alert('Add Successfully !');

                        document.getElementById("ddlElementMasterSheet").selectedIndex = 0;
                        document.getElementById("txtElementNatureName").value = '';
                        document.getElementById("txtGenericElement").value = '';

                        GetElementNature();
                    },
                    error: function (request) {
                        //notifyError('Data Load failed!');

                    }
                });
            }

        }
        function GetElementNature() {

            $.ajax({
                url: "api/XBRL/GetElementNature",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadElementNature(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadElementNature(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblElementNature')) {
                tblQuestType = $('#tblElementNature').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblElementNature').DataTable({
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

                    { "data": "ELEMENT_NATURE"},
                    { "data": "ELEMENT_NAME"},
                    { "data": "GENERIC_ELEMENT_NAME" },



                    //{
                    //    "date": "ELEMENT_NATURE",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Edit"  stylOnElementNatureeEdite="height: 31px;font-size: 12px;"    onclick="OnElementNatureeEdit(\'' + full["ELEMENT_NATURE"] + '\',\'' + full["ELEMENT_NAME"] + '\',\'' + full["GENERIC_ELEMENT_NAME"] + '\')"></input>';


                    //    }                    },

                    {
                        "date": "ELEMENT_NATURE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnElementNatureDelete(\'' + full["ELEMENT_NATURE"] + '\',\'' + full["ELEMENT_NAME"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var ElementNatureCode;
        function OnElementNatureeEdit(ELEMENT_NATURE, ELEMENT_NAME, GENERIC_ELEMENT_NAME) {
         $("#ddlElementMasterSheet").prop("disabled", "disabled");
            debugger
            ElementNatureCode = ELEMENT_NATURE;
            $('#btnAddElementNature').hide();
            $('#btnUpdElementNature').show();
            $('#ddlElementMasterSheet option:selected').text(ELEMENT_NATURE);
           
            document.getElementById("txtElementNatureName").value = ELEMENT_NAME;
            document.getElementById("txtGenericElement").value = GENERIC_ELEMENT_NAME;
            

        }
        function OnElementNatureDelete(ELEMENT_NATURE,ELEMENT_NAME) {

            var ajax_data = {

                ElementNature_CODE: ELEMENT_NATURE,
                elementname:ELEMENT_NAME

            };

            $.ajax({
                url: "api/XBRL/GetDeleteElementNature",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetElementNature();
                     $("#txtElementNature").removeAttr("disabled"); 
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateElementNature() {



            var ajax_data = {
                elementName:  $('#ddlElementMasterSheet option:selected').text(),
                elementNatureName: $('#txtElementNatureName').val(),
                GenericElement: $('#txtGenericElement').val()
            };
            $.ajax({
                url: "api/XBRL/GetUpdateElementNature",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetElementNature();
                    $('#btnAddElementNature').show();
                    $('#btnUpdElementNature').hide();
                     $("#ddlElementMasterSheet").removeAttr("disabled"); 
                    document.getElementById("ddlElementMasterSheet").selectedIndex = 0;
                    document.getElementById("txtElementNatureName").value = '';
                    document.getElementById("txtGenericElement").value = '';

                    
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
                <h1 style="text-align: center;margin-top: -28px;">Elements Database</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Mapping Nature:</label>
                     <select id="ddlElementMasterSheet" class="form-control">

                        <option>Select Element Nature</option>
                      <option>IS</option>
                        <option>CF</option>
                        <option>NCA</option>
                        <option>NCL</option>
                        <option>NA</option>
                        <option>EQ</option>
                        <option>CL</option>
                        <option>OCI</option>
                        <option>A</option>
                        <option>L</option>
                    </select>
                   
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Element Name :</label>
                    <input type="text" placeholder="Please Enter Element Name" id="txtElementNatureName" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Generic Element Name:</label>
                    <input type="text" placeholder="Please Enter Generic Element" id="txtGenericElement" class="form-control" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddElementNature" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdElementNature" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblElementNature" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Element Nature</th>
                                <th>Element Name</th>
                                <th>Generic Element Name</th>

                                <th></th>
                                <%--<th></th>--%>
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

