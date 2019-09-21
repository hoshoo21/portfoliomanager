<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SpecificExpertDetail.aspx.cs" Inherits="Portfolio.SpecificExpertDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <h4 class="m-b-0 text-white">Specific Expert Detail</h4>
        </div>
        <div class="card-body">

            <div class="container-fluid">

                <br />
                <div class="row">
                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">Client:</label>
                            <select id="ddlSpecificClient" class="form-control"></select>

                        </div>
                    </div>
                    <div class="col-md-4 position-relative">
                        <div class="form-group">
                            <label class="control-label">General Expert Master:</label>
                            <select id="ddlSpecifcExpertMaster" class="multiselect" name="multicheckbox[]" multiple="multiple"></select>

                        </div>
                    </div>




                </div>
                <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                <div class="row">
                    <div class="col-sm-12">

                        <div class="table-responsive">
                            <table id="tblSpecificExpertMastDetail" class="display" style="width: 100%">
                                <thead>
                                    <tr>

                                        <th>Specific Expert Code</th>
                                        <th>Client</th>
                                        <th>General Expert Master</th>
                                        <th>DateTime</th>
                                        <th style="width: 5%;"></th>
                                        <%-- <th style="width: 5%;"></th>--%>
                                    </tr>
                                </thead>


                                <tbody></tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-success" id="btnGetGeneralCriteria">Apply Criteria</button>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="modal fade" id="SpecificExpertCriteriaValue" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="margin-left: -319px; width: 210%;">
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="font-size: 15px; font-weight: bold; text-decoration: none; display: inline-block;" id="exampleModalLabelPolicys">Specific Expert Criteria</h5>

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="height: 600px; overflow: scroll;">

                                        <%--    <div class="row">
                                            <div class="col-sm-12" style="display: -webkit-inline-box;">
                                                <div class="col-sm-3">
                                                    <label class="labelData">Client:</label>
                                                    <label class="labelDataStyle" id="lblClient"></label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="labelData">Specific Expert Master:</label>
                                                    <label class="labelDataStyle" id="lblSpecificExpertmaster"></label>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label class="labelData">Date:</label>
                                                    <label class="labelDataStyle" id="lblDate"></label>
                                                </div>



                                            </div>
                                        </div>--%>


                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Apply Parameters</div>
                                            <div class="panel-body">
                                                <%-- Parameter Section Start--%>
                                                <div class="row">

                                                    <div class="col-md-3 position-relative">
                                                        <div class="form-group">

                                                            <label class="control-label">Criteria:</label>
                                                            <div class="dropdown">

                                                                <button id="SpecificbtnCriteria" style="width: 250px; border-color: gainsboro;" class="btn btn-default dropdown-toggle form-control" type="button" data-condcol="" data-toggle="dropdown">
                                                                    <span>Select Criteria</span>

                                                                </button>
                                                                <ul class="dropdown-menu" style="width: 250px; height: 350px; overflow: scroll;">

                                                                    <li class="dropdown-submenuSpecific"></li>
                                                                </ul>

                                                                <ul id="submenuSpecific" class="dropdown-menu" style="margin-left: 250px; display: none; width: 250px; height: 350px; overflow: scroll">
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
                                                    <div class="col-md-3 position-relative">
                                                        <div class="form-group">
                                                            <label class="control-label">Expert Master:</label>
                                                            <select id="ddlExpertMasterSpecific" class="form-control"></select>
                                                        </div>
                                                    </div>
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
                                                            <%-- <button type="button" style="display: none" class="btn btn-success" id="btnUptGEC">Update</button>--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <br />
                                                <div class="row">
                                                    <div class="col-sm-12">

                                                        <table id="tblExpertCriteriaSpecific">
                                                            <thead>
                                                                <tr>

                                                                    <%--                                                                    <th style="width: 15%; display: none"></th>--%>
                                                                    <th style="width: 15%;">Criteria</th>
                                                                    <th style="width: 15%;">Condition</th>
                                                                    <th style="width: 15%;">Value 1</th>
                                                                    <th style="width: 15%;">Value 2</th>
                                                                    <th style="width: 5%;">Active</th>
                                                                    <th style="width: 5%;"></th>
                                                                    <%--<th style="width: 5%;"></th>--%>
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
                                                                <button type="button" style="margin-left: 91px;" class="btn btn-success" id="btnSpecificSearchCondition">Search</button>
                                                            </div>
                                                            <div class="col-md-4">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" id="SpecificConditionTblDiv">
                                                        <div class="col-sm-12">

                                                            <table id="tblSpecificSearchCondtion">
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




                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-12">

                                                        <button type="button" style="display: none; margin-left: 451px;" class="btn btn-success" id="btnShowConstraintModal">Apply Constraint</button>
                                                    </div>

                                                </div>
                                                <%-- Parameter Section end--%>
                                            </div>

                                            <div class="panel panel-primary" style="display: none" id="ConstraintPanel">
                                                <div class="panel-heading">Apply Constraint</div>
                                                <div class="panel-body">




                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="col-md-3">


                                                                <label class="control-label">Criteria:</label>
                                                                <div class="dropdown">

                                                                    <button id="SpecificbtnCriteriaConstraint" style="width: 250px; border-color: gainsboro;" class="btn btn-default dropdown-toggle form-control" type="button" data-condcol="" data-toggle="dropdown">
                                                                        <span>Select Criteria</span>

                                                                    </button>
                                                                    <ul class="dropdown-menu" style="width: 250px; height: 350px; overflow: scroll;">

                                                                        <li class="dropdown-submenuspecificContraint"></li>
                                                                    </ul>

                                                                    <ul id="submenuspecificContraint" class="dropdown-menu" style="margin-left: 250px; display: none; width: 250px; height: 350px; overflow: scroll">
                                                                    </ul>
                                                                </div>


                                                            </div>
                                                            <div class="col-md-3">

                                                                <label class="control-label">Condition:</label>
                                                                <select id="ddlConditionConstraint" class="form-control"></select>


                                                            </div>
                                                            <div class="col-md-3">

                                                                <label class="control-label">Value 1:</label>
                                                                <select id="ddlValueOneConstraint" class="form-control"></select>


                                                            </div>
                                                            <div class="col-md-3" id="ddlval2Constraint" style="display: none">
                                                                <label class="control-label">Value 2:</label>
                                                                <select id="ddlValueTwoConstraint" class="form-control"></select>

                                                            </div>

                                                            <div class="col-md-3 position-relative">
                                                                <div class="form-group">
                                                                    <label class="control-label">Expert Master:</label>
                                                                    <select id="ddlExpertMasterSpecificConstraint" class="form-control"></select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label class="control-label">Active:</label>
                                                                <br />

                                                                <label>
                                                                    <input id="chkCritActiveConstraint" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
                                                                        type="checkbox">
                                                                    <span class="cr"><i class=""></i></span>
                                                                    Yes / No
                                                                </label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">



                                                            <div class="col-md-3">
                                                                <br />
                                                                <%-- <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>--%>
                                                                <button type="button" class="btn btn-success" id="btnAddCriteraValueConstraint">Add</button>
                                                                <button type="button" style="display: none" class="btn btn-success" id="btnUptGECConstraint">Update</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <table id="tblExpertCriteriaGeneralConstraint">
                                                                <thead>
                                                                    <tr>


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
                                                                    <button type="button" style="margin-left: 91px;" class="btn btn-success" id="btnSearchConditionConstraint">Search</button>
                                                                </div>
                                                                <div class="col-md-4">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row" style="display: none" id="ConstraintConditionTblDiv">
                                                            <div class="col-sm-12">

                                                                <table id="tblSearchConstraintCondtion">
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

                GetGeneralExpertDropDown();
                GetConditonDropdown();
                //GetCriteriadropdown();
                //GetCompanyDropDown();
                //GetProductDropDown();
                GetSpecificExpertDetail();
                //GetGeneralExpertDropDown();
                //GetGeneralExpertDetail();
                //GetCategoryDropDown();
                GetSpecificExpertDropDown();
                GetSpecificClientDropdown();
                GetCriteriaDropDown();

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

                    InsertSpecificExpertDetail();


                });




                $("#btnAddCriteraValue").click(function () {


                    InsertExpertCriteriaSpecific();


                });
                $("#btnAddCriteraValueConstraint").click(function () {


                    InsertExpertCriteriaSpecificConstraint();
                    GetExpertCriteriaSpecificConstraint();


                });
                $("#btnSpecificSearchCondition").click(function () {


                    SearchSpecificConditionWiseCriteria();


                });


            });

        </script>
</asp:Content>

