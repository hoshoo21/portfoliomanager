<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Portfolio.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New User</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="Javascript/Product.js"></script>

    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
    <script type="text/javascript">


        $(document).ready(function () {



            $("#btnAdd").click(function () {


                InsertUSer();


            });
            //$("#btnUpdate").click(function () {
            //    UpdateProduct();
            //});
            GetUserType();
            GetUsers();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-fluid">
            <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center;">Add New User</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">

                    <label class="control-label">User ID:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter User ID" id="txtUserName" />


                </div>
                <div class="col-md-3">

                    <label class="control-label">Password:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Password" id="txtPassword" />


                </div>
                <div class="col-md-3">
                    <label class="control-label">User Type:</label>
                    <select id="ddlUserType" class="form-control"></select>


                </div>
                <div class="col-md-3">
                    <label class="control-label">Page Allow:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Page Allow" id="txtPageAllow" />


                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">

                    <label class="control-label">Manager ID:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Manager ID" id="txtManagerId" />


                </div>
                <div class="col-md-3">

                    <label class="control-label">Email:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Email" id="txtEmail" />


                </div>
                <div class="col-md-3">


                    <label class="control-label">Contact No:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Contact No" id="txtContactNo" />


                </div>
                <div class="col-md-3">

                    <label class="control-label">External User:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter External User" id="txtExternalUser" />


                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">


                    <label class="control-label">Image Path:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Image Path" id="txtImagePath" />


                </div>
                <div class="col-md-3">

                    <label class="control-label">Client Code:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Client Code" id="txtClientCode" />


                </div>
                <div class="col-md-3">

                    <label class="control-label">Outlook Password:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Outlook Password" id="txtOutlookPass" />

                </div>

                <div class="col-md-3">

                    <label class="control-label">Name Description:</label>
                    <input type="text" class="form-control txtnull" placeholder="Please enter Name Description" id="txtNameDescription" />


                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                 <div class="col-md-4">
                     </div>
                 <div class="col-md-4">
                     <br />
                <input type="button" class="btn btn-success" id="btnAdd" value="ADD" />
                     </div>
                 <div class="col-md-4">
                     </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblUser" class="display" style="width: 100%">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Password</th>
                                <th>User Type</th>
                                <th>Page Allow</th>
                                <th>Manager ID</th>
                                <th>Email</th>
                                <th>Contact No</th>
                                <th>External User</th>
                                <th>Image Path</th>
                                <th>Client Code</th>
                                <th>Outlook Password</th>
                                <th>Name Description</th>
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




