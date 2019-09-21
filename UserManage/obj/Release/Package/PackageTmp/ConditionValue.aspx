<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ConditionValue.aspx.cs" Inherits="Portfolio.ConditionValue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Value Condtion</h4>
                </div>
                <div class="card-body">
                       <div class="container-fluid">

                        <br />
                    <form id="form1" runat="server">
                        <div class="row">

                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Value:</label>
                                    <select id="ddlValue" class="form-control"></select>

                                </div>
                            </div>




                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Criteria:</label>
                                    <select id="ddlCriteria" class="form-control"></select>

                                </div>



                            </div>


                        </div>
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblConditionValue" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 22%;">Value Condition Code</th>
                                                <th style="width: 40%;">Value</th>
                                                <th style="width: 40%;">Criteria</th>
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
                                <div class="modal fade" id="EditValueCondition" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 158%;    margin-left: -127px;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit Value Condition</h5>

                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12" style="display: -webkit-box;">

                                                        <div class="col-md-4">
                                                            
                                                                <label class="control-label">Value:</label>
                                                                <select id="ddlUpdtValue" class="form-control"></select>

                                                           
                                                        </div>

                                                        <div class="col-md-4">
                                                          
                                                                <label class="control-label">Criteria:</label>
                                                                <select id="ddlUpdtCriteria" class="form-control"></select>

                                                         
                                                        </div>


                                                    </div>
                                                </div>
                                                <br />
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

          
            GetValuesDropDown();
            GetCriteriadropdownPfolio();
            $("#btnAdd").click(function () {

                InsertValueCondition();
             

            });
            $("#btnUpdate").click(function () {
                UpdateValCondition();
            });
            GetValueCondition();
        });

    </script>
</asp:Content>
