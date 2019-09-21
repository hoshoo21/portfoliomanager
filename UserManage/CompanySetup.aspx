<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CompanySetup.aspx.cs" Inherits="Portfolio.Company_Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Company Setup</h4>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Company Symbol:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Company Symbol" id="txtCompanySymbol" />

                                </div>
                            </div>
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Description:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Description" id="txtDescription" />

                                </div>
                            </div>

                        </div>
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />


                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblCompanySetup" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                             
                                                <th id="tblProduct-2" data-priority="1">Company Symbol</th>
                                                <th id="tblProduct-4" data-priority="1">Description</th>




                                            </tr>
                                        </thead>


                                        <tbody></tbody>
                                    </table>
                                </div>

                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        //$(document).ready(function () {
        //    $("#btnAdd").click(function () {

        //        if ($.trim($('#txtClientName').val()) == '') {
        //            $('#txtClientName').css("border-color", "red");

        //        }
        //        else {
        //            InsertClient();
        //        }
        //    });
        //    $("#btnUpdate").click(function () {
        //        //UpdateCompany();
        //    });



        //    GetClient();
        //});
        //$(document).ready(function () {
        //    LoadGetCompanySetup('');
        //});
    </script>
</asp:Content>
