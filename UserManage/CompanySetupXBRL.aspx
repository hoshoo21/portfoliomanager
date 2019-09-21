<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanySetup.aspx.cs" Inherits="Portfolio.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>XBRL</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/XBRL.css" rel="stylesheet" />

    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            //GetSector();
            GetCountry();
            //GetCountry();
            //GetCountry();
            GetCompany();
            $('#btnAdd').click(function () {

                GetInsertCompany();
            });
            $('#btnUpdate').click(function () {

                GetUpdateCompany();
            });
            $('#btnUpdate').hide();

            $('#ddlCountry').on('change', function () {

                var countryCode = this.value;
                GetStockExch(countryCode);
                GetNAICS(countryCode);
                GetSIC(countryCode);
                GetSector(countryCode);


            });

        });


        //function GetSector() {
        //    $.ajax({
        //        url: "api/XBRL/GETSector",
        //        data: {},
        //        type: 'GET',
        //        dataType: 'json',
        //        success: function (data) {
        //            console.log(data);
        //            $('#ddlSector').empty();
        //            $('#ddlSector').append($('<option>').text("Select Sector"));

        //            $.each(data, function (i, value) {
        //                $('#ddlSector').append($('<option>').text(value.SECTOR_DESC).attr('value', value.SECTOR_CODE));

        //            });




        //        },
        //        error: function (request) {
        //            //notifyError('Saving User Detail failed!');

        //        }
        //    });
        //}

        //function GetIndustory() {
        //    $.ajax({
        //        url: "api/XBRL/GETIndustory",
        //        data: {},
        //        type: 'GET',
        //        dataType: 'json',
        //        success: function (data) {
        //            console.log(data);
        //            $('#ddlIndustory').empty();
        //            $('#ddlIndustory').append($('<option>').text("Select Industory"));

        //            $.each(data, function (i, value) {
        //                $('#ddlIndustory').append($('<option>').text(value.INDUSTRY_DESC).attr('value', value.INDUSTRY_CODE));

        //            });




        //        },
        //        error: function (request) {
        //            //notifyError('Saving User Detail failed!');

        //        }
        //    });
        //}
        function GetNAICS(countryCode) {

            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'NAICS'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    $('#ddlNAICS').empty();


                    $.each(data, function (i, value) {
                        $('#ddlNAICS').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));

                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetSIC(countryCode) {
            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'SIC'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    $('#ddlIndustory').empty();


                    $.each(data, function (i, value) {
                        $('#ddlIndustory').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));

                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }
        function GetSector(countryCode) {
            if (countryCode == '003') {
                countryCode = countryCode;
            }
            else {
                countryCode = '';
            }
            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'SECTOR'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    $('#ddlSector').empty();


                    $.each(data, function (i, value) {
                        $('#ddlSector').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));

                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetStockExch(countryCode) {
            var ajax_data = {
                countryCode
            };
            $.ajax({
                url: "api/XBRL/GetstockExchange",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#ddlStockExchange').empty();


                    $.each(data, function (i, value) {
                        $('#ddlStockExchange').append($('<option>').text(value.EXCHANGE_NAME).attr('value', value.EXCHANGE_CODE));

                    });




                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetNAICSUpdate(countryCode,niacsValue) {

            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'NAICS'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {



                    $.each(data, function (i, value) {
                        $('#ddlNAICS').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));
                         $("#ddlNAICS").val(niacsValue).attr("selected", "selected");
                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }


        function GetSICUpdate(countryCode,sicValue) {
            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'SIC'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                   


                    $.each(data, function (i, value) {
                        $('#ddlIndustory').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));
                         $("#ddlIndustory").val(sicValue).attr("selected", "selected");
                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }
         function GetSectorUpdate(countryCode,sectvalue) {
            if (countryCode == '003') {
                countryCode = countryCode;
            }
            else {
                countryCode = '';
            }
            var ajax_data = {
                countryCode: countryCode,
                stockExc: 'SECTOR'

            };

            $.ajax({
                url: "api/XBRL/GetReportingStuctCount",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                 

                    $.each(data, function (i, value) {
                        $('#ddlSector').append($('<option>').text(value.STRUCTURE_DESCRIPTION).attr('value', value.STRUCTURE_VALUE));
                         $("#ddlSector").val(sectvalue).attr("selected", "selected");
                    });

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }

        function GetCountry() {

            var ajax_data = {

            };

            $.ajax({
                url: "api/XBRL/GetCountrySpecific",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {



                    $('#ddlCountry').empty();

                    $('#ddlCountry').append($('<option>').text("Select Country"));
                    $.each(data, function (i, value) {
                        $('#ddlCountry').append($('<option>').text(value.COUNTRY_DESC).attr('value', value.COUNTRY_CODE));

                    });



                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetInsertCompany() {

            var indcode = document.getElementById("ddlIndustory").value;

            var sector = document.getElementById("ddlSector").value;
            var country = document.getElementById("ddlCountry").value;
            var stockExc = document.getElementById("ddlStockExchange").value;
            var naics = document.getElementById("ddlNAICS").value;
            var ajax_data = {
                compCode: $('#txtCompanyCode').val(),
                compName: $('#txtCompanyName').val(),
                compSymbol: $('#txtCompanySymbol').val(),
                regNo: $('#txtRegNo').val(),
                ntn: $('#txtNTN').val(),
                indCode: indcode,
                sector: sector,
                countReg: $('#txtCountryReg').val(),
                PassEndDate: $('#txtNFiscalEnddate').val(),
                stateLoc: $('#txtStateLoc').val(),
                sataInc: $('#txtStateInc').val(),
                LocFlag: $('#txtLocFlag').val(),
                annualRep: $('#txtAnualReportCode').val(),
                mc: $('#txtMC').val(),
                oclause: $('#txtClause').val(),
                count: country,
                stockExc: stockExc,
                repCurrency: $('#txtReportingCurrency').val(),
                naics: naics

            };
            $.ajax({
                url: "api/XBRL/GetInsertCompany",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert('Add Successfully !')
                    GetCompany();
                    document.getElementById("txtCompanyCode").value = "";
                    document.getElementById("txtCompanyName").value = "";
                    document.getElementById("txtCompanySymbol").value = "";
                    document.getElementById("txtRegNo").value = "";
                    document.getElementById("txtNTN").value = "";
                    document.getElementById("txtCountryReg").value = "";
                    document.getElementById("txtNFiscalEnddate").value = "";
                    document.getElementById("txtStateLoc").value = "";
                    document.getElementById("txtStateInc").value = "";
                    document.getElementById("txtLocFlag").value = "";
                    document.getElementById("txtAnualReportCode").value = "";
                    document.getElementById("txtMC").value = "";
                    document.getElementById("txtClause").value = "";
                    document.getElementById("txtReportingCurrency").value = "";
                    document.getElementById("ddlIndustory").value = null;
                    document.getElementById("ddlSector").value = null;
                    document.getElementById("ddlCountry").value = null;
                    document.getElementById("ddlStockExchange").selectedIndex = "0";
                    document.getElementById("ddlNAICS").value = null;





                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
        function GetCompany() {

            $.ajax({
                url: "api/XBRL/GetCompany",
                type: 'GET',
                dataType: 'json',
                data: '',
                success: function (data) {

                    LoadCompany(data);


                },
                error: function (request) {
                    //notifyError('Data Load failed!');

                }
            });

        }
        function LoadCompany(data) {

            debugger
            if ($.fn.dataTable.isDataTable('#tblCompany')) {
                accounttablevar = $('#tblCompany').DataTable().clear().destroy();
            }
            var accounttablevar = $('#tblCompany').DataTable({
                orderCellsTop: true,
                fixedHeader: true,

                "language": {
                    "info": "_END_ of _TOTAL_"
                },
                bAutoWidth: false,

                responsive: {
                    details: {
                        type: 'column',
                        target: 'tr'
                    }
                },

                "sPaginationType": "simple",
                data: data,

                dom: 'Bfrtip',
                select: true,


                "columns": [


                    { "data": "COMPANY_CIK" },
                    { "data": "COMPANY_NAME" },
                    { "data": "COMPANY_SYMBOL" },

                    { "data": "INDUSTRY_DESC" },
                    { "data": "SECTOR_DESC" },
                    { "data": "EXCHANGE_NAME" },
                    { "data": "COUNTRY_DESC" },
                    {
                        "date": "COMPANY_CIK",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnCompanyEdit(\'' + full["COMPANY_CIK"] + '\')"></input>';

                        }
                    },

                    {
                        "date": "COMPANY_CIK",

                        "mRender": function (data, type, full, meta) {

                            return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnCompanyDelte(\'' + full["COMPANY_CIK"] + '\')"></input>';

                        }
                    },



                ],

            });


        }
        function OnCompanyDelte(COMPANY_CIK) {
            debugger
            if (confirm("Are you sure you want to Delete?")) {
                var ajax_data = {
                    compayCode: COMPANY_CIK
                };

                $.ajax({
                    url: "api/XBRL/GETDeleteCompany",
                    data: ajax_data,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        alert('Delete Successfully');
                        GetCompany();


                    },
                    error: function (request) {
                        //notifyError('Saving User Detail failed!');

                    }
                });
            }
            else {

            }

        }


        function OnCompanyEdit(COMPANY_CIK) {

            var ajax_data = {
                compayCode: COMPANY_CIK
            };

            $.ajax({
                url: "api/XBRL/GetCompanyDetail",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data)
                    if (data.length > 0) {


                        document.getElementById("txtCompanyCode").value = data[0].COMPANY_CIK;
                        document.getElementById("txtCompanyName").value = data[0].COMPANY_NAME;
                        document.getElementById("txtCompanySymbol").value = data[0].COMPANY_SYMBOL;
                        document.getElementById("txtRegNo").value = data[0].REGISTRATION_NUMBER;
                        document.getElementById("txtNTN").value = data[0].NTN;
                        document.getElementById("txtCountryReg").value = data[0].COUNTRY_OF_REGISTRATION;
                        document.getElementById("txtNFiscalEnddate").value = data[0].FISCAL_YEAR_END_DATE;
                        document.getElementById("txtStateLoc").value = data[0].STATE_LOCATION;
                        document.getElementById("txtStateInc").value = data[0].STATE_INC;
                        document.getElementById("txtLocFlag").value = data[0].LOCK_FLAG;
                        document.getElementById("txtAnualReportCode").value = data[0].ANNUAL_REPORTING_CODE;
                        document.getElementById("txtMC").value = data[0].MC;
                        document.getElementById("txtClause").value = data[0].OCLAUSE;
                        document.getElementById("txtReportingCurrency").value = data[0].REPORTING_CURRENCY;

                        GetCompanyReportingStructure(COMPANY_CIK);
                        //document.getElementById("ddlIndustory").value = data[0].INDUSTRY_CODE;
                        //document.getElementById("ddlSector").value = data[0].SECTOR_CODE;
                        //document.getElementById("ddlCountry").value = data[0].COUNTRY_CODE;
                        //document.getElementById("ddlStockExchange").value = data[0].STOCK_EXCHANGE_CODE;
                        //$('#ddlIndustory').empty();
                        //$('#ddlIndustory').append($('<option>').text(data[0].INDUSTRY_DESC).attr('value', data[0].INDUSTRY_CODE));
                        //$('#ddlSector').empty();
                        //$('#ddlSector').append($('<option>').text(data[0].SECTOR_DESC).attr('value', data[0].SECTOR_CODE));
                        //$('#ddlCountry').empty();
                        //$('#ddlCountry').append($('<option>').text(data[0].COUNTRY_DESC).attr('value', data[0].COUNTRY_CODE));
                        //$('#ddlNAICS').empty();
                        //$('#ddlNAICS').append($('<option>').text(data[0].STRUCTURE_DESCRIPTION).attr('value', data[0].STRUCTURE_VALUE));

                        $('#btnAdd').hide();
                        $('#btnUpdate').show();
                        //$('#btnAdd').val('Update');
                    }


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        }

        function GetCompanyReportingStructure(compayCode) {
            var ajax_data = {
                compayCode: compayCode
            };

            $.ajax({
                url: "api/XBRL/GetComReptStruct",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    if (data.length > 0) {
                        debugger
                        var countCode = data[0].COUNTRY_CODE;
                        var niacsValue = data[0].STRUCTURE_VALUE;
                        var sectvalue = data[1].STRUCTURE_VALUE;
                        var sicValue = data[2].STRUCTURE_VALUE;

                        
                       
                        
                        
                        GetNAICSUpdate(countCode,niacsValue);
                        GetSICUpdate(countCode,sicValue);
                        GetSectorUpdate(countCode,sectvalue);
                        
                        GetStockExch(countCode);
                         $("#ddlCountry").val(countCode);
                       
                        $
                       
                    }


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });


        }

        function GetUpdateCompany() {
            var indcode = document.getElementById("ddlIndustory").value;
            var sector = document.getElementById("ddlSector").value;
            var country = document.getElementById("ddlCountry").value;
            var stockExc = document.getElementById("ddlStockExchange").value;
            var naics = document.getElementById("ddlNAICS").value;
            var ajax_data = {
                compCode: $('#txtCompanyCode').val(),
                compName: $('#txtCompanyName').val(),
                compSymbol: $('#txtCompanySymbol').val(),
                regNo: $('#txtRegNo').val(),
                ntn: $('#txtNTN').val(),
                indCode: indcode,
                sector: sector,
                countReg: $('#txtCountryReg').val(),
                PassEndDate: $('#txtNFiscalEnddate').val(),
                stateLoc: $('#txtStateLoc').val(),
                sataInc: $('#txtStateInc').val(),
                LocFlag: $('#txtLocFlag').val(),
                annualRep: $('#txtAnualReportCode').val(),
                mc: $('#txtMC').val(),
                oclause: $('#txtClause').val(),
                count: country,
                stockExc: stockExc,
                repCurrency: $('#txtReportingCurrency').val(),
                naics: naics
            };
            $.ajax({
                url: "api/XBRL/GetUpdateCompany",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert('Update Successfully !')

                    document.getElementById("txtCompanyCode").value = "";
                    document.getElementById("txtCompanyName").value = "";
                    document.getElementById("txtCompanySymbol").value = "";
                    document.getElementById("txtRegNo").value = "";
                    document.getElementById("txtNTN").value = "";
                    document.getElementById("txtCountryReg").value = "";
                    document.getElementById("txtNFiscalEnddate").value = "";
                    document.getElementById("txtStateLoc").value = "";
                    document.getElementById("txtStateInc").value = "";
                    document.getElementById("txtLocFlag").value = "";
                    document.getElementById("txtAnualReportCode").value = "";
                    document.getElementById("txtMC").value = "";
                    document.getElementById("txtClause").value = "";
                    document.getElementById("txtReportingCurrency").value = "";
                    document.getElementById("ddlIndustory").value = null;
                    document.getElementById("ddlSector").value = null;
                    document.getElementById("ddlCountry").value = null;
                    document.getElementById("ddlStockExchange").selectedIndex = "0";
                    document.getElementById("ddlNAICS").value = null;
                    $('#btnUpdate').hide();
                    $('#btnAdd').show();
                    GetCompany();


                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }
    </script>
    <style type="text/css">
       
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Company Setup</h1>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label class="control-label">Company Code:</label>
                        <input id="txtCompanyCode" placeholder="Please Enter Compnay Code" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Company Name:</label>
                        <input id="txtCompanyName" placeholder="Please Enter Compnay Name" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Company Symbol:</label>
                        <input id="txtCompanySymbol" placeholder="Please Enter Company Symbol" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Registration No:</label>
                        <input id="txtRegNo" placeholder="Please Enter Registration #" class="form-control" />
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label class="control-label">NTN:</label>
                        <input id="txtNTN" placeholder="Please Enter NTN" class="form-control" />
                    </div>

                    <div class="col-sm-3">
                        <label class="control-label">Country Registration:</label>
                        <input id="txtCountryReg" placeholder="Please Enter Country Registration" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Reporting Currency:</label>
                        <input id="txtReportingCurrency" placeholder="Please Enter Reporting Currency" class="form-control" />
                    </div>

                    <div class="col-sm-3">
                        <label class="control-label">O Clause:</label>
                        <input id="txtClause" placeholder="Please Enter O Clause" class="form-control" />
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label class="control-label">Fiscal End Date:</label>
                        <input id="txtNFiscalEnddate" placeholder="Please Enter Fiscal End Date" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">State Location:</label>
                        <input id="txtStateLoc" placeholder="Please Enter State Location" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">State Inc:</label>
                        <input id="txtStateInc" placeholder="Please Enter State Inc" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Loc Flag:</label>
                        <input id="txtLocFlag" placeholder="Please Enter Loc Flag" class="form-control" />
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label class="control-label">Anual Reporting Code:</label>
                        <input id="txtAnualReportCode" placeholder="Please Enter Anual Reporting Code:" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">MC:</label>
                        <input id="txtMC" placeholder="Please Enter MC" class="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Country:</label>
                        <select id="ddlCountry" class="form-control"></select>
                        <%--<input id="txtCountry" placeholder="Please Enter Country" class="form-control" />--%>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Stock Exchange:</label>
                        <select id="ddlStockExchange" class="form-control"></select>
                    </div>

                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">

                    <div class="col-sm-3">
                        <label class="control-label">Industry Code:</label>
                        <select id="ddlIndustory" class="form-control"></select>

                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">Sector:</label>
                        <select id="ddlSector" class="form-control"></select>

                    </div>
                    <div class="col-sm-3">
                        <label class="control-label">NAICS:</label>
                        <select id="ddlNAICS" class="form-control"></select>
                        <%--<input id="txtCountry" placeholder="Please Enter Country" class="form-control" />--%>
                    </div>

                    <div class="col-sm-3">
                        <br />
                        <input type="button" class="btn btn-success" id="btnAdd" onclick="javascript: return false;" value="ADD" />
                        <input type="button" class="btn btn-success" id="btnUpdate" onclick="javascript: return false;" value="UPDATE" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">

                    <div class="table-responsive">
                        <table id="tblCompany" class="display" style="width: 100%">
                            <thead>
                                <tr>

                                    <th>Company Code</th>
                                    <th>Company Name:</th>
                                    <th>Company Symbol:</th>
                                    <th>Industry</th>
                                    <th>Sector</th>

                                    <th>Stock Exchange</th>
                                    <th>Country</th>
                                    <th></th>
                                    <th></th>



                                </tr>
                            </thead>


                            <tbody></tbody>
                        </table>
                    </div>

                </div>
            </div>


        </div>
    </form>
</body>
</html>
