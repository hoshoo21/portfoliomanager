<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="Portfolio.AddCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Company</h4>
                </div>
                <div class="card-body">
                       <div class="container-fluid">

                        <br />
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Company:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Company" id="txtCompany" />

                                </div>
                            </div>
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">NTN:</label>
                                    <input type="text" class="form-control" placeholder="Please enter NTN" id="txtNTN" />

                                </div>
                            </div>
                            <%--  <div class="col-md-6">
                                    <label class="control-label">Active:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="chkActive" value="" />
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>
                                </div>
                                  <div class="skin skin-minimal">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <ul class="icheck-list">
                                                <li>
                                                    <label for="chkActive">Active</label><br />
                                                    <asp:CheckBox ID="chkActive" CssClass="check" runat="server" Text="Yes / No" />
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
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
                                    <table id="tblCompany" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%;">Company ID</th>
                                                <th style="width: 40%;">Company Description</th>
                                                <th style="width: 40%;">NTN</th>
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
                                <div class="modal fade" id="EditCompany" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 220%;margin-left:-257px">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Company</h5>

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

                                                                    <label class="control-label">Product:</label>
                                                                    <input type="text" style="color: black;" class="form-control" id="txtUpdtCompany" />

                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">NTN:</label>
                                                                    <input type="text" class="form-control" id="txtUpdtNTN" />

                                                                </div>
                                                            </div>
                                                          <%--  <div class="col-md-4">
                                                                <div class="checkbox">

                                                                    <label>
                                                                        <input id="chkUpdtCompanyActive" type="checkbox" />
                                                                        <span class="cr"><i class=""></i></span>
                                                                        Yes / No
                                                                    </label>
                                                                </div>

                                                            </div>--%>
                                                             <div class="col-md-3">
                                                                <label class="control-label">Active:</label>
                                                                <br />

                                                                <label>
                                                                    <input id="chkUpdtCompanyActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
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

                if ($.trim($('#txtCompany').val()) == '') {
                    $('#txtCompany').css("border-color", "red");

                }
                else {
                    InsertCompany();
                }
            });
            $("#btnUpdate").click(function () {
                UpdateCompany();
            });



            GetCompany();
        });
    </script>
</asp:Content>
