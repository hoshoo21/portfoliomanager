<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ExpertCriteriaGeneral.aspx.cs" Inherits="Portfolio.ExpertCriteriaGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">General Expert Criteria</h4>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="row">

                            <div class="col-md-3 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Expert Master:</label>
                                    <select id="ddlExpertMaster" class="form-control"></select>

                                </div>
                            </div>
                            <div class="col-md-3 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Criteria:</label>
                                    <select id="ddlCriteria" class="form-control"></select>

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
                               <div class="col-md-3 position-relative" id="ddlval2" style="display:none" >
                                <div class="form-group">
                                    <label class="control-label">Value 2:</label>
                                    <select id="ddlValueTwo" class="form-control"></select>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Active:</label>
                                <div class="checkbox">

                                    <label>
                                        <input id="chkActive" type="checkbox" />
                                        <span class="cr"><i class=""></i></span>
                                        Yes / No
                                    </label>
                                </div>

                            </div>




                        </div>
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table id="tblExpertResult" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th id="tblProduct-1" data-priority="1">Result ID</th>
                                                <th id="tblProduct-2" data-priority="1">Constituent</th>
                                                <th data-priority="1">DateTime</th>
                                                <th data-priority="1">User</th>
                                                <th data-priority="1">Active</th>
                                                <th></th>
                                                <th></th>




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
       
           
            GetGeneralExpertDropDown();
            GetConditonDropdown();
            GetCriteriadropdown();
            LoadExpertResult('');
            $('#ddlCriteria').on('change', function () {
                var criCode = this.value;
                bindValue(criCode);
            });
            $('#ddlCondition').on('change', function () {
                var conditon = this.options[this.selectedIndex].text;
             
                if (conditon == 'Between')
                {
                    $('#ddlval2').show();
                }
                else {
                    $('#ddlval2').hide();
                }

            });
            
            $("#btnAdd").click(function () {

                InsertExpertCriteriaGeneral();


            });
            $("#btnUpdate").click(function () {
                //UpdateGeneralExpert();
            });

        });

    </script>

</asp:Content>
