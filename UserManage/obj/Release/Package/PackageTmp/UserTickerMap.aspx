<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTickerMap.aspx.cs" Inherits="Portfolio.UserTickerMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Ticker Map</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-2.2.4.js"></script>
    <script src="Javascript/Product.js"></script>

     <script src="bootstrap/js/DatatableJS.js"></script>
    <link href="bootstrap/css/DatatableCSS.css" rel="stylesheet" />
  
    <script type="text/javascript">


        $(document).ready(function () {

           
           
            $("#btnAdd").click(function () {


                InsertUSerTickerMAp();


            });

            GetUserDropdown();
            GetCompanySymbolDropdown();
            GetProjectDropdown();
            GetUserTrickerMap();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
         <div class="row">
            <div class="col-sm-12">
                <h1 style="text-align: center;">User Ticker Maping</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">


                <div class="col-md-3 ">


                    <label class="control-label">User:</label>
                    <select id="ddlUser" class="form-control"></select>


                </div>
                <div class="col-md-3">


                    <label class="control-label">Company Symbol:</label>
                    <br />
                    <select id="ddlCompanysymbol" name="multicheckbox[]" multiple="multiple">
                       <%-- <option>Kashif</option>
                        <option>Kashif</option>
                        <option>Kashif</option><option>Kashif</option>--%>
                    </select>

                </div>

                <div class="col-md-3">


                    <label class="control-label">Project:</label>
                    <select id="ddlProject" class="form-control"></select>


                </div>
                <div class="col-md-3">
                    <br />
                    <input type="button" class="btn btn-success" id="btnAdd" value="ADD" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">

                <div class="table-responsive">
                    <table id="tblUserTrickerMAp" class="display" style="width: 100%">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Company Symbol</th>
                                <th>Project</th>

                                <th></th>
                                <%--<th></th>--%>




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

     <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"  
        rel="stylesheet" type="text/css" />  
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>  
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"  
        rel="stylesheet" type="text/css" />  
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"  
        type="text/javascript"></script>  
   
</html>

