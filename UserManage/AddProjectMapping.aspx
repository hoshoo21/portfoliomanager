<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProjectMapping.aspx.cs" Inherits="Portfolio.AddProjectMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
            <div class="row">
                <div class="col-12">
                    <div class="card card-outline-success" style="margin-top: -21px">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Project Mapping</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">User Id:</label>
                                                    <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Mapping Type:</label>
                                                    <asp:DropDownList ID="ddlMapping" runat="server" CssClass="form-control custom-select">
                                                        <asp:ListItem>Manager</asp:ListItem>
                                                        <asp:ListItem>Management</asp:ListItem>
                                                        <asp:ListItem>Admin</asp:ListItem>
                                                        <asp:ListItem>Coporate User</asp:ListItem>
                                                        <asp:ListItem>CBD</asp:ListItem>
                                                        <asp:ListItem>User</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Select Project:</label>
                                                    <asp:DropDownList ID="ddlProject" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="skin skin-minimal">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <ul class="icheck-list">
                                                                <li>
                                                                    <label class="control-label" for="chkActive">Active</label><br />
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
                                    <asp:GridView ID="gvProject" runat="server" CellSpacing="0" Width="100%" AutoGenerateColumns="false"
                                        CssClass="display nowrap table table-hover table-striped table-bordered">
                                        <Columns>
                                            <asp:BoundField DataField="MAPPING_TYPE" HeaderText="Project" />
                                            <asp:BoundField DataField="USER_ID" HeaderText="User Name" />
                                            <asp:BoundField DataField="P_Active" HeaderText="Active " />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                        </ContentTemplate>
                                </asp:UpdatePanel>
                            </form>
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
                $("#ContentPlaceHolder1_gvProject").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
                /*$('tbody').css('line-height', '100%');*/
                iCheck();
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            });
        });

        function iCheck() {
            var ck = 'icheckbox_minimal-green';
            $('.check').each(function () {

                $(this).iCheck({
                    checkboxClass: ck
                });
            });
        }

        function EndRequestHandler(sender, args) {
            if (args.get_error() == undefined) {
                iCheck();
                $("#ContentPlaceHolder1_gvProject").prepend($("<thead></thead>").append($('#ContentPlaceHolder1_gvProject').find("tr:first"))).dataTable();
            }
        }
    </script>
</asp:Content>
