<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ClientSetup.aspx.cs" Inherits="Portfolio.ClientSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .radio label:before {
            /*styles outer circle*/
            content: " ";
            display: inline-block;
            position: relative;
            top: 5px;
            margin: 0 5px 0 0;
            width: 20px;
            height: 20px;
            border-radius: 11px;
            border: 2px solid orange;
            background-color: transparent;
        }

        .radio label {
            position: relative;
        }

            .radio label input[type='radio']:checked + span {
                border-radius: 11px;
                width: 12px;
                height: 12px;
                position: absolute;
                top: 9px;
                left: 5px;
                display: block;
                background-color: #0C5A59;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Client Setup</h4>
                </div>

                <div class="card-body">
                    <div class="container-fluid">

                        <br />
                        <form id="form1" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Client Name:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Client Name" id="txtClientName" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="control">
                                            <label class="radio">
                                                <input type="radio" name="gender" id="rdmale" value="male">
                                                Male
                                            </label>
                                            <label class="radio">
                                                <input type="radio" name="gender" id="rdFemaile" value="female">
                                                Female
                                            </label>
                                        </div>
                                        <%--<div class="form-group">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="gender" id="rdmale" value="male" />
                                            Male<span></span></label>
                                        <label style="margin-left: 27px;">
                                            <input type="radio" name="gender" id="rdFemaile" value="female" />
                                            Female<span></span></label>
                                    </div>
                                </div>--%>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">CNIC:</label>
                                            <input type="text" class="form-control" placeholder="Please enter CNIC" id="txtNIC" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">NTN:</label>
                                            <input type="text" class="form-control" placeholder="Please enter NTN" id="txtNTN" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">OLD:</label>
                                            <input type="text" class="form-control" placeholder="Please enter OLD" id="txtOLD" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <label class="control-label">Active:</label>
                                        <br />

                                        <label>
                                            <input id="chkActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                type="checkbox">
                                            <span class="cr"><i class=""></i></span>
                                            Yes / No
                                        </label>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Client Category:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Category" id="txtCategory" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Islamic:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Islamic" id="txtIslamic" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Online:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Online" id="txtOnline" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Reference:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Reference" id="txtReference" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Contact No:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Contact No" id="txtContactNo" />

                                        </div>
                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Email:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Email" id="txtEmail" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Address:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Address" id="txtAddress" />

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="table-responsive">
                                        <table id="tblClient" class="display" style="width: 100%">
                                            <thead>
                                                <tr>

                                                    <th>Client</th>
                                                    <th>Gender</th>
                                                    <th>Nic</th>
                                                    <th>Ntn</th>
                                                    <th>Old</th>
                                                    <th>Date</th>
                                                    <th>Active</th>
                                                    <th>Category</th>
                                                    <%--<th>User</th>--%>
                                                    <th></th>
                                                    <th></th>

                                                </tr>
                                            </thead>


                                            <tbody></tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>



                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal fade" id="EditClient" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 189%; margin-left: -191px;">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Client</h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-sm-12" style="display: -webkit-box;">

                                                            <div class="col-md-4">

                                                                <label class="control-label">Client Name:</label>
                                                                <input type="text" class="form-control" placeholder="Please enter Client Name" id="txtUptClientName" />


                                                            </div>
                                                            <div class="col-md-4">

                                                                <label class="control-label">CNIC:</label>
                                                                <input type="text" class="form-control" placeholder="Please enter CNIC" id="txtUptNIC" />


                                                            </div>
                                                            <div class="col-md-4">

                                                                <label class="control-label">NTN:</label>
                                                                <input type="text" class="form-control" placeholder="Please enter NTN" id="txtUptNTN" />


                                                            </div>

                                                        </div>
                                                    </div>



                                                    <%--  <div class="col-md-4 position-relative">
                                                    <div class="checkbox">

                                                        <label>
                                                            <input id="chkUptActive" type="checkbox" />
                                                            <span class="cr"><i class=""></i></span>
                                                            Yes / No
                                                        </label>
                                                    </div>
                                                </div>--%>


                                                    <div class="col-md-4">
                                                        <label class="control-label">Active:</label>
                                                        <br />

                                                        <label>
                                                            <input id="chkUptActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                type="checkbox">
                                                            <span class="cr"><i class=""></i></span>
                                                            Yes / No
                                                        </label>

                                                    </div>










                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-success" id="btnUpdate">Update</button>


                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnAdd").click(function () {

                if ($.trim($('#txtClientName').val()) == '') {
                    $('#txtClientName').css("border-color", "red");

                }
                else {
                    InsertClient();
                }
            });
            $("#btnUpdate").click(function () {
                Updateclient();
            });



            GetClient();
        });

    </script>
</asp:Content>
