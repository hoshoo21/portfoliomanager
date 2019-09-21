﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ClientManagement.Master" AutoEventWireup="true" CodeBehind="UserGroup.aspx.cs" Inherits="ClientManagement.UserGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper">
      

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card card-outline-success" style="margin-top: -21px">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Group</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <div class="row p-t-20">
                                    <div class="col-md-6 position-relative">
                                        <div class="form-group">
                                            <label class="control-label">Group:</label>
                                            <asp:TextBox ID="txtGroup" runat="server" CssClass="form-control" placeholder="Please enter Group"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ControlToValidate="txtGroup" ErrorMessage="*" CssClass="requiredFieldValidator"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click" Text="Save" />
                                <asp:Label ID="lblMsg" ForeColor="Green" runat="server" Text=""></asp:Label>

                                <div class="table-responsive m-t-40">
                                    <asp:GridView ID="gvGroup" runat="server" CellSpacing="0" Width="100%" AutoGenerateColumns="false"
                                        CssClass="display nowrap table table-hover table-striped table-bordered">
                                        <Columns>
                                            <asp:BoundField DataField="GROUP_DESC" HeaderText="Group" />
                                            <asp:BoundField DataField="P_Active" HeaderText="Active " />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

        $(document).ready(function () {
            $(function () {
                $("#ContentPlaceHolder1_gvGroup").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
                /*$('tbody').css('line-height', '100%');*/

                var ck = 'icheckbox_minimal-green';
                $('.check').each(function () {

                    $(this).iCheck({
                        checkboxClass: ck
                    });
                });
            });
        });

    </script>
</asp:Content>