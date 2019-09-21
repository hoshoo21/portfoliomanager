<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PAK_ELEMENT_MASTERSHEET.aspx.cs" Inherits="Portfolio.PAK_ELEMENT_MASTERSHEET" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ElementMasterSheet Setup</title>
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
            GetGenericElementDropDown();

            GetElementMasterSheet();
            $('#btnUpdElementMasterSheet').hide();

            $('#btnAddElementMasterSheet').click(function () {
                AddElementMasterSheet();

            });
            $('#btnUpdElementMasterSheet').click(function () {
                UpdateElementMasterSheet();
            });


        });


        function AddElementMasterSheet() {
            var MappingNature, ElementGenericName, ParentName;
            if ($('#ddlMappingNature option:selected').text() == "Select Mapping Nature") {
                MappingNature = "";
            }
            else {
                MappingNature = $('#ddlMappingNature option:selected').text();

            }
            if ($('#ddlGenericElement option:selected').text() == "Select Element Name") {
                ElementGenericName = "";
            }
            else {
                ElementGenericName = $('#ddlGenericElement option:selected').text();

            }
            if ($('#ddlParentName option:selected').text() == "Select Parent Element") {
                ParentName = "";
            }
            else {
                ParentName = $('#ddlParentName option:selected').text();

            }
            if ($('#ddlElementMasterSheet option:selected').text() == "Select Element Nature") {
                alert('Please Select Element Nature ');

            }
            else {
                var ajax_data = {
                    elementName: $('#ddlElementMasterSheet option:selected').text(),
                    MappingNature: MappingNature,
                    ElementGenericName:ElementGenericName,
                    ParentName: ParentName
                };
                $.ajax({
                    url: "api/XBRL/GetInsertElementMasterSheet",
                    type: 'GET',
                    dataType: 'json',
                    data: ajax_data,
                    success: function (data) {

                        alert('Add Successfully !');



                        document.getElementById("ddlElementMasterSheet").selectedIndex = 0;
                        document.getElementById("ddlMappingNature").selectedIndex = 0;
                        document.getElementById("ddlGenericElement").selectedIndex = 0;
                        document.getElementById("ddlParentName").selectedIndex = 0;

                        GetElementMasterSheet();
                    },
                    error: function (request) {
                        //notifyError('Data Load failed!');

                    }
                });
            }

        }
        function GetElementMasterSheet() {

            $.ajax({
                url: "api/XBRL/GetElementMAsterSheet",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadElementMasterSheet(data);

                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }


        function LoadElementMasterSheet(data) {
            var tblQuestType;

            if ($.fn.dataTable.isDataTable('#tblElementMasterSheet')) {
                tblQuestType = $('#tblElementMasterSheet').DataTable().clear().destroy();
            }
            tblQuestType = $('#tblElementMasterSheet').DataTable({
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

                    { "data": "ELEMENT_NATURE" },

                    { "data": "MAPPING_NATURE" },
                    { "data": "ELEMENT_NAME" },
                    { "data": "PARENT_NAME" },



                    //{
                    //    "date": "ELEMENT_NATURE",

                    //    "mRender": function (data, type, full, meta) {

                    //        return ' <input type="button" class="btn btn-success" value="Edit"  stylOnElementMasterSheeteEdite="height: 31px;font-size: 12px;"    onclick="OnElementMasterSheeteEdit(\'' + full["ELEMENT_NATURE"] + '\',\'' + full["ELEMENT_NAME"] + '\',\'' + full["PARENT_NAME"] + '\',\'' + full["MAPPING_NATURE"] + '\')"></input>';


                    //    }
                    //},

                    {
                        "date": "ELEMENT_NATURE",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnElementMasterSheetDelete(\'' + full["ELEMENT_NATURE"] + '\',\'' + full["ELEMENT_NAME"] + '\')"></input>';

                        }
                    },




                ],

            });


        }
        var ElementMasterSheetCode;
        function OnElementMasterSheeteEdit(ELEMENT_NATURE, ELEMENT_NAME, PARENT_NAME, MAPPING_NATURE) {
           
            $("#ddlElementMasterSheet").prop("disabled", "disabled");

            ElementMasterSheetCode = ELEMENT_NATURE;
            $('#btnAddElementMasterSheet').hide();
            $('#btnUpdElementMasterSheet').show();

            $('#ddlElementMasterSheet option:selected').text(ELEMENT_NATURE);
            $('#ddlMappingNature option:selected').text(MAPPING_NATURE);

            $('#ddlGenericElement option:selected').text(ELEMENT_NAME);
            $('#ddlParentName option:selected').text(PARENT_NAME);



        }
        function OnElementMasterSheetDelete(ELEMENT_NATURE,ELEMENT_NAME) {

            var ajax_data = {

                ElementMasterSheet_CODE: ELEMENT_NATURE,
                elementname:ELEMENT_NAME

            };

            $.ajax({
                url: "api/XBRL/GetDeleteElementMasterSheet",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetElementMasterSheet();
                    $("#txtElementMasterSheet").removeAttr("disabled");
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateElementMasterSheet() {



            var ajax_data = {
                elementName: $('#ddlElementMasterSheet option:selected').text(),
                MappingNature: $('#ddlMappingNature option:selected').text(),
                ElementGenericName: $('#ddlGenericElement option:selected').text(),
                ParentName: $('#ddlParentName option:selected').text()
            };
            $.ajax({
                url: "api/XBRL/GetUpdateElementMasterSheet",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetElementMasterSheet();
                    $('#btnAddElementMasterSheet').show();
                    $('#btnUpdElementMasterSheet').hide();

                     $("#ddlElementMasterSheet").removeAttr("disabled"); 
                    document.getElementById("ddlElementMasterSheet").selectedIndex = 0;
                    document.getElementById("ddlMappingNature").selectedIndex = 0;
                    document.getElementById("ddlGenericElement").selectedIndex = 0;
                    document.getElementById("ddlParentName").selectedIndex = 0;
           

                    GetGenericElementDropDown();
                     
                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });
        }


        function GetGenericElementDropDown() {
            $.ajax({
                url: "api/XBRL/GetElementNature",
                data: {},
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    $('#ddlGenericElement').empty();
                    $('#ddlGenericElement').append($('<option>').text("Select Element Name"));
                    $('#ddlParentName').empty();
                    $('#ddlParentName').append($('<option>').text("Select Parent Element"));

                    $.each(data, function (i, value) {
                        $('#ddlGenericElement').append($('<option>').text(value.GENERIC_ELEMENT_NAME).attr('value', value.GENERIC_ELEMENT_NAME));
                        $('#ddlParentName').append($('<option>').text(value.GENERIC_ELEMENT_NAME).attr('value', value.GENERIC_ELEMENT_NAME));

                    });




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
        <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center; margin-top: -28px;">Element Master Sheet</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="control-label">Element Nature:</label>
                    <select id="ddlElementMasterSheet" class="form-control">

                        <option>Select Element Nature</option>
                        <option>BS</option>
                        <option>IS</option>
                        <option>CF</option>
                        <option>OCI</option>
                        <option>NA</option>
                    </select>
                    <%-- <input type="text" placeholder="Please Enter Element Nature" id="txtElementMasterSheet" class="form-control" />--%>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Mapping Nature:</label>
                    <select id="ddlMappingNature" class="form-control">

                        <option>Select Mapping Nature</option>
                     <%--   <option>LOV</option>--%>
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
                    <%--  <input type="text" placeholder="Please Enter Mapping Nature" id="txtMappingNature" class="form-control" />--%>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Element Name :</label>
                    <select id="ddlGenericElement" class="form-control"></select>
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Parent  Name:</label>
                    <select id="ddlParentName" class="form-control"></select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddElementMasterSheet" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdElementMasterSheet" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblElementMasterSheet" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Element Nature</th>
                                <th>Mapping Nature</th>
                                <th>Element Name</th>
                                <th>Parent Name</th>

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
