<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XBRL.aspx.cs" Inherits="Portfolio.XBRL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('label.tree-toggler').click(function () {
                $(this).parent().children('ul.tree').toggle(300);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="well" style="width: 300px; padding: 8px 0;">
                    <div style="overflow-y: scroll; overflow-x: hidden; height: 500px;">
                        <ul class="nav nav-list">
                            <li>
                                <label class="tree-toggler nav-header">Back To Portfolio</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="Category.aspx" target="_blank">Portfolio Setup</a></li>
                                </ul>
                            </li>

                            <li>
                                <label class="tree-toggler nav-header">User Control Setups</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="AddUser.aspx" target="_blank">Add New User</a></li>
                                    <li><a href="AddProject.aspx" target="_blank">Add Project</a></li>
                                    <li><a href="UserTickerMap.aspx" target="_blank">User Ticker Map</a></li>
                                    <li><a href="UserControl.aspx" target="_blank">User Control</a></li>
                                    <li><a href="UserControlMap.aspx" target="_blank">User Control Map</a></li>

                                </ul>
                            </li>


                            <li>
                                <label class="tree-toggler nav-header">Questionaries</label>
                                <ul class="nav nav-list tree" style="display: none">



                                    <li>
                                        <label class="tree-toggler nav-header">Questions</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="QuestionSetup.aspx" target="_blank">Question Setup</a></li>
                                            <li><a href="QuestionTypeSetup.aspx" target="_blank">Question Category Setup</a></li>
                                            <%--  <li><a href="#">Link</a></li>--%>
                                            <%--  <li><label class="tree-toggler nav-header">Header 1.1.1</label>
                                        <ul class="nav nav-list tree">
                                            <li><a href="#">Link</a></li>
                                            <li><a href="#">Link</a></li>
                                        </ul>
                                    </li>--%>
                                        </ul>

                                    </li>
                                    <li>
                                        <label class="tree-toggler nav-header">Answer</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="AnswerSetup.aspx" target="_blank">Answer Setup</a></li>


                                        </ul>

                                    </li>
                                    <li>
                                        <label class="tree-toggler nav-header">Rsik Tolerence Definition</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="InvestorProfileStatusSetup.aspx" target="_blank">Rsik Tolerence Setup </a></li>


                                        </ul>

                                    </li>
                                    <li>
                                        <label class="tree-toggler nav-header">Investor Questionarie</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="Questionnaire.aspx" target="_blank">Investor Questionarie</a></li>


                                        </ul>

                                    </li>
                                    <li>
                                        <label class="tree-toggler nav-header">Asset</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="AssetSetup.aspx" target="_blank">Asset Definition Setup</a></li>


                                        </ul>

                                    </li>
                                    <li>
                                        <label class="tree-toggler nav-header">Risk Tolerence Map With Asset</label>
                                        <ul class="nav nav-list tree" style="display: none">
                                            <li><a href="AssetMapRiskTolerence.aspx" target="_blank">Risk Tolerence Map With Asset Setup</a></li>


                                        </ul>

                                    </li>
                                </ul>
                            </li>

                            <li>
                                <label class="tree-toggler nav-header">Company</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="CompanySetupXBRL.aspx" target="_blank">Company Setup</a></li>
                                </ul>
                            </li>

                            <li>
                                <label class="tree-toggler nav-header">Country</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="CountrySetupXBRL.aspx" target="_blank">Country Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Multi Year Interface Upload</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="MultiYearInterface.aspx" target="_blank">Upload Interface Excel</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Reporting Structure</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="ReportingStructure.aspx" target="_blank">Reporting Structure Setup</a></li>
                                </ul>
                            </li>

                            <li>
                                <label class="tree-toggler nav-header">Association</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="AssociationSetup.aspx" target="_blank">Association Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Variable</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="VariableSetup.aspx" target="_blank">Variable Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Financial Analysis</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="FinancialAnalysis.aspx" target="_blank">Financial Analysis Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Standard</label>
                                <ul class="nav nav-list tree" style="display: none">
                                      <li><a href="StandardType.aspx" target="_blank">Standard Type Setup</a></li>
                                    <li><a href="StandardSetup.aspx" target="_blank">Standard Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Formula</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="FormulaSetup.aspx" target="_blank">Formula Setup</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Monthly Element Value</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="MonthlyElementValue.aspx" target="_blank">Monthly Element Value</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Upload Setups</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="UploadCompany.aspx" target="_blank">Company Upload</a></li>
                                    <li><a href="UploadStockPrice.aspx" target="_blank">Stock Price Upload</a></li>


                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Element Nature Setups</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="PAK_ELEMENT_NATURE.aspx" target="_blank">Element Nature</a></li>
                                    <li><a href="PAK_ELEMENT_MASTERSHEET.aspx" target="_blank">Element Master sheet</a></li>


                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Criteria Condition Map</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="CriteriaMap.aspx" target="_blank">Criteria Condition Map</a></li>



                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Fortfolio Product</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="PfolioProduct.aspx" target="_blank">Fortfolio Product</a></li>



                                </ul>
                            </li>

                            <li>
                                <label class="tree-toggler nav-header">Asset Nature</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="AssetNature.aspx" target="_blank">Asset Nature</a></li>
                                </ul>
                            </li>
                            <li>
                                <label class="tree-toggler nav-header">Product Class Weight</label>
                                <ul class="nav nav-list tree" style="display: none">
                                    <li><a href="ProductClassWeight.aspx" target="_blank">Product Class Weight</a></li>
                                </ul>
                            </li>

                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
