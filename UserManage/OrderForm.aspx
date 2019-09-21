<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderForm.aspx.cs" Inherits="Portfolio.OrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Order Form</h4>
                </div>
                <div class="card-body">
                    <div class="container-fluid">

                        <br />
                        <form id="form1" runat="server">
                            <div class="row p-t-20">

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Client:</label>
                                        <select id="ddlClient" class="form-control"></select>


                                    </div>

                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Action Type:</label>
                                        <select id="ddlActionType" class="form-control"></select>



                                    </div>

                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Symbol:</label>
                                        <select id="ddlSymbol" class="form-control">
                                            <option>Select Symbol</option>
                                            <option>Cvx</option>
                                            <option>Aapl</option>
                                            <option>Abc</option>
                                        </select>


                                    </div>
                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Order Date:</label>

                                        <input type="date" id="txtOrderDate" class="form-control" />


                                    </div>
                                </div>
                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Quantity:</label>
                                        <input type="text" class="form-control" placeholder="Please enter Quantity" id="txtQuantity" />



                                    </div>

                                </div>
                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Order Type:</label>
                                        <select id="ddlOrderType" class="form-control"></select>


                                    </div>
                                </div>


                                <div id="rateshow" style="display: contents;">
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">

                                            <label class="control-label">Rate 1:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Rate 1" id="txtRateOne" />
                                        </div>

                                    </div>
                                    <div class="col-md-4 position-relative">
                                        <div class="form-group">

                                            <label class="control-label">Rate 2:</label>
                                            <input type="text" class="form-control" placeholder="Please enter Rate 2" id="txtRateTwo" />


                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Timming:</label>
                                        <select id="ddlTimming" class="form-control"></select>


                                    </div>


                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Broker :</label>
                                        <select id="ddlBroker" class="form-control"></select>



                                    </div>






                                </div>

                                <div class="col-md-4 position-relative">
                                    <div class="form-group">

                                        <label class="control-label">Order Progress :</label>
                                        <select id="ddlOrderProgress" class="form-control"></select>


                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Active:</label>
                                    <br />

                                    <label>
                                        <input id="chkActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                            type="checkbox">
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>

                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-success" id="btnAdd">Add</button>

                                </div>
                            </div>










                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="table-responsive">
                                        <table id="tblOrders" class="display" style="width: 100%; overflow: scroll;">
                                            <thead>
                                                <tr>
                                                    <th>Order Code</th>
                                                    <th>Client</th>
                                                    <th>Action Type</th>
                                                    <th>Order Type</th>
                                                    <th>Broker</th>
                                                    <th>Order Date</th>
                                                    <th>Status</th>
                                                    <th>Quantity</th>
                                                    <th>Rate 1</th>
                                                    <th>Rate 2</th>

                                                    <th></th>
                                                    <th></th>
                                                    <th></th>





                                                </tr>
                                            </thead>


                                            <tbody></tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal fade" id="PurchasedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 214%; margin-left: -264px;">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPurchased">Purchased By Broker</h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="row p-t-20">
                                                                <div class="col-md-4 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Purchase Date:</label>
                                                                        <input type="date" style="color: black;" class="form-control" id="txtPurchaseDateTime" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Quantity:</label>
                                                                        <input type="text" style="color: black;" class="form-control" placeholder="Please Enter Quantity" id="txtPurchaseQuantity" />

                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Rate:</label>
                                                                        <input type="text" style="color: black;" class="form-control" placeholder="Please Enter Rate" id="txtRate" />

                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <div class="table-responsive">
                                                                <table id="tblPurchase" class="display" style="width: 100%">
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="width: 16%;">Purchase Code</th>
                                                                            <th style="width: 16%;">Order Code</th>
                                                                            <th style="width: 20%;">Purchase Date</th>
                                                                            <th style="width: 20%;">Quantity</th>
                                                                            <th style="width: 20%;">Rate</th>







                                                                        </tr>
                                                                    </thead>


                                                                    <tbody></tbody>
                                                                </table>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-success" id="btnPurchaseAdd">Add</button>


                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal fade" id="EditOder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content" style="width: 219%; margin-left: -60%;">

                                                <div class="modal-header">
                                                    <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelOrder">Edit Order</h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="row">
                                                        <div class="col-sm-12" style="display: contents;">

                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Client:</label>
                                                                    <select id="ddlUpdClient" class="form-control"></select>


                                                                </div>

                                                            </div>

                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Action Type:</label>
                                                                    <select id="ddlUpdActionType" class="form-control"></select>



                                                                </div>

                                                            </div>

                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Symbol:</label>
                                                                    <select id="ddlUpdSymbol" class="form-control">
                                                                        <option>Select Symbol</option>
                                                                        <option>Cvx</option>
                                                                        <option>Aapl</option>
                                                                        <option>Abc</option>
                                                                    </select>


                                                                </div>
                                                            </div>

                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Order Date:</label>

                                                                    <input type="date" id="txtUpdOrderDate" class="form-control" />


                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Order Type:</label>
                                                                    <select id="ddlUptOrderType" class="form-control"></select>


                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Quantity:</label>
                                                                    <input type="text" class="form-control" placeholder="Please enter Quantity" id="txtUpdQuantity" />



                                                                </div>

                                                            </div>

                                                            <div id="updrateshow" style="display: contents;">
                                                                <div class="col-md-4 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Rate 1:</label>
                                                                        <input type="text" class="form-control" placeholder="Please enter Rate 1" id="txtUpdRateOne" />
                                                                    </div>

                                                                </div>
                                                                <div class="col-md-4 position-relative">
                                                                    <div class="form-group">

                                                                        <label class="control-label">Rate 2:</label>
                                                                        <input type="text" class="form-control" placeholder="Please enter Rate 2" id="txtUpdRateTwo" />


                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Broker :</label>
                                                                    <select id="ddlUpdBroker" class="form-control">
                                                                    </select>



                                                                </div>






                                                            </div>
                                                            <div class="col-md-4 position-relative">
                                                                <div class="form-group">

                                                                    <label class="control-label">Order Progress :</label>
                                                                    <select id="ddlUpdOrderProgress" class="form-control"></select>


                                                                </div>
                                                            </div>
                                                            <%--   <div class="col-md-4">
                                                            <label class="control-label">Active:</label>
                                                            <div class="checkbox">

                                                                <label>
                                                                    <input id="chkUpdActive" type="checkbox" />
                                                                    <span class="cr"><i class=""></i></span>
                                                                    Yes / No
                                                                </label>
                                                            </div>

                                                        </div>--%>

                                                            <div class="col-md-3">
                                                                <label class="control-label">Active:</label>
                                                                <br />

                                                                <label>
                                                                    <input id="chkUpdActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                        type="checkbox">
                                                                    <span class="cr"><i class=""></i></span>
                                                                    Yes / No
                                                                </label>

                                                            </div>

                                                        </div>
                                                    </div>






                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-success" id="btnUpdOrder">Update</button>


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

        // Access instance of plugin


        $(document).ready(function () {

            GetClientDropdown();
            GetActionTypeDropdown();
            GetBrokerDropdown();
            GetTimmingDropdown();
            GetOrderTypeDropdown();
            GetOrderProgressDropdown();
            GetOrders();
            $("#btnAdd").click(function () {


                InsertOrder();

            });
            $("#btnUpdOrder").click(function () {


                UpdateOrder();

            });


            $("#btnPurchaseAdd").click(function () {


                InsertPurchase();

            });
            $('#ddlOrderType').on('change', function () {
                var ordertype = this.options[this.selectedIndex].text;

                if (ordertype == 'Market Order') {
                    $('#rateshow').hide();
                }
                else {
                    $('#rateshow').show();
                }

            });
            $('#ddlUptOrderType').on('change', function () {
                var Uptordertype = this.options[this.selectedIndex].text;

                if (Uptordertype == 'Market Order') {
                    $('#updrateshow').hide();
                }
                else {
                    $('#updrateshow').show();
                }

            });
            $("#btnUpdate").click(function () {
                //UpdateOrderProgress();
            });
            //GetOrderProgress();
        });
    </script>


</asp:Content>
