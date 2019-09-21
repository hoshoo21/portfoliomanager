<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SpecificExpert.aspx.cs" Inherits="Portfolio.SpecificExpert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card card-outline-success" style="margin-top: -21px">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Specific Expert</h4>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="row p-t-20">
                            <div class="col-md-6 position-relative">
                                <div class="form-group">
                                    <label class="control-label">Specific Expert:</label>
                                    <input type="text" class="form-control" placeholder="Please enter Specific Expert" id="txtSpecificExpert" />

                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Active:</label>
                                <br />

                                <label>
                                    <input id="chkSGEActive" style="position: relative; display: inline-block; border: 1px solid #a9a9a9; border-radius: .25em; width: 1.3em; height: 1.3em; float: left; margin-right: .5em;"
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
                                    <table id="tblSpecificExpert" class="display" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th id="tblProduct-1" data-priority="1">Specific Expert Code</th>
                                                <th id="tblProduct-2" data-priority="1">Description</th>
                                                <th id="tblProduct-3" data-priority="1">Active</th>
                                                <th style="width: 5%;"></th>
                                                <th style="width: 5%;"></th>



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

            $("#btnAdd").click(function () {

                if ($.trim($('#txtSpecificExpert').val()) == '') {
                    $('#txtSpecificExpert').css("border-color", "red");

                }
                else {
                    InsertSpecificExpert();
                }
            });
          


            GetSpecificExpert();
        });
    </script>
</asp:Content>
