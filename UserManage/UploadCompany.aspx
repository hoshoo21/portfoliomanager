<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadCompany.aspx.cs" Inherits="Portfolio.UploadCompany" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/jszip.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {

            $('#uploadfile').click(function () {

                var fileUpload = document.getElementById("fileUpload");

                //Validate whether File is valid Excel file.
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$/;
                if (regex.test(fileUpload.value.toLowerCase())) {
                    if (typeof (FileReader) != "undefined") {
                        var reader = new FileReader();

                        //For Browsers other than IE.
                        if (reader.readAsBinaryString) {
                            reader.onload = function (e) {
                                ProcessExcel(e.target.result);
                            };
                            reader.readAsBinaryString(fileUpload.files[0]);
                            alert('Upload Excel Data Successfully !');
                        } else {
                            //For IE Browser.
                            reader.onload = function (e) {
                                var data = "";
                                var bytes = new Uint8Array(e.target.result);
                                for (var i = 0; i < bytes.byteLength; i++) {
                                    data += String.fromCharCode(bytes[i]);

                                }
                                ProcessExcel(data);
                            };
                            reader.readAsArrayBuffer(fileUpload.files[0]);

                        }
                    } else {
                        alert("This browser does not support HTML5.");
                    }
                } else {
                    alert("Please upload a valid Excel file.");
                }


            });

        });

        function ProcessExcel(data) {
            debugger
           
            //Read the Excel File data.
            var workbook = XLSX.read(data, {
                type: 'binary'
            });

            //Fetch the name of First Sheet.
            var firstSheet = workbook.SheetNames[0];

            //Read all rows from First Sheet into an JSON array.

            var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);
             console.log(excelRows)
            var compCode, compName, compSymbol, regNo, ntn, indCode,
                sector, FiscalEndDate, stateLoc, sataInc, LocFlag, annualRep, mc, oclause, country, stockExc, naics;
            //Add the data rows from Excel file.
            															

            for (var i = 0; i < excelRows.length; i++) {


                //Add the data cells.
                if (excelRows[i]['Company_Code'] == null) {
                    compCode = "";
                } else {
                    compCode = excelRows[i]['Company_Code'];
                }


                if (excelRows[i]['Company_Name'] == null) {
                    compName = "";
                }
                else {
                    compName = excelRows[i]['Company_Name'];
                }
                if (excelRows[i]['Company_Symbol'] == null) {
                    compSymbol = "";
                }
                else {
                    compSymbol = excelRows[i]['Company_Symbol'];
                }


                if (excelRows[i]['REGISTRATION_NUMBER'] == null) {
                    regNo = "";

                } else {
                    regNo = excelRows[i]['REGISTRATION_NUMBER'];
                }

                if (excelRows[i]['NTN'] == null) {
                    ntn = "";
                }
                else {
                    ntn = excelRows[i]['NTN'];
                }


                if (excelRows[i]['INDUSTRY_CODE'] == null) {
                    indCode = "";
                }
                else {
                    indCode = excelRows[i]['INDUSTRY_CODE'];
                }

                if (excelRows[i]['SECTOR_CODE'] == null) {
                    sector = "";
                }
                else {
                    sector = excelRows[i]['SECTOR_CODE'];

                }

                if (excelRows[i]['FISCAL_YEAR'] == null) {
                    FiscalEndDate = "";
                }
                else {
                    FiscalEndDate = excelRows[i]['FISCAL_YEAR'];
                }
               
                if (excelRows[i]['STATE_LOCATION'] == null) {
                    stateLoc = "";
                }
                else {
                    stateLoc = excelRows[i]['STATE_LOCATION'];
                }

                if (excelRows[i]['STATE_INC'] == null) {
                    sataInc = "";
                }
                else {
                    sataInc = excelRows[i]['STATE_INC'];

                }
                 if (excelRows[i]['LOCK_FLAG'] == null) {
                    LocFlag = "";
                }
                else {
                    LocFlag = excelRows[i]['LOCK_FLAG'];

                }
                if (excelRows[i]['ANNUAL_REPORTING_CODE'] == null) {
                    annualRep = "";
                }
                else {
                    annualRep = excelRows[i]['ANNUAL_REPORTING_CODE'];

                }

                if (excelRows[i]['MC'] == null) {
                    mc = "";
                }
                else {
                    mc = excelRows[i]['MC'];

                }
                if (excelRows[i]['OCLAUSE'] == null) {
                    oclause = "";
                }
                else {
                    oclause = excelRows[i]['OCLAUSE'];

                }
                if (excelRows[i]['COUNTRY_CODE'] == null) {
                    country = "";
                }
                else {
                    country = excelRows[i]['COUNTRY_CODE'];

                }
                if (excelRows[i]['STOCK_EXCHANGE_CODE'] == null) {
                    stockExc = "";
                }
                else {
                    stockExc = excelRows[i]['STOCK_EXCHANGE_CODE'];

                }
                if (excelRows[i]['NAICS_CODE'] == null) {
                    naics = "";
                }
                else {
                    naics = excelRows[i]['NAICS_CODE'];

                }
               
                insertExcelData(compCode, compName, compSymbol, regNo, ntn, indCode,
                sector, FiscalEndDate, stateLoc, sataInc, LocFlag, annualRep, mc, oclause, country, stockExc, naics);
            }


        };
        function insertExcelData(compCode, compName, compSymbol, regNo, ntn, indCode,
                sector, FiscalEndDate, stateLoc, sataInc, LocFlag, annualRep, mc, oclause, country, stockExc, naics) {
            debugger
            var ajax_data = {
                compCode: compCode,
                compName: compName,
                compSymbol: compSymbol,
                regNo: regNo,
                ntn: ntn,
                indCode: indCode,
                sector: sector,
                countReg: "",
                PassEndDate: FiscalEndDate,
                stateLoc: stateLoc,
                sataInc: sataInc,
                LocFlag: LocFlag,
                annualRep: annualRep,
                mc: mc,
                oclause: oclause,
                count: country,
                stockExc: stockExc,
                repCurrency: "",
                naics: naics

            };
            console.log(ajax_data)
            $.ajax({
                url: "api/XBRL/GetInsertCompany",
                data: ajax_data,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-4">
                        <input type="file" class="form-control" id="fileUpload" />
                    </div>
                    <div class="col-sm-4">
                        <input type="button" class="btn btn-success" id="uploadfile" value="Upload" />

                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <h4>Data Must be in Same Formate ,Example:</h4>
                    <br />
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Company Code</th>
                                <th scope="col">Company Name</th>
                                <th scope="col">Reg No</th>
                                <th scope="col">NTN</th>
                                <th scope="col">value</th>
                                <th scope="col">Industry Code</th>
                                <th scope="col">Sector Code</th>
                                <th scope="col">Contry Of Registration</th>
                                <th scope="col">Fiscal Year</th>
                                <th scope="col">State Location</th>
                                <th scope="col">State Inc</th>
                                <th scope="col">Loc Flag</th>
                                <th scope="col">Annual Reporting</th>
                                <th scope="col">MC</th>
                                <th scope="col">O Clause</th>
                                <th scope="col">Country</th>
                                <th scope="col">Stock Exchange</th>
                                <th scope="col">Reporting Currency</th>
                                <th scope="col">Naics</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td>0000054480</td>
                                <td>KANSAS CITY SOUTHERN</td>
                                <td>KSU</td>
                                <td></td>
                                <td>440663509</td>
                                <td>4011</td>
                                <td>48</td>
                                <td></td>
                                <td>31-DEC</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>10-K</td>


                                <td>0</td>
                                <td></td>
                                <td></td>
                                <td>NYSC</td>

                                <td></td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
