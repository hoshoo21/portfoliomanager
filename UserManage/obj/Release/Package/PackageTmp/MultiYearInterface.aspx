<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiYearInterface.aspx.cs" Inherits="Portfolio.testr" %>

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
        //function Upload() {
        //    debugger

        //    //Reference the FileUpload element.

        //};
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
            var compcik, compCode, eleNature, eleName, parentName, eleVal1, eleVal2, eleVal3, eleVal4, eleVal5,
                unitCode, decRounding, accType, ReptQua, CreatDate, year, ContextCode, fiscalYear;
            //Add the data rows from Excel file.

            for (var i = 0; i < excelRows.length; i++) {


                //Add the data cells.
                if (excelRows[i]['Company Code/TICKER'] == null) {
                    compCode = "";
                } else {
                    compCode = excelRows[i]['Company Code/TICKER'];
                }


                if (excelRows[i]['CUIN/ CIK'] == null) {
                    compcik = "";
                }
                else {
                    compcik = excelRows[i]['CUIN/ CIK'];
                }
                if (excelRows[i]['element name'] == null) {
                    eleName = "";
                }
                else {
                    eleName = excelRows[i]['element name'];
                }


                if (excelRows[i]['parent element'] == null) {
                    parentName = "";

                } else {
                    parentName = excelRows[i]['parent element'];
                }

                if (excelRows[i]['value'] == null) {
                    eleVal1 = "";
                }
                else {
                    eleVal1 = excelRows[i]['value'];
                }


                if (excelRows[i]['Unit'] == null) {
                    unitCode = "";
                }
                else {
                    unitCode = excelRows[i]['Unit'];
                }

                if (excelRows[i]['Rounding'] == null) {
                    decRounding = "";
                }
                else {
                    decRounding = excelRows[i]['Rounding'];

                }

                if (excelRows[i]['A/C Type (FI or FD)'] == null) {
                    accType = "";
                }
                else {
                    accType = excelRows[i]['A/C Type (FI or FD)'];
                }
                if (excelRows[i]['year'] == null) {
                    year = "";
                }
                else {
                    year = excelRows[i]['year'];
                }
                if (excelRows[i]['quarter'] == null) {
                    ReptQua = "";
                }
                else {
                    ReptQua = excelRows[i]['quarter'];
                }

                if (excelRows[i]['Context Code'] == null) {
                    ContextCode = "";
                }
                else {
                    ContextCode = excelRows[i]['Context Code'];

                }

                if (excelRows[i]['fiscal Year'] == null) {
                    fiscalYear = "";
                }
                else {
                    fiscalYear = excelRows[i]['fiscal Year'];

                }



                insertExcelData(compCode, compcik, eleName, parentName, eleVal1,
                    unitCode, decRounding, accType, ReptQua, CreatDate, year, ContextCode, fiscalYear);
            }


        };
        function insertExcelData(compCode, compcik, eleName, parentName, eleVal1,
            unitCode, decRounding, accType, ReptQua, CreatDate, year, ContextCode, fiscalYear) {

            var ajax_data = {
                compCode: compCode,
                compcik: compcik,
                eleName: eleName,
                parentName: parentName,
                eleVal1: eleVal1,
                unitCode: unitCode,
                decRounding: decRounding,
                accType: accType,
                year: year,
                ReptQua: ReptQua,
                ContextCode: ContextCode,
                fiscalYear: fiscalYear,
                eleNature: '',
                eleVal2: '',
                eleVal3: '',
                eleVal4: '',
                eleVal5: '',
                CreatDate: ''
            };

            $.ajax({
                url: "api/XBRL/GetExportData",
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
                                <th scope="col">Company Code/TICKER</th>
                                <th scope="col">CUIN/ CIK</th>
                                <th scope="col">element name</th>
                                <th scope="col">parent element</th>
                                <th scope="col">value</th>
                                <th scope="col">Unit</th>
                                <th scope="col">Rounding</th>
                                <th scope="col">A/C Type (FI or FD)</th>
                                <th scope="col">year</th>
                                <th scope="col">quarter</th>
                                <th scope="col">Context Code</th>
                                <th scope="col">fiscal Year</th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                
                                <td>FCCL</td>
                                <td>0028972</td>
                                <td>Assets</td>
                                <td></td>
                                <td>29,357,652</td>
                                <td>PKR</td>
                                <td>-3</td>
                                <td>FI</td>
                                <td>2016</td>
                                <td>Q4</td>
                               <td>FD2016Q4</td>
                                <td>2016</td>
                            </tr>
                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
