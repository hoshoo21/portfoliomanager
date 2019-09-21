﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="BankDetail.aspx.cs" Inherits="Portfolio.BankDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Bank Detail</h4>
                </div>
                <div class="card-body">
                    <div class="container-fluid">

                        <br />
                        <form id="form1" runat="server">
                            <div class="row p-t-20">
                                <div class="col-md-6 position-relative">
                                    <div class="form-group">
                                        <label class="control-label">Bank Detail:</label>
                                        <input type="text" class="form-control" placeholder="Please enter Bank Detail" id="txtBankDetail" />

                                    </div>
                                </div>

                            </div>
                            <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />


                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="table-responsive">
                                        <table id="tblBankDetail" class="display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 17%;">Bank Detail CODE</th>
                                                    <th>Description</th>
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
                                    <div class="modal fade" id="EditBankDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 129%;">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Bank Detail</h5>

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

                                                                        <label class="control-label">Product:</label>
                                                                        <input type="text" class="form-control" placeholder="Please enter Relation Ship" id="txtUpdtBank" />

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

                if ($.trim($('#txtBankDetail').val()) == '') {
                    $('#txtBankDetail').css("border-color", "red");

                }
                else {
                    InsertBankDetail();
                }

            });
            $("#btnUpdate").click(function () {
                UpdateBank();
            });
            GetBankDetail();
        });


    </script>
</asp:Content>