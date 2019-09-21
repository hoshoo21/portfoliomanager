<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="JointHolderClient.aspx.cs" Inherits="Portfolio.JointHolderClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Joint Holder Client</h4>
                </div>
                <div class="card-body">
                       <div class="container-fluid">

                        <br />
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Joint Holder Client:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Joint Holder Client" id="txtJointHolderClient" />

                                </div>
                            </div>
                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Address:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Address" id="txtAddress" />

                                </div>
                            </div>

                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">NIC:</label>
                                    <input type="text" class="form-control" placeholder="Please enter NIC" id="txtNIC" />

                                </div>
                            </div>
                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Phone No:</label>
                                    <input type="text" class="form-control" placeholder="Please enter  Phone No" id="txtPhoneNo" />

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label">Active:</label>
                                <br />

                                <label>
                                    <input id="chkActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                        type="checkbox">
                                    <span class="cr"><i class=""></i></span>
                                    Yes / No
                                </label>

                            </div>
                            <%--  <div class="col-md-4 position-relative">
                                    <label class="control-label">Active:</label>
                                <div class="checkbox">

                                    <label>
                                        <input id="chkActive" type="checkbox" />
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>
                                </div>
                            </div>--%>
                            <%-- <div class="col-md-6">
                                <div class="skin skin-minimal">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <ul class="icheck-list">
                                                <li>
                                                    <label for="chkActive">Active</label><br />
                                                     <asp:CheckBox ID="CheckBox1" CssClass="check" runat="server" Text="Yes / No" />
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />


                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblJointHolderClient" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th data-priority="1">Client CODE</th>
                                                <th data-priority="1">Name</th>
                                                <th data-priority="1">Address</th>
                                                <th data-priority="1">Phone No</th>
                                                <th data-priority="1">NIC</th>
                                                <th data-priority="1">Active</th>
                                                <th style="width: 5%;"></th>
                                                <th style="width: 5%;"></th>
                                            </tr>
                                        </thead>


                                        <tbody></tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="modal fade" id="EditJointHolder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 129%;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Join Holder</h5>

                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row p-t-20">
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">Joint Holder Client:</label>
                                                                    <input type="text" class="form-control" placeholder="Please enter Joint Holder Client" id="txtUpdtJointHolderClient" />

                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">Address:</label>
                                                                    <input type="text" class="form-control" placeholder="Please enter Address" id="txtUpdtAddress" />

                                                                </div>
                                                            </div>

                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">NIC:</label>
                                                                    <input type="text" class="form-control" placeholder="Please enter NIC" id="txtUpdtNIC" />

                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">Phone No:</label>
                                                                    <input type="text" class="form-control" placeholder="Please enter  Phone No" id="txtUpdtPhoneNo" />

                                                                </div>
                                                            </div>
                                                            <%--  <div class="col-md-4 position-relative">
                                                                <div class="checkbox">

                                                                    <label>
                                                                        <input id="chkUpdtActive" type="checkbox" />
                                                                        <span class="cr"><i class=""></i></span>
                                                                        Yes / No
                                                                    </label>
                                                                </div>
                                                            </div>--%>

                                                            <div class="col-md-4v">
                                                                <label class="control-label">Active:</label>
                                                                <br />

                                                                <label>
                                                                    <input id="chkUpdtActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                        type="checkbox">
                                                                    <span class="cr"><i class=""></i></span>
                                                                    Yes / No
                                                                </label>

                                                            </div>
                                                        </div>

                                                    </div>
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

                if ($.trim($('#txtJointHolderClient').val()) == '') {
                    $('#txtJointHolderClient').css("border-color", "red");

                }
                else {
                    InsertJointCLient();
                }
            });
            $("#btnUpdate").click(function () {
                UpdateJointHolderClient();
            });



            GetJointHolderClient();
        });



    </script>
</asp:Content>
