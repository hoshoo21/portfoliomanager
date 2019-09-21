<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="GeneralExpert.aspx.cs" Inherits="Portfolio.GeneralExpert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">General Expert</h4>
                </div>
                <div class="card-body">
    <div class="container-fluid">

                        <br />
                        <form id="form1" runat="server">
                            <div class="row p-t-20">
                                <div class="col-md-6 position-relative">
                                    <div class="form-group">
                                        <label class="control-label">General Expert:</label>
                                        <input type="text" class="form-control" placeholder="Please enter General Expert" id="txtGeneralExpert" />

                                    </div>
                                </div>
                                <%--    <div class="col-md-6">
                                <label class="control-label">Active:</label>
                                <div class="checkbox">

                                    <label>
                                        <input id="chkGXActive" type="checkbox" />
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>
                                </div>

                            </div>--%>
                                <div class="col-md-3">
                                    <label class="control-label">Active:</label>
                                    <br />

                                    <label>
                                        <input id="chkGXActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
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
                                        <table id="tblGeneralExpert" class="display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%;">General Expert Code</th>
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
                                    <div class="modal fade" id="EditGeneralExpert" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 129%;">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit General Expert</h5>

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
                                                                        <input type="text" style="color: black;" class="form-control" id="txtUpdtGeneralExpert" />

                                                                    </div>
                                                                </div>
                                                                <%--<div class="col-md-4">
                                                                <div class="checkbox">

                                                                    <label>
                                                                        <input id="chkUpdtGXActive" type="checkbox" />
                                                                        <span class="cr"><i class=""></i></span>
                                                                        Yes / No
                                                                    </label>
                                                                </div>

                                                            </div>--%>
                                                                <div class="col-md-3">
                                                                    <label class="control-label">Active:</label>
                                                                    <br />

                                                                    <label>
                                                                        <input id="chkUpdtGXActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
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

                if ($.trim($('#txtGeneralExpert').val()) == '') {
                    $('#txtGeneralExpert').css("border-color", "red");

                }
                else {
                    InsertGeneralExpert();
                }
            });
            $("#btnUpdate").click(function () {
                UpdateGX();
            });


            GetGeneralExpert();
        });
    </script>
</asp:Content>
