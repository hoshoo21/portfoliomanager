<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserControl.aspx.cs" Inherits="Portfolio.UserControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Control </title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="Javascript/Product.js"></script>

    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <script type="text/javascript">


        $(document).ready(function () {
            GetUserControl();
            //$('#ddlCompanysymbol').multiselect();

            $("#btnAdd").click(function () {

                InsertUserControl();



            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="text-align: center;">User Control</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                   <div class="col-md-3">
                         <label class="control-label">User Control:</label>
                        <input type="text" class="form-control" placeholder="Please enter User Control" id="txtUserControl" />
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
                        <table id="tblUserControl" class="display" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Control ID</th>
                                    <th>User Control</th>
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


