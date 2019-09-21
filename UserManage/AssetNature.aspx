<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetNature.aspx.cs" Inherits="Portfolio.AssetNature" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asset Nature</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="Javascript/Product.js"></script>

    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <script type="text/javascript">


        $(document).ready(function () {
            GetAssetNature();
            //$('#ddlCompanysymbol').multiselect();

            $("#btnAdd").click(function () {

                InsertAssetNature();



            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="text-align: center;">Asset Nature</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-md-3">
                        <label class="control-label">Asset Nature:</label>
                        <input type="text" class="form-control" placeholder="Please enter Asset Nature" id="txtAssetNature" />

                    </div>
                    <div class="col-md-3">
                        <br />
                        <input type="button" class="btn btn-success" id="btnAdd" value="ADD" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">

                    <div class="table-responsive">
                        <table id="tblAssetNature" class="display" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Asset Nature Code</th>
                                    <th>Asset Nature</th>
                                    <th></th>
                                    <th></th>




                                </tr>
                            </thead>


                            <tbody></tbody>
                        </table>
                    </div>

                </div>
            </div>




        </div>
    </form>
</body>
</html>





