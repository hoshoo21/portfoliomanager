<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Values.aspx.cs" Inherits="Portfolio.Values" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Values</h4>
                </div>
                <div class="card-body">
                       <div class="container-fluid">

                <br />
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Values:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Values" id="txtValues" />

                                </div>
                            </div>
                            <%--  <div class="col-md-6">
                                    <label class="control-label">Active:</label>
                                <div class="checkbox">

                                    <label>
                                        <input id="chkActive" type="checkbox" />
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>
                                </div>

                            </div>--%>
                            <div class="col-md-6">
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
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />


                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblValues" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 14%;">Values CODE</th>
                                                <th style="width: 60%;">Description</th>
                                                <th style="width: 5%;">Active</th>
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
                                <div class="modal fade" id="EditValues" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 129%;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Values</h5>

                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row p-t-20">
                                                            <div class="col-md-6 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">Conditon:</label>
                                                                    <input type="text" class="form-control" id="txtUptvalue" />

                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Active:</label>
                                                                <br />

                                                                <label>
                                                                    <input id="chkUptActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                        type="checkbox">
                                                                    <span class="cr"><i class=""></i></span>
                                                                    Yes / No
                                                                </label>

                                                            </div>
                                                            <%--    <div class="col-md-6">
                                                                <div class="checkbox">

                                                                    <label>
                                                                        <input id="chkUptActive" type="checkbox" />
                                                                        <span class="cr"><i class=""></i></span>
                                                                        Yes / No
                                                                    </label>
                                                                </div>

                                                            </div>--%>
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

                if ($.trim($('#txtValues').val()) == '') {
                    $('#txtValues').css("border-color", "red");

                }
                else {
                    InsertValues();
                }

            });
            $("#btnUpdate").click(function () {
                UpdateValues();
            });
            GetValues();
        });
    </script>
</asp:Content>
