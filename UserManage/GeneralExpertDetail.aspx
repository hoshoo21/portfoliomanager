<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="GeneralExpertDetail.aspx.cs" Inherits="Portfolio.GeneralExpertDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>
    <style type="text/css">
        .labelData {
            font-family: 'Poppins', sans-serif;
            font-size: 17px;
            color: black;
            font-weight: 600;
        }


        .labelDataStyle {
            font-family: 'Poppins', sans-serif;
            font-size: 17px;
            color: gray;
            font-weight: 600;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="card card-outline-success" style="margin-top: -21px; margin-left: -15px;">
        <div class="card-header">
            <h4 class="m-b-0 text-white">General Expert Detail</h4>
        </div>
        <div class="card-body">
            <div class="container-fluid">

                <br />
                <div class="row">

                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">Expert Master:</label>
                            <select id="ddlExpertMaster" class="form-control"></select>

                        </div>
                    </div>
                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">Product:</label>
                            <select id="ddlProduct" class="form-control"></select>

                        </div>
                    </div>
                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">Company:</label>
                            <select id="ddlCompany" class="form-control"></select>

                        </div>
                    </div>
                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">Category:</label>
                            <select id="ddlCategory" class="form-control"></select>

                        </div>
                    </div>
                    <%-- <div class="col-md-4">
                                <label class="control-label">Active:</label>
                                <div class="checkbox">
                                <label class="container">
                                     Yes / No
                                       <input id="chkActive" type="checkbox">
                                    <span class="checkmark"></span>
                                   
                                </label>
                                 <label>
                                    <input id="chkActive" type="checkbox" />
                                    <span class="cr"><i class=""></i></span>
                                        Yes / No
                                </label>
                                <%--</div>
                            </div>--%>

                    <div class="col-md-4">
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
                            <table id="tblExpertMastDetail" class="display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <%--  <th style="width: 34%;">Expert Master Code</th>--%>
                                        <th style="width: 20%;">Company</th>
                                        <th style="width: 25%;">Product</th>
                                        <th style="width: 25%;">Expert Master</th>
                                        <th style="width: 25%;">Category</th>
                                        <th style="width: 25%;">Active</th>
                                        <th style="width: 5%;"></th>
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
                        <div class="modal fade" id="EditExpertGeneral" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 196%; margin-left: -232px">
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicy">Edit General Expert Detail</h5>

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-md-4 position-relative">
                                                <div class="form-group">
                                                    <label class="control-label">Expert Master:</label>
                                                    <select id="ddlUptExpertMaster" class="form-control"></select>

                                                </div>
                                            </div>
                                            <div class="col-md-4 position-relative">
                                                <div class="form-group">
                                                    <label class="control-label">Product:</label>
                                                    <select id="ddlUptProduct" class="form-control"></select>

                                                </div>
                                            </div>
                                            <div class="col-md-4 position-relative">
                                                <div class="form-group">
                                                    <label class="control-label">Company:</label>
                                                    <select id="ddlUptCompany" class="form-control"></select>

                                                </div>
                                            </div>
                                            <div class="col-md-4 position-relative">
                                                <div class="form-group">
                                                    <label class="control-label">Category:</label>
                                                    <select id="ddlUptCategory" class="form-control"></select>

                                                </div>
                                            </div>

                                            <%--<div class="col-md-4">
                                                        <label class="control-label">Active:</label>
                                                        <div class="checkbox">

                                                            <label>
                                                                <input id="chkUptActive" type="checkbox" />
                                                                <span class="cr"><i class=""></i></span>
                                                                Yes / No
                                                            </label>
                                                        </div>

                                                    </div>--%>

                                            <div class="col-md-3">
                                                <label class="control-label">Active:</label>
                                                <br />

                                                <label>
                                                    <input id="chkUptActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                        type="checkbox">
                                                    <span class="cr"><i class=""></i></span>
                                                    Yes / No
                                                </label>

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



                <div class="row">
                    <div class="col-sm-12">
                        <div class="modal fade" id="ExpertCriteriaValue" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="margin-left: -319px; width: 210%;">
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicys">General Expert Criteria</h5>

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="height: 600px; overflow: scroll;">
                                        <div class="container-fluid">

                                            <div class="row">
                                                <div class="col-sm-12" style="display: -webkit-inline-box;">
                                                    <div class="col-sm-4">
                                                        <label class="labelData">Expert Master:</label>
                                                        <label class="labelDataStyle" id="lblExpertmaster">:</label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label class="labelData">Product:</label>
                                                        <label class="labelDataStyle" id="lblProduct"></label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label class="labelData">Company:</label>
                                                        <label class="labelDataStyle" id="lblcompany"></label>
                                                    </div>


                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">

                                                <div class="col-md-3 position-relative">
                                                    <div class="form-group">

                                                        <label class="control-label">Criteria:</label>
                                                        <div class="dropdown">

                                                            <button id="btnCriteria" style="width: 250px; border-color: gainsboro;" class="btn btn-default dropdown-toggle form-control" type="button" data-condcol="" data-toggle="dropdown">
                                                                <span>Select Criteria</span>

                                                            </button>
                                                            <ul class="dropdown-menu" style="width: 250px; height: 350px; overflow: scroll;">

                                                                <li class="dropdown-submenu"></li>
                                                            </ul>

                                                            <ul id="submenu" class="dropdown-menu" style="margin-left: 250px; display: none; width: 250px; height: 350px; overflow: scroll">
                                                            </ul>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 position-relative">
                                                    <div class="form-group">
                                                        <label class="control-label">Condition:</label>
                                                        <select id="ddlCondition" class="form-control"></select>

                                                    </div>
                                                </div>
                                                <div class="col-md-3 position-relative">
                                                    <div class="form-group">
                                                        <label class="control-label">Value 1:</label>
                                                        <select id="ddlValueOne" class="form-control"></select>

                                                    </div>
                                                </div>

                                                <div class="col-md-3 position-relative" id="ddlval2" style="display: none">
                                                    <div class="form-group">
                                                        <label class="control-label">Value 2:</label>
                                                        <select id="ddlValueTwo" class="form-control"></select>

                                                    </div>
                                                </div>
                                                <%--   <div class="col-md-3 position-relative">
                                                    <div class="form-group">
                                                        <label class="control-label">Parameter Type:</label>
                                                        <select id="ddlParameterType" class="form-control">
                                                            <option>Parameter</option>
                                                            <option>Constraint</option>
                                                        </select>

                                                    </div>
                                                </div>--%>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="col-md-3">
                                                        <label class="control-label">Active:</label>
                                                        <br />

                                                        <label>
                                                            <input id="chkCritActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                type="checkbox">
                                                            <span class="cr"><i class=""></i></span>
                                                            Yes / No
                                                        </label>

                                                    </div>

                                                    <div class="col-md-3">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <br />
                                                        <%-- <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>--%>
                                                        <button type="button" class="btn btn-success" id="btnAddCriteraValue">Add</button>
                                                        <button type="button" style="display: none" class="btn btn-success" id="btnUptGEC">Update</button>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <%-- <label class="control-label">Parameter List</label>--%>
                                                    <table id="tblExpertCriteriaGeneral">
                                                        <thead>
                                                            <tr>
                                                                <%-- <th style="width: 20%;">Expert Criteria Code</th>
                                                                    <th style="width: 20%;">Expert Master Code</th>--%>
                                                                <th style="width: 15%; display: none"></th>
                                                                <th style="width: 15%;">Criteria</th>
                                                                <th style="width: 15%;">Condition</th>
                                                                <th style="width: 15%;">Value 1</th>
                                                                <th style="width: 15%;">Value 2</th>
                                                                <th style="width: 5%;">Active</th>
                                                                <th style="width: 5%;"></th>
                                                                <th style="width: 5%;"></th>




                                                            </tr>
                                                        </thead>


                                                        <tbody></tbody>
                                                    </table>



                                                </div>


                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-4">
                                                        </div>

                                                        <div class="col-md-4">
                                                            <button type="button" style="margin-left: 194px;" class="btn btn-success" id="btnSearchCondition">Search</button>
                                                        </div>
                                                        <div class="col-md-4">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="display: none" id="ConditionTblDiv">
                                                    <div class="col-sm-12">

                                                        <table id="tblSearchCondtion">
                                                            <thead>
                                                                <tr>

                                                                    <th>Company</th>
                                                                    <th>Ticker</th>
                                                                    <th>Price</th>
                                                                    <th>Change</th>
                                                                    <th>Volume</th>
                                                                    <th>MC</th>
                                                                    <th>Industory</th>
                                                                    <th>Sector</th>





                                                                </tr>
                                                            </thead>


                                                            <tbody></tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                

                                                <div class="modal-footer">
                                                </div>
                                            </div>

                                            
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                
                

            </div>

        </div>
    </div>





    <script type="text/javascript">
        $(document).ready(function () {
            //$('.dropdown-submenu a.test').on("click", function (e) {
            //    $(this).next('ul').toggle();
            //    e.stopPropagation();
            //    e.preventDefault();
            //});
            //GetGeneralExpertDropDown();


            //$('.dropdown-submenu li  a ').on("click", function (e) {
            //    alert($(this).text())
            //    $('#btn_drop').text($(this).text())
            //});
            GetGeneralExpertDropDown();
            GetConditonDropdown();
            //GetCriteriadropdown();
            GetCompanyDropDown();
            GetProductDropDown();
            //GetGeneralExpertDropDown();
            GetGeneralExpertDetail();
            GetCategoryDropDown();



            $('#ddlCriteria').on('change', function () {
                var criCode = this.value;
                bindValue(criCode);
            });
            $('#ddlUpdCriteria').on('change', function () {
                var criUpdtCode = this.value;
                bindUpdtValue(criUpdtCode);
            });
            $('#ddlCondition').on('change', function () {
                var conditon = this.options[this.selectedIndex].text;

                if (conditon == 'Between') {
                    $('#ddlval2').show();
                }
                else {
                    $('#ddlval2').hide();
                }

            });
            $('#ddlUptCondition').on('change', function () {
                var conditon = this.options[this.selectedIndex].text;

                if (conditon == 'Between') {
                    $('#ddlUptval2').show();
                }
                else {
                    $('#ddlUptval2').hide();
                }

            });
            //GetCriteriaDropDown();
            $("#btnAdd").click(function () {

                InsertGeneralExpertDetail();


            });


            $("#btnUptGEC").click(function () {
                UpdateGeneralExpertCriteria();
            });
            $("#btnUpdate").click(function () {
                UpdateGeneralExpert();
            });
            $("#btnAddCriteraValue").click(function () {


                InsertExpertCriteriaGeneral();


            });
            $("#btnSearchCondition").click(function () {


                SearchConditionWiseCriteria();


            });


        });

    </script>
</asp:Content>
