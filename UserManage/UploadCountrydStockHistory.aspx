<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadCountrydStockHistory.aspx.cs" Inherits="Portfolio.UploadCountrydStockHistory" %>

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

            //Read the Excel File data.
            var workbook = XLSX.read(data, {
                type: 'binary'
            });

            //Fetch the name of First Sheet.
            var firstSheet = workbook.SheetNames[0];

            //Read all rows from First Sheet into an JSON array.

            var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);
            var stockname, tractDate, stocstockhigh, stockLow, stockOpen, stockClose, stockvolume, stockadjClose;
            //Add the data rows from Excel file.

            for (var i = 0; i < excelRows.length; i++) {


                //Add the data cells.
                if (excelRows[i]['NAME'] == null) {
                    NAME = "";
                } else {
                    NAME = excelRows[i]['NAME'];
                }


                if (excelRows[i]['TRANSACTIONDATE'] == null) {
                    tractDate = "";
                }
                else {
                    tractDate = excelRows[i]['TRANSACTIONDATE'];
                }
                if (excelRows[i]['High'] == null) {
                    stocstockhigh = "";
                }
                else {
                    stocstockhigh = excelRows[i]['High'];
                }


                if (excelRows[i]['Low'] == null) {
                    stockLow = "";

                } else {
                    stockLow = excelRows[i]['Low'];
                }

                if (excelRows[i]['Open'] == null) {
                    stockOpen = "";
                }
                else {
                    stockOpen = excelRows[i]['Open'];
                }


                if (excelRows[i]['Close'] == null) {
                    stockClose = "";
                }
                else {
                    stockClose = excelRows[i]['Close'];
                }

                if (excelRows[i]['Volume'] == null) {
                    stockvolume = "";
                }
                else {
                    stockvolume = excelRows[i]['Volume'];

                }

                if (excelRows[i]['Adj Close'] == null) {
                    stockadjClose = "";
                }
                else {
                    stockadjClose = excelRows[i]['Adj Close'];
                }



                insertExcelData(stockname, tractDate, stocstockhigh, stockLow, stockOpen, stockClose, stockvolume, stockadjClose);
            }


        };
        function insertExcelData(stockname, tractDate, stocstockhigh, stockLow, stockOpen, stockClose, stockvolume, stockadjClose) {

            if ($('#ddlContry option:selected').test() == 'Pakistan') {
                var ajax_data = {
                    stockname: stockname,
                    tractDate: tractDate,
                    stocstockhigh: stocstockhigh,
                    stockLow: stockLow,
                    stockOpen: stockOpen,
                    stockClose: stockClose,
                    stockvolume: stockvolume,
                    stockadjClose: stockadjClose

                };

                $.ajax({
                    url: "api/XBRL/GetStockPrice",
                    data: ajax_data,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {



                    },
                    error: function (request) {
                        //notifyError('Saving User Detail failed!');

                    }
                });
            } else {
                var ajax_data = {
                    stockname: stockname,
                    tractDate: tractDate,
                    stocstockhigh: stocstockhigh,
                    stockLow: stockLow,
                    stockOpen: stockOpen,
                    stockClose: stockClose,
                    stockvolume: stockvolume,
                    stockadjClose: stockadjClose

                };

                $.ajax({
                    url: "api/XBRL/GetStockPrice",
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
                        <select id="ddlContry">
                            <option>Pakistan</option>
                            <option>Usa</option>
                        </select>
                    </div>
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
                                <th scope="col">Ticker</th>
                                <th scope="col">Date</th>
                                <th scope="col">High</th>
                                <th scope="col">Low</th>
                                <th scope="col">Open</th>
                                <th scope="col">Close</th>
                                <th scope="col">Volume</th>
                                <th scope="col">Adj Close</th>



                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td></td>
                                <td>31/05/2019</td>
                                <td>26.57</td>
                                <td>26.15</td>
                                <td>26.4</td>
                                <td>26.39</td>
                                <td>883468</td>
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

