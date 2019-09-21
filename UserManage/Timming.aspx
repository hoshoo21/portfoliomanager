<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Timming.aspx.cs" Inherits="Portfolio.Timming" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Timming</h4>
                </div>
                <div class="card-body">
                    <div class="container-fluid">

                        <br />

                        <form id="form1" runat="server">

                            <div class="row p-t-20">
                                <div class="col-md-6 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Timming:</label>
                                        <input type="text" class="form-control" placeholder="Please enter Timming" id="txtTimming" />

                                    </div>
                                </div>

                            </div>
                            <input type="button" class="btn btn-success" id="btnAdd" value="ADD" />


                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="table-responsive">
                                        <table id="tblTimming" class="display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 11%;">Timming Code</th>
                                                    <th style="width: 50%;">Timming Description</th>
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
                                    <div class="modal fade" id="EditTimming" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 129%;">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalTimming">Edit Timming</h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="row p-t-20">
                                                                <div class="col-md-8 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Timming:</label>
                                                                        <input type="text" style="color: black;" class="form-control" id="txtUpdtTimming" />

                                                                    </div>
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

                if ($.trim($('#txtTimming').val()) == '') {
                    $('#txtTimming').css("border-color", "red");

                }
                else {
                    InsertTimming();

                }

            });
            $("#btnUpdate").click(function () {
                UpdateTimming();
            });
            GetTimming();
        });
    </script>
</asp:Content>
