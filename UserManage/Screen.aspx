<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Screen.aspx.cs" Inherits="Portfolio.Screen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
            <div class="row">
                <div class="col-12">
                    <div class="card card-outline-success" style="margin-top: -21px">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Screen</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" runat="server">
                                <div class="row p-t-20">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Project:</label>
                                            <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control custom-select"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Screen Description:</label>
                                            <asp:TextBox ID="txtScreen" runat="server" CssClass="form-control" placeholder="Please enter Project"></asp:TextBox>                                            
                                        </div>
                                    </div>
                                    <div class="col-md-3 position-relative">
                                        <div class="form-group">
                                            <label>Url:</label>
                                            <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control" placeholder="Please enter Url"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Parent:</label>
                                            <asp:DropDownList ID="ddlParent" runat="server" CssClass="form-control custom-select">                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Is Parent:</label>
                                            <asp:DropDownList ID="ddlIsParent" runat="server" CssClass="form-control custom-select">
                                                <asp:ListItem Value="1">True</asp:ListItem>
                                                <asp:ListItem Value="0">False</asp:ListItem>
                                            </asp:DropDownList>                                            
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Icon:</label>
                                            <asp:TextBox ID="txtIcon" runat="server" CssClass="form-control" placeholder="Please enter Icon"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Sorting:</label>
                                            <asp:TextBox ID="txtSorting" runat="server" CssClass="form-control" placeholder="Please enter Sorting"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="skin skin-minimal">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <ul class="icheck-list">
                                                        <li>
                                                            <label style="padding-left: 0px;">Active</label><br />
                                                            <asp:CheckBox ID="chkActive" CssClass="check" runat="server" Text="Yes / No" />
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 text-right">
                                    <asp:Label ID="lblMsg" ForeColor="Green" runat="server" Text=""></asp:Label>
                                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click" Text="Save" />
                                </div>
                                
                                <div class="table-responsive m-t-40">
                                    <asp:GridView ID="gvScreen" runat="server" CellSpacing="0" Width="100%" AutoGenerateColumns="false"
                                        CssClass="display table table-hover table-striped table-bordered">
                                        <Columns>
                                            <asp:BoundField DataField="PROJECT_DESC" HeaderText="Project" />
                                            <asp:BoundField DataField="SCREEN_DESC" HeaderText="Screen Description" />
                                            <asp:BoundField DataField="URL" HeaderText="Url" />
                                            <asp:BoundField DataField="SORTING" HeaderText="Sorting" />
                                            <asp:BoundField DataField="P_Active" HeaderText="Active " />
                                            <%--<asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="ButtonEdit" CssClass="btn btn-info btn-sm" runat="server" Text="Edit" CommandName="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
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
                $("#ContentPlaceHolder1_gvScreen").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({ "ordering": false });
                /*$('tbody').css('line-height', '100%');*/
                $('table').parent().css('font-size', '14px');

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
