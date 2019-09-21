<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetSetup.aspx.cs" Inherits="Portfolio.AssetSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asset Setup</title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
          
            GetAsset();
            $('#btnUpdAsset').hide();
            $('#btnAddAsset').click(function () {
                AddAsset();
            });
            $('#btnUpdAsset').click(function () {
                UpdateAsset();
            });

        });
        

        function AddAsset() {

          
            var ajax_data = {
                Asset: $('#txtAsset').val()
              
            };
            $.ajax({
                url: "api/XBRL/GetInsertAsset",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Add Successfully !');
                    GetAsset();
                    document.getElementById("txtAsset").value = '';
                    
                },
                error: function (reAsset) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function GetAsset() {

            $.ajax({
                url: "api/XBRL/GetAsset",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadAsset(data);

                },
                error: function (reAsset) {
                    //notifyError('Data Load failed!');

                }
            });

        }

        function LoadAsset(data) {
            var tblQues;

            if ($.fn.dataTable.isDataTable('#tblAsset')) {
                tblQues = $('#tblAsset').DataTable().clear().destroy();
            }
            tblQues = $('#tblAsset').DataTable({
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


                    { "data": "ASSET_IDX" },
                    { "data": "ASSET_DESC" },
                  



                    {
                        "date": "ASSET_IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnAssetEdit(\'' + full["ASSET_IDX"] + '\',\'' + full["ASSET_DESC"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "ASSET_IDX",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Deletes"  style="height: 31px;font-size: 12px;"    onclick="OnAssetDelete(\'' + full["ASSET_IDX"] + '\')"></input>';

                        }
                    },




                ],

            });


        }

        var AssetCode;
        function OnAssetEdit(ASSET_IDX, ASSET_DESC) {
           
            AssetCode = ASSET_IDX;
            $('#btnAddAsset').hide();
            $('#btnUpdAsset').show();
            document.getElementById("txtAsset").value = ASSET_DESC;
          
         
           
        }
        function OnAssetDelete(ASSET_IDX) {

            var ajax_data = {

                ASSET_IDX: ASSET_IDX

            };

            $.ajax({
                url: "api/XBRL/GetDeleteAsset",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    alert('Delete Successfully!');
                    GetAsset();

                },
                error: function (reAsset) {
                    //notifyError('Data Load failed!');

                }
            });
        }

        function UpdateAsset() {
          
            var ajax_data = {
                Asset: $('#txtAsset').val(),
                AssetCode:AssetCode
               

            };
            $.ajax({
                url: "api/XBRL/GetUpdateAsset",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {

                    alert('Update Successfully !');
                    GetAsset();
                    $('#btnUpdAsset').hide();
                    $('#btnAddAsset').show();
                    document.getElementById("txtAsset").value = '';
                  
                },
                error: function (reAsset) {
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
                <h1 style="text-align: center">Asset Setup</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <label class="control-label">Asset:</label>
                    <input type="text" placeholder="Please Enter Asset" id="txtAsset" class="form-control" />
                </div>
               
                <div class="col-sm-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAddAsset" onclick="javascript: return false;" value="ADD " />
                    <input type="button" class="btn btn-success" id="btnUpdAsset" onclick="javascript: return false;" value="UPDATE " />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblAsset" class="display" style="width: 100%">
                        <thead>
                            <tr>

                                <th>Asset Code </th>
                                <th>Asset Desc</th>
                                
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
