<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NomineeClient.aspx.cs" Inherits="Portfolio.NomineeClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Nominee Client</h4>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Nominee Client:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Nominee Client" id="txtNomineeClient" />

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
                                    <label class="control-label">Shared:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Shared" id="txtShared" />

                                </div>
                            </div>

                            <div class="col-md-4 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Phone No:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Phone No" id="txtPhoneNo" />

                                </div>
                            </div>






                            <div class="col-md-6">
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
                            </div>

                        </div>
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblNominee" class="display" style="width: 100%">
                                        <thead>
                                            <tr>

                                                <th data-priority="1">Nominee Client Code</th>
                                                <th data-priority="1">Description</th>
                                                <th data-priority="1">NIC</th>
                                                <th data-priority="1">Shared</th>
                                                <th data-priority="1">Phone No</th>
                                                <th data-priority="1">Active</th>





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


        $(document).ready(function () {
            LoadNominee('');
        });
    </script>
</asp:Content>
