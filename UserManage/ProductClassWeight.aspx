<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductClassWeight.aspx.cs" Inherits="Portfolio.ProductClassWeight" %>

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
            GetClassWeight();
            GetPfolioProductDropDown();
            GetPfolioAssetNatureDropDown();
            //$('#ddlCompanysymbol').multiselect();

            $("#btnAdd").click(function () {

                InsertClassWeight();



            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="text-align: center;">Product Class Weight</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-md-3">
                        <label class="control-label">Product:</label>
                        <select class="form-control" id="ddlPfolioProduct"></select>

                    </div>
                    <div class="col-md-3">
                        <label class="control-label">Score:</label>
                        <input type="text" class="form-control" placeholder="Please enter Score" id="txtScore" />

                    </div>
                    <div class="col-md-3">
                        <label class="control-label">Asset:</label>
                        <select class="form-control" id="ddlAsset"></select>

                    </div>
                    <div class="col-md-3">
                        <label class="control-label">Weight:</label>
                        <input type="text" class="form-control" placeholder="Please enter Weight" id="txtWeight" />

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
                        <table id="tblProductClassWeight" class="display" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Score</th>
                                    <th>Asset</th>
                                    <th>Weight</th>
                                  
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
