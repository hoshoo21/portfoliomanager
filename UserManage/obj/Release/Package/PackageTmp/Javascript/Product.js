function InsertProduct() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var active;


    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        Product: $('#txtProduct').val(),
        Active: active

    };


    $.ajax({
        url: "api/Products/GETInsetProduct",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetProduct();
            document.getElementById("txtProduct").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetProduct() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];


    $.ajax({
        url: "api/Products/GETProduct",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadProduct(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadProduct(data) {


    if ($.fn.dataTable.isDataTable('#tblProduct')) {
        accounttablevar = $('#tblProduct').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblProduct').DataTable({
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


            { "data": "P_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "ACTIVE" },
            {
                "date": "P_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnEdit(\'' + full["P_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "P_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnDelete(' + full["P_CODE"] + ')"></input>';

                }
            },


        ],

    });


}
var PCODE;
function OnEdit(P_CODE, DESCRIPTION, ACTIVE) {
    PCODE = P_CODE;
    $('#EditProduct').modal('show');
    document.getElementById("txtUpdtProduct").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkUpdtActive").prop("checked", true);
    }
    else {
        $("#chkUpdtActive").prop("checked", false);
    }


}
function OnDelete(P_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            PCode: P_CODE

        };
        $.ajax({
            url: "api/Products/GETProductDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetProduct();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateProduct() {
    var active;
    if (document.getElementById("chkUpdtActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        Product: $('#txtUpdtProduct').val(),
        Active: active,
        PCODE
    };

    $.ajax({
        url: "api/Products/GETUpdateProduct",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetProduct();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}


//General Expert//
function InsertGeneralExpert() {

    var active;


    if (document.getElementById("chkGXActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        GeneralExpert: $('#txtGeneralExpert').val(),
        Active: active

    };


    $.ajax({
        url: "api/Products/GETInsertGeneralExpert",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetGeneralExpert();
            document.getElementById("txtGeneralExpert").value = '';
            $("#chkGXActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetGeneralExpert() {



    $.ajax({
        url: "api/Products/GETGeneralExpert",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadGeneralExpert(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadGeneralExpert(data) {


    if ($.fn.dataTable.isDataTable('#tblGeneralExpert')) {
        accounttablevar = $('#tblGeneralExpert').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblGeneralExpert').DataTable({
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



            { "data": "EMG_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "ACTIVE" },

            {
                "date": "P_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnGXEdit(\'' + full["EMG_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "EMG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnGXDelete(' + full["EMG_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var EGCODE;
function OnGXEdit(EMG_CODE, DESCRIPTION, ACTIVE) {
    EGCODE = EMG_CODE;
    $('#EditGeneralExpert').modal('show');
    document.getElementById("txtUpdtGeneralExpert").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkUpdtGXActive").prop("checked", true);
    }
    else {
        $("#chkUpdtGXActive").prop("checked", false);
    }


}
function OnGXDelete(EMG_CODE) {
    if (confirm("Are you sure you want to Delete?")) {



        var ajax_data = {
            EGCODE: EMG_CODE

        };
        $.ajax({
            url: "api/Products/GETGeneralExpertDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                alert('Delete Successfully !');
                GetGeneralExpert();


            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    }
    else {

    }
}
function UpdateGX() {
    var active;
    if (document.getElementById("chkUpdtGXActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        GeneralExpert: $('#txtUpdtGeneralExpert').val(),
        Active: active,
        EGCODE
    };

    $.ajax({
        url: "api/Products/GETUpdateGeneralExpert",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetGeneralExpert();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

//Company//
function InsertCompany() {

    var active;


    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        company: $('#txtCompany').val(),
        ntn: $('#txtNTN').val(),
        Active: active

    };


    $.ajax({
        url: "api/Products/GETInsertCompany",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetCompany();
            document.getElementById("txtCompany").value =
                document.getElementById("txtNTN").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetCompany() {



    $.ajax({
        url: "api/Products/GETCompany",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadGetCompany(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadGetCompany(data) {


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


            { "data": "C_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "NTN" },
            { "data": "ACTIVE" },

            {
                "date": "C_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit" style="height: 31px;font-size: 12px;"   onclick="OnCompanyEdit(\'' + full["C_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["NTN"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "C_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete" style="height: 31px;font-size: 12px;"    onclick="OnCompanyDelete(' + full["C_CODE"] + ')"></input>';

                }

            }
        ],

    });




}
var CCODE;
function OnCompanyEdit(C_CODE, DESCRIPTION, NTN, ACTIVE) {
    CCODE = C_CODE;
    $('#EditCompany').modal('show');
    document.getElementById("txtUpdtCompany").value = DESCRIPTION
    document.getElementById("txtUpdtNTN").value = NTN;
    if (ACTIVE == 'Yes') {
        $("#chkUpdtCompanyActive").prop("checked", true);
    }
    else {
        $("#chkUpdtCompanyActive").prop("checked", false);
    }


}
function OnCompanyDelete(C_CODE) {
    if (confirm("Are you sure you want to Delete?")) {



        var ajax_data = {
            CCODE: C_CODE

        };
        $.ajax({
            url: "api/Products/GETCompanyDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetCompany();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateCompany() {
    var active;
    if (document.getElementById("chkUpdtCompanyActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        Company: $('#txtUpdtCompany').val(),
        ntn: $('#txtUpdtNTN').val(),
        Active: active,
        CCODE
    };

    $.ajax({
        url: "api/Products/GETUpdateCompany",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetCompany();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

//client//
function InsertClient() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var gender;
    var active;


    if (document.getElementById("rdmale").checked) {
        gender = "Male";
    }
    if (document.getElementById("rdFemaile").checked) {
        gender = "Female";
    }
    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    if ($('#btnAdd').val() == "ADD") {
        var ajax_data = {
            clientname: $('#txtClientName').val(),
            gender: gender,
            nic: $('#txtNIC').val(),
            ntn: $('#txtNTN').val(),
            old: $('#txtOLD').val(),
            active: active,
            category: $('#txtCategory').val(),
            Islamic: $('#txtIslamic').val(),
            online: $('#txtOnline').val(),
            refer: $('#txtReference').val(),
            contNo: $('#txtContactNo').val(),
            email: $('#txtEmail').val(),
            address: $('#txtAddress').val(),

        };
        $.ajax({
            url: "api/Products/GETInsertClient",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                alert('Save Successfully');
                GetClient();
                document.getElementById("txtClientName").value = '';
                document.getElementById("txtNIC").value = '';
                document.getElementById("txtNTN").value = '';
                document.getElementById("txtOLD").value = '';
                document.getElementById("txtCategory").value = '';
                document.getElementById("txtIslamic").value = '';
                document.getElementById("txtOnline").value = '';
                document.getElementById("txtReference").value = '';
                document.getElementById("txtContactNo").value = '';
                document.getElementById("txtEmail").value = '';
                document.getElementById("txtAddress").value = '';


                $("#chkActive").prop("checked", false);
                $("#rdFemaile").prop("checked", false);
                $("#rdmale").prop("checked", false);


            },


            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    } else {
        var ajax_data = {
            clientname: $('#txtClientName').val(),
            gender: gender,
            nic: $('#txtNIC').val(),
            ntn: $('#txtNTN').val(),
            old: $('#txtOLD').val(),
            active: active,
            category: $('#txtCategory').val(),
            Islamic: $('#txtIslamic').val(),
            online: $('#txtOnline').val(),
            refer: $('#txtReference').val(),
            contNo: $('#txtContactNo').val(),
            email: $('#txtEmail').val(),
            address: $('#txtAddress').val(),
            clientcode: clientcode

        };
        $.ajax({
            url: "api/Products/GetUpdateClient",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                alert('Update Successfully');
                GetClient();
                document.getElementById("txtClientName").value = '';
                document.getElementById("txtNIC").value = '';
                document.getElementById("txtNTN").value = '';
                document.getElementById("txtOLD").value = '';
                document.getElementById("txtCategory").value = '';
                document.getElementById("txtIslamic").value = '';
                document.getElementById("txtOnline").value = '';
                document.getElementById("txtReference").value = '';
                document.getElementById("txtContactNo").value = '';
                document.getElementById("txtEmail").value = '';
                document.getElementById("txtAddress").value = '';


                $("#chkActive").prop("checked", false);
                $("#rdFemaile").prop("checked", false);
                $("#rdmale").prop("checked", false);
                $('#btnAdd').val('ADD');

            },


            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }


}
function GetClient() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadClient(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadClient(data) {


    if ($.fn.dataTable.isDataTable('#tblClient')) {
        accounttablevar = $('#tblClient').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblClient').DataTable({
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



            { "data": "DESCRIPTION" },

            { "data": "GENDER" },
            { "data": "NIC" },
            { "data": "NTN" },
            { "data": "OLD" },
            { "data": "CS_DATE" },
            { "data": "ACTIVE" },
            { "data": "CLIENT_CATEGORY" },
            //{ "data": "USERID" },


            {
                "date": "CLIENT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit" style="height: 31px;font-size: 12px;"   onclick="OnclientEdit(\'' + full["CLIENT_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["GENDER"] + '\',\'' + full["NIC"] + '\',\'' + full["NTN"] + '\',\'' + full["OLD"] + '\',\'' + full["CS_DATE"] + '\',\'' + full["ACTIVE"] + '\',\'' + full["CLIENT_CATEGORY"] + '\', \'' + full["ISLAMIC"] + '\', \'' + full["CLIENT_CATEGORY"] + '\', \'' + full["CP_ONLINE"] + '\', \'' + full["REFERENCE"] + '\', \'' + full["CONTACT_NO"] + '\', \'' + full["EMAIL"] + '\', \'' + full["ADDRESS"] + '\')"></input>';

                }
            },
            {
                "date": "CLIENT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete" style="height: 31px;font-size: 12px;"  onclick="OnclientDelete(' + full["CLIENT_CODE"] + ')"></input>';

                }

            }
        ],

    });




}
var clientcode;

function OnclientEdit(CLIENT_CODE, DESCRIPTION, GENDER, NIC, NTN, OLD, CS_DATE, ACTIVE,
    CLIENT_CATEGORY, ISLAMIC, CP_ONLINE, REFERENCE, CONTACT_NO, EMAIL, ADDRESS) {
    clientcode = CLIENT_CODE;
    if (NIC == "null") {
        NIC = "";
    }
    if (NTN == "null") {
        NTN = "";
    }
    if (GENDER == "Male") {
        $("#rdmale").prop("checked", true);
    } else {
        $("#rdFemaile").prop("checked", true);
    }
    if (ACTIVE == "Yes") {
        $("#chkActive").prop("checked", true);
    } else {
        $("#chkActive").prop("checked", false);
    }
    $('#txtClientName').val(DESCRIPTION);
    $('#txtNIC').val(NIC);
    $('#txtNTN').val(NTN);
    $('#txtOLD').val(OLD);
    $('#txtCategory').val(CLIENT_CATEGORY);
    $('#txtOnline').val(CP_ONLINE);
    $('#txtReference').val(REFERENCE);
    $('#txtContactNo').val(CONTACT_NO);
    $('#txtIslamic').val(ISLAMIC);
    $('#txtEmail').val(EMAIL);
    $('#txtAddress').val(ADDRESS);
    $('#btnAdd').val('UPDATE');

}
function OnclientDelete(CLIENT_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            clientcode: CLIENT_CODE

        };
        $.ajax({
            url: "api/Products/GETClientDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetClient();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function Updateclient() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        clientname: $('#txtUptClientName').val(),
        nic: $('#txtUptNIC').val(),
        ntn: $('#txtUptNTN').val(),
        active,
        clientcode
    };

    $.ajax({
        url: "api/Products/GETClientUpdate",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetClient();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}










//Company Symbol//

function InsertCompanySetup() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var active;



    var ajax_data = {
        incomeSource: $('#txtIncomeSource').val(),
        incomeSource: $('#txtIncomeSource').val()


    };


    $.ajax({
        url: "api/Products/GETInsertIncomeSource",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetIcomeSource();
            document.getElementById("txtIncomeSource").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetSymbol() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadGetCompanySetup(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadGetCompanySetup(data) {


    if ($.fn.dataTable.isDataTable('#tblClient')) {
        accounttablevar = $('#tblClient').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblClient').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [


            { "data": "Company" },
            { "data": "DESCRIPTION" },




        ],

    });




}





//Income Source//
function InsertIncomeSource() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var active;



    var ajax_data = {
        incomeSource: $('#txtIncomeSource').val()


    };


    $.ajax({
        url: "api/Products/GETInsertIncomeSource",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetIcomeSource();
            document.getElementById("txtIncomeSource").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetIcomeSource() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];


    $.ajax({
        url: "api/Products/GetIncomeSource",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadIcomeSource(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadIcomeSource(data) {


    if ($.fn.dataTable.isDataTable('#tblIncomeSource')) {
        accounttablevar = $('#tblIncomeSource').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblIncomeSource').DataTable({
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



            { "data": "IS_CODE" },
            { "data": "DESCRIPTION" },

            {
                "date": "IS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnIncomeSourceEdit(\'' + full["IS_CODE"] + '\',\'' + full["DESCRIPTION"] + '\')"></input>';

                }
            },
            {
                "date": "IS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnIncomeSourceDelete(' + full["IS_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var iscode;
function OnIncomeSourceEdit(IS_CODE, DESCRIPTION) {
    iscode = IS_CODE;
    $('#EditIncomeSource').modal('show');
    document.getElementById("txtUpdtIncomeSource").value = DESCRIPTION

}
function OnIncomeSourceDelete(IS_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            iscode: IS_CODE

        };
        $.ajax({
            url: "api/Products/GETIncomeSourceDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetIcomeSource();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateIncomeSource() {

    var ajax_data = {
        insource: $('#txtUpdtIncomeSource').val(),

        iscode
    };
    ////var getUrl = window.location;
    ////var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateIncomeSource",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetIcomeSource();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



// Payment////

function InsertPaymentType() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        PaymentType: $('#txtPaymentType').val()


    };


    $.ajax({
        url: "api/Products/GETInsertPayment",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetPaymentType();
            document.getElementById("txtPaymentType").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetPaymentType() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];


    $.ajax({
        url: "api/Products/GETPayment",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadPaymentType(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadPaymentType(data) {


    if ($.fn.dataTable.isDataTable('#tblPaymentType')) {
        accounttablevar = $('#tblPaymentType').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblPaymentType').DataTable({
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



            { "data": "PT_CODE" },
            { "data": "DESCRIPTION" },

            {
                "date": "PT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnPaymentTypeEdit(\'' + full["PT_CODE"] + '\',\'' + full["DESCRIPTION"] + '\')"></input>';

                }
            },
            {
                "date": "PT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnPaymentTypeDelete(' + full["PT_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var ptcode;
function OnPaymentTypeEdit(PT_CODE, DESCRIPTION) {
    ptcode = PT_CODE;
    $('#EditPayment').modal('show');
    document.getElementById("txtUpdtPayment").value = DESCRIPTION

}
function OnPaymentTypeDelete(PT_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            ptcode: PT_CODE

        };
        $.ajax({
            url: "api/Products/GETPaymentDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetPaymentType();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdatePaymentType() {

    var ajax_data = {
        PaymentType: $('#txtUpdtPayment').val(),

        ptcode
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdatePayment",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetPaymentType();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



//Join Client Holder//
function InsertJointCLient() {

    var active;
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        jointclient: $('#txtJointHolderClient').val(),
        address: $('#txtAddress').val(),
        nic: $('#txtNIC').val(),
        phoneNO: $('#txtPhoneNo').val(),
        active


    };


    $.ajax({
        url: "api/Products/GETInsertJointClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetJointHolderClient();
            document.getElementById("txtJointHolderClient").value = '';
            document.getElementById("txtAddress").value = '';
            document.getElementById("txtNIC").value = '';
            document.getElementById("txtPhoneNo").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}

function GetJointHolderClient() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETJointClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadJointHolderClient(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadJointHolderClient(data) {


    if ($.fn.dataTable.isDataTable('#tblJointHolderClient')) {
        accounttablevar = $('#tblJointHolderClient').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblJointHolderClient').DataTable({
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



            { "data": "CLIENT_CODE" },
            { "data": "NAME" },
            { "data": "ADDRESS" },
            { "data": "PHONE" },
            { "data": "NIC" },
            { "data": "ACTIVE" },

            {
                "date": "CLIENT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnJointHolderClientEdit(\'' + full["CLIENT_CODE"] + '\',\'' + full["SNO"] + '\',\'' + full["NAME"] + '\',\'' + full["ADDRESS"] + '\',\'' + full["PHONE"] + '\',\'' + full["NIC"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "CLIENT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnJointHolderClientDelete(' + full["CLIENT_CODE"] + ')"></input>';

                }
            },

        ],

    });




}

var clientcode;
function OnJointHolderClientEdit(CLIENT_CODE, SNO, NAME, ADDRESS, PHONE, NIC, ACTIVE) {
    clientcode = CLIENT_CODE;
    $('#EditJointHolder').modal('show');

    document.getElementById("txtUpdtJointHolderClient").value = NAME,
        document.getElementById("txtUpdtAddress").value = ADDRESS,
        document.getElementById("txtUpdtPhoneNo").value = PHONE,
        document.getElementById("txtUpdtNIC").value = NIC
    if (ACTIVE == 'Yes') {
        $("#chkUpdtActive").prop("checked", true);
    }
    else {
        $("#chkUpdtActive").prop("checked", false);
    }
}
function OnJointHolderClientDelete(CLIENT_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            clientcode: CLIENT_CODE

        };
        $.ajax({
            url: "api/Products/GETJointClientDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetJointHolderClient();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateJointHolderClient() {
    var active;
    if (document.getElementById("chkUpdtActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        jointclient: $('#txtUpdtJointHolderClient').val(),
        address: $('#txtUpdtAddress').val(),
        phoneNO: $('#txtUpdtPhoneNo').val(),
        nic: $('#txtUpdtNIC').val(),
        active,
        clientcode
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateJointClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetJointHolderClient();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

// Relation Ship//
function InsertRelationShip() {

    var active;
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        relationship: $('#txtRelationShip').val()



    };


    $.ajax({
        url: "api/Products/GETInsertRelationship",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetRelationShip();
            document.getElementById("txtRelationShip").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetRelationShip() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETRelationShip",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadRelationShip(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadRelationShip(data) {


    if ($.fn.dataTable.isDataTable('#tblRelationShip')) {
        accounttablevar = $('#tblRelationShip').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblRelationShip').DataTable({
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



            { "data": "RS_CODE" },
            { "data": "DESCRIPTION" },


            {
                "date": "RS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnRelationShipEdit(\'' + full["RS_CODE"] + '\',\'' + full["DESCRIPTION"] + '\')"></input>';

                }
            },
            {
                "date": "RS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnRelationShipDelete(' + full["RS_CODE"] + ')"></input>';

                }
            },
        ],

    });




}
var RSCODE;
function OnRelationShipEdit(RS_CODE, DESCRIPTION) {
    RSCODE = RS_CODE;
    $('#EditRelationShip').modal('show');
    document.getElementById("txtUpdtRelationShip").value = DESCRIPTION;


}
function OnRelationShipDelete(RS_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            RSCODE: RS_CODE

        };
        $.ajax({
            url: "api/Products/GETRelationShipDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetRelationShip();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateRelationShip() {

    var ajax_data = {
        relationship: $('#txtUpdtRelationShip').val(),

        RSCODE
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateRelationShip",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetRelationShip();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}





//Bank Detail///
function InsertBankDetail() {


    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        bank: $('#txtBankDetail').val()



    };


    $.ajax({
        url: "api/Products/GETInsertBankDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetBankDetail();
            document.getElementById("txtBankDetail").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetBankDetail() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETBankDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadBankDetail(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadBankDetail(data) {


    if ($.fn.dataTable.isDataTable('#tblBankDetail')) {
        accounttablevar = $('#tblBankDetail').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblBankDetail').DataTable({
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



            { "data": "BD_CODE" },
            { "data": "DESCRIPTION" },


            {
                "date": "BD_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnBankDetailEdit(\'' + full["BD_CODE"] + '\',\'' + full["DESCRIPTION"] + '\')"></input>';

                }
            },
            {
                "date": "BD_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnBankDetailDelete(' + full["BD_CODE"] + ')"></input>';

                }
            },
        ],

    });




}
var BDCODE;
function OnBankDetailEdit(BD_CODE, DESCRIPTION) {
    BDCODE = BD_CODE;
    $('#EditBankDetail').modal('show');
    document.getElementById("txtUpdtBank").value = DESCRIPTION;


}
function OnBankDetailDelete(BD_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            BDCODE: BD_CODE

        };
        $.ajax({
            url: "api/Products/GETBankDetailDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetBankDetail();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateBank() {

    var ajax_data = {
        bank: $('#txtUpdtBank').val(),

        BDCODE
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateBankDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetBankDetail();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}


///Broker///

function InsertBroker() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var active;



    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }

    var ajax_data = {
        Broker: $('#txtBroker').val(),
        ntn: $('#txtNTN').val(),
        location: $('#txtLocation').val(),
        phoneNo: $('#txtPhoneNo').val(),
        email: $('#txtEmail').val(),
        active
    };


    $.ajax({
        url: "api/Products/GETInsertBroker",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetBroker();
            document.getElementById("txtBroker").value = '';
            document.getElementById("txtNTN").value = '';
            document.getElementById("txtLocation").value = '';
            document.getElementById("txtPhoneNo").value = '';
            document.getElementById("txtEmail").value = '';

            $("#chkActive").prop("checked", false);

        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetBroker() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETBroker",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadBroker(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadBroker(data) {


    if ($.fn.dataTable.isDataTable('#tblBroker')) {
        accounttablevar = $('#tblBroker').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblBroker').DataTable({
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



            { "data": "BROKER_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "NTN" },
            { "data": "LOCATION" },
            { "data": "PHONE" },
            { "data": "EMAIL" },
            { "data": "ACTIVE" },


            {
                "date": "BROKER_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnBrokerEdit(\'' + full["BROKER_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["NTN"] + '\',\'' + full["LOCATION"] + '\',\'' + full["PHONE"] + '\',\'' + full["EMAIL"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "BROKER_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnBrokerDelete(' + full["BROKER_CODE"] + ')"></input>';

                }
            },
        ],

    });




}

var brokerCODE;
function OnBrokerEdit(BROKER_CODE, DESCRIPTION, NTN, LOCATION, PHONE, EMAIL, ACTIVE) {
    brokerCODE = BROKER_CODE;
    $('#EditBroker').modal('show');
    document.getElementById("txtUptBroker").value = DESCRIPTION;
    document.getElementById("txtUptNTN").value = NTN;
    document.getElementById("txtUptLocation").value = LOCATION;
    document.getElementById("txtUptPhoneNo").value = PHONE;
    document.getElementById("txtUptEmail").value = EMAIL;

    if (ACTIVE == 'Yes') {
        $("#chkUptActive").prop("checked", true);
    }
    else {
        $("#chkUptActive").prop("checked", false);
    }


}
function OnBrokerDelete(BROKER_CODE) {

    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            brokerCODE: BROKER_CODE

        };
        $.ajax({
            url: "api/Products/GETBrokerDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetBroker();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateBroker() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        broker: $('#txtUptBroker').val(),
        ntn: $('#txtUptNTN').val(),
        location: $('#txtUptLocation').val(),
        phoneNo: $('#txtUptPhoneNo').val(),
        email: $('#txtUptEmail').val(),
        active,
        brokerCODE
    };

    $.ajax({
        url: "api/Products/GETUpdateBroker",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetBroker();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



//condition///
function InsertConditon() {

    var active;
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }


    var ajax_data = {
        condition: $('#txtConditon').val(),
        active


    };


    $.ajax({
        url: "api/Products/GETInsertCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetConditon();
            document.getElementById("txtConditon").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetConditon() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadConditon(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadConditon(data) {


    if ($.fn.dataTable.isDataTable('#tblConditon')) {
        accounttablevar = $('#tblConditon').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblConditon').DataTable({
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



            { "data": "CONDITON_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "ACTIVE" },

            {
                "date": "CONDITON_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnConditionEdit(\'' + full["CONDITON_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "CONDITON_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnConditionDelete(' + full["CONDITON_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var CondCODE;
function OnConditionEdit(CONDITON_CODE, DESCRIPTION, ACTIVE) {
    CondCODE = CONDITON_CODE;
    $('#EditCondition').modal('show');
    document.getElementById("txtUptConditon").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkUptActive").prop("checked", true);
    }
    else {
        $("#chkUptActive").prop("checked", false);
    }



}
function OnConditionDelete(CONDITON_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            CondCODE: CONDITON_CODE

        };
        $.ajax({
            url: "api/Products/GETConditionDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetConditon();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateCondition() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        condition: $('#txtUptConditon').val(),
        active,
        CondCODE
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetConditon();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



// value///

function InsertValues() {

    var active;
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        value: $('#txtValues').val(),
        active


    };


    $.ajax({
        url: "api/Products/GETInsertValue",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetValues();
            document.getElementById("txtValues").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetValues() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETValue",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadValues(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadValues(data) {


    if ($.fn.dataTable.isDataTable('#tblValues')) {
        accounttablevar = $('#tblValues').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblValues').DataTable({
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



            { "data": "VALUE_CODE" },
            { "data": "DESCERIPTION" },
            { "data": "ACTIVE" },


            {
                "date": "VALUE_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnValuesEdit(\'' + full["VALUE_CODE"] + '\',\'' + full["DESCERIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "VALUE_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnValuesDelete(' + full["VALUE_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var ValCODE;
function OnValuesEdit(VALUE_CODE, DESCRIPTION, ACTIVE) {
    ValCODE = VALUE_CODE;
    $('#EditValues').modal('show');
    document.getElementById("txtUptvalue").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkUptActive").prop("checked", true);
    }
    else {
        $("#chkUptActive").prop("checked", false);
    }



}
function OnValuesDelete(VALUE_CODE) {

    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            ValCODE: VALUE_CODE

        };
        $.ajax({
            url: "api/Products/GETValueDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetValues();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateValues() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        value: $('#txtUptvalue').val(),
        active,
        ValCODE
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateValue",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetValues();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



// Criteria///


function InsertCriteria() {

    var ajax_data = {
        critcode: $('#txtCode').val()


    };


    $.ajax({
        url: "api/Products/GETCriteriaAlready",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            if (data.length > 0) {
                alert('Criteria Code Already Add !');
            }
            else {

                var ddlCriLevel = document.getElementById("ddlLevel");
                var level = ddlCriLevel.options[ddlCriLevel.selectedIndex].text;
                if (level == 'Select Level') {
                    alert('Please Select Level');
                }
                else if (level == 'Level 1') {
                    var len1 = $('#txtCode').val().length;
                    if (len1 <= 1) {

                        ValideConditonCriteriaInsert();
                    }
                    else {
                        alert('Only 1 Digit Code Allow Against  level 1')
                        $('#txtCode').css("border-color", "red");

                    }

                }
                else if (level == 'Level 2') {
                    var len2 = $('#txtCode').val().length;
                    if (len2 == 3) {

                        ValideConditonCriteriaInsert();
                    } else {
                        alert('Only 3 Digit Code Allow  Against  level 2')
                        $('#txtCode').css("border-color", "red");

                    }

                }
                else if (level == 'Level 3') {
                    var len3 = $('#txtCode').val().length;
                    if (len3 == 6) {

                        ValideConditonCriteriaInsert();
                    } else {
                        alert('Only 6 Digit Code Allow  Against  level 3')
                        $('#txtCode').css("border-color", "red");
                    }

                }
                else if (level == 'Level 4') {
                    var len4 = $('#txtCode').val().length;
                    if (len4 == 8) {
                        ValideConditonCriteriaInsert();
                    } else {
                        alert('Only 8 Digit Code Allow  Against  level 4')
                        $('#txtCode').css("border-color", "red");

                    }

                }
                else {
                    alert('Not allow Code More than 8 digits');
                }
            }



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });








}


function ValideConditonCriteriaInsert() {

    var active;
    var ddlCritype = document.getElementById("ddlType");
    var type = ddlCritype.options[ddlCritype.selectedIndex].text;
    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        critCode: $('#txtCode').val(),
        criteria: $('#txtCriteria').val(),
        type: type,
        active


    };


    $.ajax({
        url: "api/Products/GETInsertCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetCriteria();
            document.getElementById("txtCode").value = '';
            document.getElementById("txtCriteria").value = '';
            document.getElementById('ddlType').selectedIndex = 0;
            document.getElementById('ddlLevel').selectedIndex = 0;

            $("#chkActive").prop("checked", false);


        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function GetCriteria() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GetCriteriaAll",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadCriteriaAll(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadCriteriaAll(data) {


    if ($.fn.dataTable.isDataTable('#tblCriteria')) {
        accounttablevar = $('#tblCriteria').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblCriteria').DataTable({

        //"order": [[1, "desc"]],
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



            { "data": "CRITERIA_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "CRITERIA_TYPE" },
            { "data": "ACTIVE" },

            {
                "date": "CRITERIA_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnCriteriaEdit(\'' + full["CRITERIA_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "CRITERIA_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnCriteriaDelete(\'' + full["CRITERIA_CODE"] + '\')"></input>';

                }
            },

        ],

    });




}
var CriteriaCODE;
function OnCriteriaEdit(CRITERIA_CODE, DESCRIPTION, ACTIVE) {

    var critLength = CRITERIA_CODE.length;
    if (critLength <= 1) {
        document.getElementById("lbllevel").innerText = 'Level 1';

    }
    else if (critLength == 3) {
        document.getElementById("lbllevel").innerText = 'Level 2';

    }
    else if (critLength == 6) {
        document.getElementById("lbllevel").innerText = 'Level 3';

    }
    else if (critLength == 8) {
        document.getElementById("lbllevel").innerText = 'Level 4';

    }
    CriteriaCODE = CRITERIA_CODE;
    $('#EditCriteria').modal('show');
    document.getElementById("txtUptCriteria").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkUptActive").prop("checked", true);
    }
    else {
        $("#chkUptActive").prop("checked", false);
    }



}
function OnCriteriaDelete(CRITERIA_CODE) {

    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            CriteriaCODE: CRITERIA_CODE

        };
        $.ajax({
            url: "api/Products/GETCriteriaDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                alert('Delete Successfully !')
                GetCriteria();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    }
    else {

    }
}
function UpdateCriteria() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        criteria: $('#txtUptCriteria').val(),
        active,
        CriteriaCODE
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetCriteria();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



// Value Condition///
function GetValuesDropDown() {
    $.ajax({
        url: "api/Products/GETValue",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlValue').empty();
            $('#ddlUpdtValue').empty();
            $('#ddlValue').append($('<option>').text("Select Value"));
            $('#ddlUpdtValue').append($('<option>').text("Select Value"));

            $.each(data, function (i, value) {
                $('#ddlUpdtValue').append($('<option>').text(value.DESCERIPTION).attr('value', value.VALUE_CODE));
                $('#ddlValue').append($('<option>').text(value.DESCERIPTION).attr('value', value.VALUE_CODE));
            });

            $('#ddlValue').chosen();
            //$('#ddlUpdtValue').chosen();

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}



function GetCriteriaDropDown() {

    $.ajax({
        url: "api/Products/GETCriteria",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('.dropdown-submenu').append('<a style="display: inherit;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a>');
                    $('.dropdown-submenuSpecific').append('<a style="display: inherit;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a>');
                    $('.dropdown-submenuspecificContraint').append('<a style="display: inherit;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a>');


                    //< li class= "dropdown-submenu" > <a class="test" value=' + data[i].CRITERIA_CODE + ' tabindex="-1" href="#">' + data[i].DESCRIPTION + '<span class="caret"></span></a></li > ');

                    // < li > <a value=' + data[i].CRITERIA_CODE + ' class="test" tabindex="-1" href="#">' + data[i].DESCRIPTION + ' <span style="margin-left: 7px;font - size: 18px;" class="fa fa-caret-right"></span></a></li > ');
                }
            }

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

$(document).on("click", ".dropdown-submenu a", function (e) {

    $('#submenu').show();
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();

    var critValue = $(this).attr("value");
    var critDesc = $(this).text();
    var ajax_data = {

        critValue: critValue
    };

    $.ajax({
        url: "api/Products/GETCriteriaDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#submenu').empty();
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#submenu').append('<li><a style="display: -webkit-box;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');
                    $('#submenuSpecific').append('<li><a style="display: -webkit-box;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');


                }
            }
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



});
var SearchconditionCol;
$(document).on("click", "#submenu li a", function () {
    debugger
    var critDValue = $(this).attr("value");
    var critDDesc = $(this).text();
    $('#btnCriteria').val(critDValue);
    $('#btnCriteria').text(critDDesc);
    SearchconditionCol = $(this).data('condcol');


    $('#submenu').hide();
    bindValue(critDValue);
});


$(document).on("click", ".dropdown-submenuSpecific a", function (e) {

    $('#submenuSpecific').empty();
    $('#submenuSpecific').show();

    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();

    var critValue = $(this).attr("value");
    var critDesc = $(this).text();
    var ajax_data = {

        critValue: critValue
    };

    $.ajax({
        url: "api/Products/GETCriteriaDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#submenu').empty();
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {

                    $('#submenuSpecific').append('<li><a style="display: -webkit-box;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');


                }
            }
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



});
$(document).on("click", "#submenuSpecific li a", function () {

    var critDValue = $(this).attr("value");
    var critDDesc = $(this).text();
    $('#SpecificbtnCriteria').val(critDValue);
    $('#SpecificbtnCriteria').text(critDDesc);
    SearchconditionCol = $(this).data('condcol');


    $('#submenuSpecific').hide();
    bindValue(critDValue);
});

$(document).on("click", ".dropdown-submenuspecificContraint a", function (e) {
    $('#submenuspecificContraint').empty();
    $('#submenuspecificContraint').show();
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();

    var critValue = $(this).attr("value");
    var critDesc = $(this).text();
    var ajax_data = {

        critValue: critValue
    };

    $.ajax({
        url: "api/Products/GETCriteriaDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#submenu').empty();
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {

                    $('#submenuspecificContraint').append('<li><a style="display: -webkit-box;margin-left: 20px;" data-condcol=' + data[i].SECTOR_DESC + ' class="submenu" value=' + data[i].CRITERIA_CODE + ' href="#">' + data[i].DESCRIPTION + '</a></li>');


                }
            }
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



});
$(document).on("click", "#submenuspecificContraint li a", function () {
    debugger
    var critDValue = $(this).attr("value");
    var critDDesc = $(this).text();
    $('#SpecificbtnCriteriaConstraint').val(critDValue);
    $('#SpecificbtnCriteriaConstraint').text(critDDesc);
    SearchconditionCol = $(this).data('condcol');


    $('#submenuspecificContraint').hide();
    bindValue(critDValue);
});



function InsertValueCondition() {


    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    var e = document.getElementById("ddlValue");
    var value = e.options[e.selectedIndex].value;

    var eCriteria = document.getElementById("ddlCriteria");
    var Criteria = eCriteria.options[eCriteria.selectedIndex].value;

    var ajax_data = {
        value,
        Criteria
    };


    $.ajax({
        url: "api/Products/GETInsertValueCond",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            $('#ddlValue').val(null).trigger("chosen:updated");
            $('#ddlCriteria').val(null).trigger("chosen:updated");

            GetValueCondition();
        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetValueCondition() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETValueCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadConditionValue(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadConditionValue(data) {


    if ($.fn.dataTable.isDataTable('#tblConditionValue')) {
        accounttablevar = $('#tblConditionValue').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblConditionValue').DataTable({
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



            { "data": "VAL_CON_CODE" },
            { "data": "DESCERIPTION" },
            { "data": "DESCRIPTION" },

            {
                "date": "VAL_CON_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnValueConditionEdit(\'' + full["VAL_CON_CODE"] + '\',\'' + full["CRITERIA_CODE"] + '\',\'' + full["VALUE_CODE"] + '\')"></input>';

                }
            },
            {
                "date": "VAL_CON_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnValueConditionDelete(' + full["VAL_CON_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var CondValCode;
function OnValueConditionEdit(VAL_CON_CODE, CRITERIA_CODE, VALUE_CODE) {
    debugger
    CondValCode = VAL_CON_CODE;

    $('#ddlUpdtCriteria').val(CRITERIA_CODE);
    $('#ddlUpdtValue').val(VALUE_CODE);
    $('#EditValueCondition').modal('show');
    //document.getElementById("ddlUpdtValue").selectedValue = DESCERIPTION,
    //    //document.getElementById("ddlUpdtValue").value = DESCERIPTION;
    //    document.getElementById("ddlUpdtCriteria").value = DESCRIPTION;



}
function OnValueConditionDelete(VAL_CON_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            CondValCode: VAL_CON_CODE

        };
        $.ajax({
            url: "api/Products/GETValueCondDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetValueCondition();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    }
    else {

    }
}
function UpdateValCondition() {


    var ajax_data = {
        value: document.getElementById("ddlUpdtValue").value,
        Criteria: document.getElementById("ddlUpdtCriteria").value,
        CondValCode
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateValueCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetValueCondition();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}




/// Expert MAster/////
function GetGeneralExpertDropDown() {
    $.ajax({
        url: "api/Products/GETGeneralExpert",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlUptExpertMaster').empty();
            $('#ddlExpertMaster').empty();
            $('#ddlExpertMasterSpecific').empty();
            $('#ddlExpertMasterSpecificConstraint').empty();

            $('#ddlUptExpertMaster').append($('<option>').text("Select Expert Master"));
            $('#ddlExpertMaster').append($('<option>').text("Select Expert Master"));
            $('#ddlExpertMasterSpecific').append($('<option>').text("Select Expert Master"));
            $('#ddlExpertMasterSpecificConstraint').append($('<option>').text("Select Expert Master"));

            $.each(data, function (i, value) {
                $('#ddlUptExpertMaster').append($('<option>').text(value.DESCRIPTION).attr('value', value.EMG_CODE));
                $('#ddlExpertMaster').append($('<option>').text(value.DESCRIPTION).attr('value', value.EMG_CODE));

                $('#ddlExpertMasterSpecific').append($('<option>').text(value.DESCRIPTION).attr('value', value.EMG_CODE));
                $('#ddlExpertMasterSpecificConstraint').append($('<option>').text(value.DESCRIPTION).attr('value', value.EMG_CODE));
            });
            $('#ddlExpertMaster').chosen();

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function GetProductDropDown() {
    $.ajax({
        url: "api/Products/GETProduct",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlProduct').empty();
            $('#ddlProduct').append($('<option>').text("Select Product"));

            $.each(data, function (i, value) {
                $('#ddlProduct').append($('<option>').text(value.DESCRIPTION).attr('value', value.P_CODE));
                $('#ddlUptProduct').append($('<option>').text(value.DESCRIPTION).attr('value', value.P_CODE));

            });
            $('#ddlProduct').chosen();
        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function GetCompanyDropDown() {
    $.ajax({
        url: "api/Products/GETCompany",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlCompany').empty();
            $('#ddlCompany').append($('<option>').text("Select Company"));
            $('#ddlUptCompany').empty();
            $('#ddlUptCompany').append($('<option>').text("Select Company"));

            $.each(data, function (i, value) {
                $('#ddlCompany').append($('<option>').text(value.DESCRIPTION).attr('value', value.C_CODE));
                $('#ddlUptCompany').append($('<option>').text(value.DESCRIPTION).attr('value', value.C_CODE));

            });
            $('#ddlCompany').chosen();
        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function InsertGeneralExpertDetail() {

    var active;
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var expMas = document.getElementById("ddlExpertMaster");
    var ExpertMaster = expMas.options[expMas.selectedIndex].value;

    var eProduct = document.getElementById("ddlProduct");
    var Product = eProduct.options[eProduct.selectedIndex].value;

    var eCompany = document.getElementById("ddlCompany");
    var Company = eCompany.options[eCompany.selectedIndex].value;

    var cat = document.getElementById("ddlCategory");
    var Category = cat.options[cat.selectedIndex].value;
    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }


    var ajax_data = {
        ExpertMaster: ExpertMaster,
        Product: Product,
        Company: Company,
        active,
        Category
    };


    $.ajax({
        url: "api/Products/GETInsertGenExpertDet",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');

            document.getElementById("ddlExpertMaster").selectedIndex = "0";
            document.getElementById("ddlProduct").selectedIndex = "0";
            document.getElementById("ddlCompany").selectedIndex = "0";
            document.getElementById("ddlCategory").selectedIndex = "0";
            $("#chkActive").prop("checked", false);

            GetGeneralExpertDetail();
        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetGeneralExpertDetail() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETGenExptMast",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadGeneralExpertDetail(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadGeneralExpertDetail(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertMastDetail')) {
        accounttablevar = $('#tblExpertMastDetail').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertMastDetail').DataTable({
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



            //{ "data": "EDG_CODE" },
            { "data": "COMPANY" },
            { "data": "PRODUCT" },
            { "data": "EXPERTMASTER" },
            { "data": "CATEGORYS" },
            { "data": "ACTIVE" },
            {
                "date": "EDG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnGeneralExpertEdit(\'' + full["EDG_CODE"] + '\',\'' + full["COMPANY"] + '\',\'' + full["PRODUCT"] + '\',\'' + full["EXPERTMASTER"] + '\',\'' + full["CATEGORYS"] + '\')"></input>';

                }
            },
            {
                "date": "EDG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnGeneralExpertDelete(' + full["EDG_CODE"] + ')"></input>';

                }
            },
            {
                "date": "EDG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Add Criteria Value"   style="height: 31px;font-size: 12px;"   onclick="AddCriteriaValue(' + full["EMG_CODE"] + ',' + full["EDG_CODE"] + ',\'' + full["COMPANY"] + '\',\'' + full["PRODUCT"] + '\',\'' + full["EXPERTMASTER"] + '\')"></input>';

                }
            },
        ],

    });




}

var edgCode;
function OnGeneralExpertEdit(EDG_CODE, COMPANY, PRODUCT, EXPERTMASTER, CATEGORYS) {
    debugger
    edgCode = EDG_CODE;
    $('#EditExpertGeneral').modal('show');
    document.getElementById("ddlUptExpertMaster").selectedValue = EXPERTMASTER,
        document.getElementById("ddlUptProduct").selectedValue = PRODUCT,
        document.getElementById("ddlUptCompany").selectedValue = COMPANY

    document.getElementById("ddlUptCategory").selectedValue = CATEGORYS




}
function OnGeneralExpertDelete(EDG_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            edgCode: EDG_CODE

        };
        $.ajax({
            url: "api/Products/GETGenExptDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                alert('Delete Successfully!')
                GetGeneralExpertDetail();


            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    }
    else {

    }
}
function UpdateGeneralExpert() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }

    var ajax_data = {
        company: document.getElementById("ddlUptCompany").value,
        Product: document.getElementById("ddlUptProduct").value,
        expertMastDet: document.getElementById("ddlUptExpertMaster").value,
        category: document.getElementById("ddlUptCategory").value,
        edgCode,
        active
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETGenExptUpdate",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            document.getElementById("ddlUptCompany").selectedIndex = "0";
            document.getElementById("ddlUptProduct").selectedIndex = "0";
            document.getElementById("ddlUptExpertMaster").selectedIndex = "0";

            GetGeneralExpertDetail();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

$(document).on("change", "#ddlCondition", function () {
    debugger
    var conditionText = $('#ddlCondition option:selected').text();

    if (conditionText == "<>" || conditionText == "Not Between") {
        $('#ddlval2').show();
    }
    else {
        $('#ddlval2').hide();
    }
});
$(document).on("change", "#ddlConditionConstraint", function () {
    debugger
    var conditionText = $('#ddlConditionConstraint option:selected').text();

    if (conditionText == "<>" || conditionText == "Not Between") {
        $('#ddlval2Constraint').show();
    }
    else {
        $('#ddlval2Constraint').hide();
    }
});

// Condition dropdow//
function GetConditonDropdown() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlCondition').empty();
            $('#ddlConditionConstraint').empty();
            $('#ddlCondition').append($('<option>').text("Select Condition"));
            $('#ddlConditionConstraint').append($('<option>').text("Select Condition"));

            $.each(data, function (i, value) {
                $('#ddlCondition').append($('<option>').text(value.DESCRIPTION).attr('value', value.CONDITON_CODE));
                $('#ddlConditionConstraint').append($('<option>').text(value.DESCRIPTION).attr('value', value.CONDITON_CODE));


            });



        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

// Criteria dropdown//
function GetCriteriadropdownPfolio() {


    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlCriteria').empty();
            $('#ddlUpdtCriteria').empty();
            $('#ddlCriteria').append($('<option>').text("Select Criteria"));
            $('#ddlUpdtCriteria').append($('<option>').text("Select Criteria"));
            $.each(data, function (i, value) {
                $('#ddlCriteria').append($('<option>').text(value.DESCRIPTION).attr('value', value.CRITERIA_CODE));
                $('#ddlUpdtCriteria').append($('<option>').text(value.DESCRIPTION).attr('value', value.CRITERIA_CODE));

            });
            $('#ddlCriteria').chosen();

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



var edgcodeinsert;
function AddCriteriaValue(EMG_CODE, EDG_CODE, COMPANY, PRODUCT, EXPERTMASTER) {
    edgcodeinsert = EMG_CODE




    $('#tblSearchCondtion tbody tr').empty();
    $('#ConditionTblDiv').hide();
    GetExpertCriteriaGeneral();
    document.getElementById('lblExpertmaster').innerText = EXPERTMASTER;
    document.getElementById('lblProduct').innerText = PRODUCT;
    document.getElementById('lblcompany').innerText = COMPANY;
    GetCriteriaDropDown();
    GetStructure();
    $('#ExpertCriteriaValue').modal('show');
}


function bindValue(criCode) {



    var ajax_data = {
        criCode

    };
    $.ajax({
        url: "api/Products/GETGenCriteriaValue",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlValueOne').empty();
            $('#ddlValueTwo').empty();
            $('#ddlValueOneConstraint').empty();
            $('#ddlValueTwoConstraint').empty();

            $('#ddlValueOne').append($('<option>').text("Select Value 1"));
            $('#ddlValueTwo').append($('<option>').text("Select Value 2"));
            $('#ddlValueOneConstraint').append($('<option>').text("Select Value 1"));
            $('#ddlValueTwoConstraint').append($('<option>').text("Select Value 2"));
            $.each(data, function (i, value) {

                $('#ddlValueOne').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));
                $('#ddlValueTwo').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));
                $('#ddlValueOneConstraint').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));
                $('#ddlValueTwoConstraint').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));



            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });


}

// Expert Criteria General///

function InsertExpertCriteriaGeneral() {

    var Criteria = $('#btnCriteria').val();
    var condition = $('#ddlCondition option:selected').val();
    var val1 = $('#ddlValueOne option:selected').val();
    var val2 = $('#ddlValueTwo option:selected').val();

    if (val1 == 'Select Value 1') {
        val1 = '';
    }
    else {
        val1 = val1;
    }

    if (val2 == 'Select Value 2') {
        val2 = '';
    }
    else {
        val2 = val2;
    }
    var active;

    if (document.getElementById("chkCritActive").checked) {
        active = "Yes";
    }
    else {
        active = 'No';
    }

    var ajax_data = {
        edgcodeinsert: edgcodeinsert,
        Criteria: Criteria,
        condition: condition,
        val1: val1,
        val2: val2,
        active: active,
        parametertype: 'Parameter'
    };


    $.ajax({
        url: "api/Products/GETInsertExpertCriteriaGenereal",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            $('#btnCriteria').text('Select Criteria');
            document.getElementById("ddlCondition").selectedIndex = "0";
            document.getElementById("ddlValueOne").selectedIndex = "0";
            document.getElementById("ddlValueTwo").selectedIndex = "0";
            //document.getElementById("ddlExpertMaster").selectedIndex = "0";
            $("#chkCritActive").prop("checked", false);
            GetExpertCriteriaGeneral();
            GetExpertCriteriaGeneralConstaint();


        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });




}



function LoadExpertResult(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertResult')) {
        accounttablevar = $('#tblExpertResult').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertResult').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "" },
            { "data": "" },
            { "data": "" },



        ],

    });




}


function GetExpertCriteriaGeneral() {



    var ajax_data = {

        edgcodeinsert: edgcodeinsert,
        parametertype: 'Parameter'
    };
    $.ajax({
        url: "api/Products/GETGenCriteriaGeneral",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadtblExpertCriteriaGeneral(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadtblExpertCriteriaGeneral(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertCriteriaGeneral')) {
        accounttablevar = $('#tblExpertCriteriaGeneral').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertCriteriaGeneral').DataTable({
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
        "pageLength": 5,
        "sPaginationType": "simple",
        data: data,

        dom: 'Bfrtip',
        select: true,
        "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": true
            },
        ],
        "columns": [



            //   { "data": "ECG_CODE" },
            //{ "data": "EMG_CODE" },
            { "data": "CRITERIA_CODE" },
            { "data": "CRITERIA" },
            { "data": "CONDITION" },
            { "data": "VALUE1" },
            { "data": "VALUE2" },
            { "data": "ACTIVE" },

            {
                "date": "ECG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnGeneralExpertCriteriaDelete(' + full["ECG_CODE"] + ')"></input>';

                }
            },
            {
                "date": "ECG_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditGeneralExpertCriteria(\'' + full["ECG_CODE"] + '\',\'' + full["CRITERIA"] + '\',\'' + full["CRITERIA_CODE"] + '\',\'' + full["CONDITION"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },

        ],

    });




}

function GetExpertCriteriaGeneralConstaint() {



    var ajax_data = {

        edgcodeinsert: edgcodeinsert,
        parametertype: 'Constraint'
    };
    $.ajax({
        url: "api/Products/",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadtblExpertCriteriaGeneralConstaint(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadtblExpertCriteriaGeneralConstaint(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertCriteriaGeneralConstaint')) {
        accounttablevar = $('#tblExpertCriteriaGeneralConstaint').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertCriteriaGeneralConstaint').DataTable({
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
        "pageLength": 5,
        "sPaginationType": "simple",
        data: data,

        dom: 'Bfrtip',
        select: true,
        "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": true
            },
        ],
        "columns": [



            //   { "data": "ECG_CODE" },
            //{ "data": "EMG_CODE" },
            { "data": "CRITERIA_CODE" },
            { "data": "CRITERIA" },
            { "data": "CONDITION" },
            { "data": "VALUE1" },
            { "data": "VALUE2" },
            { "data": "ACTIVE" },

            {
                "date": "ECG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnGeneralExpertCriteriaDelete(' + full["ECG_CODE"] + ')"></input>';

                }
            },
            {
                "date": "ECG_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditGeneralExpertCriteria(\'' + full["ECG_CODE"] + '\',\'' + full["CRITERIA"] + '\',\'' + full["CRITERIA_CODE"] + '\',\'' + full["CONDITION"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },

        ],

    });




}

var ExpertGenCritCode;
function onEditGeneralExpertCriteria(ECG_CODE, CRITERIA, CRITERIA_CODE, CONDITION, VALUE_CODE, VALUE_CODE, ACTIVE) {
    debugger
    $('#btnCriteria').text(CRITERIA);
    bindValue(CRITERIA_CODE);
    $('#ddlCondition option:selected').text(CONDITION);
    $('#ddlValueOne option:selected').val(VALUE_CODE);
    $('#ddlValueTwo option:selected').val(VALUE_CODE);
    if (CONDITION == "<>" || CONDITION == "Not Between") {
        $('#ddlval2').show();
    }
    else {
        $('#ddlval2').hide();
    }
    if (ACTIVE == 'Yes') {
        $("#chkCritActive").prop("checked", true);
    }
    else {
        $("#chkCritActive").prop("checked", false);
    }
    ExpertGenCritCode = ECG_CODE;
    $('#btnAddCriteraValue').hide();
    $('#btnUptGEC').show();

    //$('#EditGeneralExpertCriteria').modal('show');


    //GetUpdateCriteriadropdown();
    //GetUpdtConditonDropdown();
    //var ddlCri = document.getElementById("ddlUpdCriteria");
    //ddlCri.options[ddlCri.selectedIndex].text = CRITERIA;
    //var ddlCond = document.getElementById("ddlUptCondition");
    //ddlCond.options[ddlCond.selectedIndex].text = CONDITION;

    //var ddlval1 = document.getElementById("ddlUptValueOne");
    //ddlval1.options[ddlval1.selectedIndex].text = VALUE1;

    //var ddlval2 = document.getElementById("ddlUptValueTwo");
    //ddlval2.options[ddlval2.selectedIndex].text = VALUE2;

    if (ACTIVE == 'Yes') {
        $("#chkUptCritActive").prop("checked", true);
    }
    else {
        $("#chkUptCritActive").prop("checked", false);
    }


}
function OnGeneralExpertCriteriaDelete(ECG_CODE) {
    if (confirm("Are you sure you want to Delete?")) {


        var ajax_data = {
            ExpertCriteriaGeneralCode: ECG_CODE

        };
        $.ajax({
            url: "api/Products/GETDeleteGeneralExptCriteria",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                alert('Delete Successfully !');

                GetExpertCriteriaGeneral();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateGeneralExpertCriteria() {
    var Criteria = $('#btnCriteria').val();
    var condition = $('#ddlCondition option:selected').val();
    var val1 = $('#ddlValueOne option:selected').val();
    var val2 = $('#ddlValueTwo option:selected').val();

    if (val1 == 'Select Value 1') {
        val1 = '';
    }
    else {
        val1 = val1;
    }

    if (val2 == 'Select Value 2') {
        val2 = '';
    }
    else {
        val2 = val2;
    }
    var active;

    if (document.getElementById("chkCritActive").checked) {
        active = "Yes";
    }
    else {
        active = 'No';
    }



    var ajax_data = {

        Criteria: Criteria,
        condition: condition,
        val1: val1,
        val2: val2,
        active: active,
        ExpertGenCritCode: ExpertGenCritCode
    };

    $.ajax({
        url: "api/Products/GETUpdateGeneralExptCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            $('#btnCriteria').text('Select Criteria');
            document.getElementById("ddlCondition").selectedIndex = "0";
            document.getElementById("ddlValueOne").selectedIndex = "0";
            document.getElementById("ddlValueTwo").selectedIndex = "0";
            document.getElementById("ddlExpertMaster").selectedIndex = "0";
            $("#chkCritActive").prop("checked", false);
            GetExpertCriteriaGeneral();
            $('#btnAddCriteraValue').show();

            $('#btnUptGEC').hide();
        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}





/// Order Type///////


function InsertOrderType() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        orderType: $('#txtOrderType').val()


    };


    $.ajax({
        url: "api/Products/GETInsetOrderType",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetOrderType();
            document.getElementById("txtOrderType").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetOrderType() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];


    $.ajax({
        url: "api/Products/GETOrderType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadOrderType(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadOrderType(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblOrderType')) {
        accounttablevar = $('#tblOrderType').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblOrderType').DataTable({
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


            { "data": "ORDER_TYPE_ID" },
            { "data": "ORDER_TYPE_DESC" },

            {
                "date": "ORDER_TYPE_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnEditOrderType(\'' + full["ORDER_TYPE_ID"] + '\',\'' + full["ORDER_TYPE_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "ORDER_TYPE_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnDeleteOrderType(' + full["ORDER_TYPE_ID"] + ')"></input>';

                }
            },


        ],

    });


}
var orderTypeCode;
function OnEditOrderType(ORDER_TYPE_ID, ORDER_TYPE_DESC) {
    orderTypeCode = ORDER_TYPE_ID;
    $('#EditOrderType').modal('show');
    document.getElementById("txtUpdtOrderType").value = ORDER_TYPE_DESC;


}
function OnDeleteOrderType(ORDER_TYPE_ID) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            orderTypeCode: ORDER_TYPE_ID

        };
        $.ajax({
            url: "api/Products/GETDeleteOrderType",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetOrderType();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateOrderType() {

    var ajax_data = {
        orderType: $('#txtUpdtOrderType').val(),

        orderTypeCode
    };
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];
    $.ajax({
        url: "api/Products/GETUpdateOrderType",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetOrderType();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

//// Action Type////


function InsertActionType() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        ActionType: $('#txtActionType').val()


    };


    $.ajax({
        url: "api/Products/GETInsetActionType",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetActionType();
            document.getElementById("txtActionType").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetActionType() {



    $.ajax({
        url: "api/Products/GETActionType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadActionType(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadActionType(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblActionType')) {
        accounttablevar = $('#tblActionType').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblActionType').DataTable({
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

        select: true,


        "columns": [


            { "data": "ACTION_ID" },
            { "data": "ACTION_TYPE_DESC" },

            {
                "date": "ACTION_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnEditActionType(\'' + full["ACTION_ID"] + '\',\'' + full["ACTION_TYPE_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "ACTION_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnDeleteActionType(' + full["ACTION_ID"] + ')"></input>';

                }
            },


        ],

    });


}
var actionTypeCode;
function OnEditActionType(ACTION_ID, ACTION_TYPE_DESC) {
    actionTypeCode = ACTION_ID;
    $('#EditActionType').modal('show');
    document.getElementById("txtUpdtActionType").value = ACTION_TYPE_DESC;


}
function OnDeleteActionType(ACTION_ID) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            actionTypeCode: ACTION_ID

        };
        $.ajax({
            url: "api/Products/GETDeleteActionType",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetActionType();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateActionType() {

    var ajax_data = {
        actionType: $('#txtUpdtActionType').val(),

        actionTypeCode
    };

    $.ajax({
        url: "api/Products/GETUpdateActionType",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetActionType();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

///// timming/////////////

function InsertTimming() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        Timming: $('#txtTimming').val()


    };


    $.ajax({
        url: "api/Products/GETInsetTimming",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetTimming();
            document.getElementById("txtTimming").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetTimming() {



    $.ajax({
        url: "api/Products/GETTimming",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadTimming(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadTimming(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblTimming')) {
        accounttablevar = $('#tblTimming').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblTimming').DataTable({
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


            { "data": "TIMMING_ID" },
            { "data": "TIMMING_DESC" },

            {
                "date": "TIMMING_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnEditTimming(\'' + full["TIMMING_ID"] + '\',\'' + full["TIMMING_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "TIMMING_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnDeleteTimming(' + full["TIMMING_ID"] + ')"></input>';

                }
            },


        ],

    });


}
var timmingCode;
function OnEditTimming(TIMMING_ID, TIMMING_DESC) {
    timmingCode = TIMMING_ID;
    $('#EditTimming').modal('show');
    document.getElementById("txtUpdtTimming").value = TIMMING_DESC;


}
function OnDeleteTimming(TIMMING_ID) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            TimmingCode: TIMMING_ID

        };
        $.ajax({
            url: "api/Products/GETDeleteTimming",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetTimming();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateTimming() {

    var ajax_data = {
        Timming: $('#txtUpdtTimming').val(),

        timmingCode
    };

    $.ajax({
        url: "api/Products/GETUpdateTimming",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetTimming();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}


/////////// Order Progress//////

function InsertOrderProgress() {
    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {
        OrderProgress: $('#txtOrderProgress').val()


    };


    $.ajax({
        url: "api/Products/GETInsetOrderProgress",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetOrderProgress();
            document.getElementById("txtOrderProgress").value = '';




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetOrderProgress() {



    $.ajax({
        url: "api/Products/GETOrderProgress",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadOrderProgress(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadOrderProgress(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblOrderProgress')) {
        accounttablevar = $('#tblOrderProgress').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblOrderProgress').DataTable({
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


            { "data": "ORDER_PROGRESS_ID" },
            { "data": "ORDER_PROGRESS_DESC" },

            {
                "date": "ORDER_PROGRESS_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnEditOrderProgress(\'' + full["ORDER_PROGRESS_ID"] + '\',\'' + full["ORDER_PROGRESS_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "ORDER_PROGRESS_ID",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnDeleteOrderProgress(' + full["ORDER_PROGRESS_ID"] + ')"></input>';

                }
            },


        ],

    });


}
var orderProgCode;
function OnEditOrderProgress(ORDER_PROGRESS_ID, ORDER_PROGRESS_DESC) {
    orderProgCode = ORDER_PROGRESS_ID;
    $('#EditOrderProgress').modal('show');
    document.getElementById("txtUpdtOrderProgress").value = ORDER_PROGRESS_DESC;


}
function OnDeleteOrderProgress(ORDER_PROGRESS_ID) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            orderProgCode: ORDER_PROGRESS_ID

        };
        $.ajax({
            url: "api/Products/GETDeleteOrderProgress",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetOrderProgress();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateOrderProgress() {

    var ajax_data = {
        OrderProgress: $('#txtUpdtOrderProgress').val(),

        orderProgCode
    };

    $.ajax({
        url: "api/Products/GETUpdateOrderProgress",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetOrderProgress();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}







function GetNominee() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadNominee(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadNominee(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblNominee')) {
        accounttablevar = $('#tblNominee').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblNominee').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "CLIENT_CODE" },
            { "data": "NAME" },
            { "data": "NIC" },
            { "data": "SHARED" },
            { "data": "PHONE" },
            { "data": "ACTIVE" },



        ],

    });




}

function GetSpecificExpert() {

    //var getUrl = window.location;
    //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: "api/",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadSpecificExpert(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadSpecificExpert(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblSpecificExpert')) {
        accounttablevar = $('#tblSpecificExpert').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSpecificExpert').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "EMS_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "ACTIVE" },



        ],

    });




}



function GetClientDropdown() {



    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlClient').empty();
            $('#ddlClient').append($('<option>').text("Select Client"));
            $('#ddlUpdClient').empty();
            $('#ddlUpdClient').append($('<option>').text("Select Client"));

            $.each(data, function (i, value) {
                $('#ddlClient').append($('<option>').text(value.DESCRIPTION).attr('value', value.CLIENT_CODE));
                $('#ddlUpdClient').append($('<option>').text(value.DESCRIPTION).attr('value', value.CLIENT_CODE));
            });

            $('#ddlClient').chosen();

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function GetActionTypeDropdown() {



    $.ajax({
        url: "api/Products/GETActionType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            $('#ddlActionType').empty();
            $('#ddlActionType').append($('<option>').text("Select Action Type"));
            $('#ddlUpdActionType').empty();
            $('#ddlUpdActionType').append($('<option>').text("Select Action Type"));
            $.each(data, function (i, value) {
                $('#ddlActionType').append($('<option>').text(value.ACTION_TYPE_DESC).attr('value', value.ACTION_ID));
                $('#ddlUpdActionType').append($('<option>').text(value.ACTION_TYPE_DESC).attr('value', value.ACTION_ID));

            });

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}


function GetBrokerDropdown() {



    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETBroker",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlBroker').empty();
            $('#ddlBroker').append($('<option>').text("Select Broker"));
            $('#ddlUpdBroker').empty();
            $('#ddlUpdBroker').append($('<option>').text("Select Broker"));
            $.each(data, function (i, value) {
                $('#ddlBroker').append($('<option>').text(value.DESCRIPTION).attr('value', value.BROKER_CODE));
                $('#ddlUpdBroker').append($('<option>').text(value.DESCRIPTION).attr('value', value.BROKER_CODE));

            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function GetTimmingDropdown() {



    $.ajax({
        url: "api/Products/GETTimming",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {


            $('#ddlTimming').empty();
            $('#ddlTimming').append($('<option>').text("Select Timming"));

            $.each(data, function (i, value) {
                $('#ddlTimming').append($('<option>').text(value.TIMMING_DESC).attr('value', value.TIMMING_ID));

            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function GetOrderTypeDropdown() {




    $.ajax({
        url: "api/Products/GETOrderType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {


            $('#ddlOrderType').empty();
            $('#ddlOrderType').append($('<option>').text("Select Order Type"));
            $('#ddlUptOrderType').empty();
            $('#ddlUptOrderType').append($('<option>').text("Select Order Type"));

            $.each(data, function (i, value) {
                $('#ddlOrderType').append($('<option>').text(value.ORDER_TYPE_DESC).attr('value', value.ORDER_TYPE_ID));
                $('#ddlUptOrderType').append($('<option>').text(value.ORDER_TYPE_DESC).attr('value', value.ORDER_TYPE_ID));
            });
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function GetOrderProgressDropdown() {
    $.ajax({
        url: "api/Products/GETOrderProgress",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {
            console.log(data);
            $('#ddlOrderProgress').empty();
            $('#ddlOrderProgress').append($('<option>').text("Select Order Progress"));
            $('#ddlUpdOrderProgress').empty();
            $('#ddlUpdOrderProgress').append($('<option>').text("Select Order Progress"));
            $.each(data, function (i, value) {
                $('#ddlOrderProgress').append($('<option>').text(value.ORDER_PROGRESS_DESC).attr('value', value.ORDER_PROGRESS_ID));
                $('#ddlUpdOrderProgress').append($('<option>').text(value.ORDER_PROGRESS_DESC).attr('value', value.ORDER_PROGRESS_ID));


            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function InsertOrder() {

    var active;


    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }

    var client = document.getElementById("ddlClient");
    var clientvalue = client.options[client.selectedIndex].value;
    var clientid;
    if (clientvalue == 'Select Client') {
        clientid = '';
    }
    else {
        clientid = clientvalue;
    }


    var ActionType = document.getElementById("ddlActionType");
    var ActionTypevalue = ActionType.options[ActionType.selectedIndex].value;
    var ActionTypeid;
    if (ActionTypevalue == 'Select Action Type') {
        ActionTypeid = '';
    }
    else {
        ActionTypeid = ActionTypevalue;
    }

    var ddlSymbol = document.getElementById("ddlSymbol");
    var ddlSymbolvalue = ddlSymbol.options[ddlSymbol.selectedIndex].value;
    var ddlSymbolid;
    if (ddlSymbolvalue == 'Select Symbol') {
        ddlSymbolid = '';
    }
    else {
        ddlSymbolid = ddlSymbolvalue;
    }


    var ddlOrderType = document.getElementById("ddlOrderType");
    var ddlOrderTypevalue = ddlOrderType.options[ddlOrderType.selectedIndex].value;
    var ddlOrderTypeid;
    if (ddlOrderTypevalue == 'Select Order Type') {
        ddlOrderTypeid = '';
    }
    else {
        ddlOrderTypeid = ddlOrderTypevalue;
    }



    var ddlTimming = document.getElementById("ddlTimming");
    var ddlTimmingvalue = ddlTimming.options[ddlTimming.selectedIndex].value;
    var ddlTimmingid;
    if (ddlTimmingvalue == 'Select Order Type') {
        ddlTimmingid = '';
    }
    else {
        ddlTimmingid = ddlTimmingvalue;
    }


    var ddlBroker = document.getElementById("ddlBroker");
    var ddlBrokervalue = ddlBroker.options[ddlBroker.selectedIndex].value;
    var ddlBrokerid;
    if (ddlBrokervalue == 'Select Order Type') {
        ddlBrokerid = '';
    }
    else {
        ddlBrokerid = ddlBrokervalue;
    }
    var ddlOrderProgress = document.getElementById("ddlOrderProgress");
    var ddlOrderProgressvalue = ddlOrderProgress.options[ddlOrderProgress.selectedIndex].value;
    var ddlOrderProgressid;
    if (ddlOrderProgressvalue == 'Select Order Type') {
        ddlOrderProgressid = '';
    }
    else {
        ddlOrderProgressid = ddlOrderProgressvalue;
    }

    var ajax_data = {
        clientid,
        ActionTypeid,
        ddlSymbolid,
        orderDate: $('#txtOrderDate').val(),
        quantity: $('#txtQuantity').val(),
        rate1: $('#txtRateOne').val(),
        rate2: $('#txtRateTwo').val(),
        ddlOrderTypeid,
        ddlTimmingid,
        ddlBrokerid,
        ddlOrderProgressid,
        Active: active

    };


    $.ajax({
        url: "api/Products/GETInsertOrder",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');

            document.getElementById("ddlClient").selectedValue = 0;
            document.getElementById("ddlActionType").selectedValue = 0;
            document.getElementById("ddlSymbol").selectedValue = 0;
            document.getElementById("ddlOrderType").selectedValue = 0;
            document.getElementById("ddlTimming").selectedValue = 0;
            document.getElementById("ddlBroker").selectedValue = 0;
            document.getElementById("ddlOrderProgress").selectedValue = 0;
            document.getElementById("txtOrderDate").value = '';
            document.getElementById("txtQuantity").value = '';
            document.getElementById("txtRateOne").value = '';
            document.getElementById("txtRateTwo").value = '';
            $("#chkGXActive").prop("checked", false);


            GetOrders();
        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });


}
function GetOrders() {


    $.ajax({
        url: "api/Products/GetOrders",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadOrders(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });
}
function LoadOrders(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblOrders')) {
        accounttablevar = $('#tblOrders').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblOrders').DataTable({
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


            { "data": "ORDER_IDX" },
            { "data": "DESCRIPTION" },
            { "data": "ACTION_TYPE_DESC" },
            { "data": "ORDER_TYPE_DESC" },
            { "data": "BROKER" },

            { "data": "ORDER_DATE" },
            { "data": "ORDER_PROGRESS_DESC" },


            { "data": "QUANTITY" },
            { "data": "RATE_1" },

            { "data": "RATE_2" },


            {
                "date": "ORDER_IDX",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"  onclick="OnOrderEdit(\'' + full["ORDER_IDX"] + '\',\'' + full["BROKER_ID"] + '\',\'' + full["ACTION_ID"] + '\',\'' + full["ORDER_PROGRESS_ID"] + '\',\'' + full["ORDER_DATE"] + '\',\'' + full["SYMBOL"] + '\',\'' + full["QUANTITY"] + '\',\'' + full["RATE_1"] + '\',\'' + full["RATE_2"] + '\',\'' + full["ORDER_TYPE_ID"] + '\',\'' + full["CLIENT_CODE"] + '\')"></input>';

                }
            },
            {
                "date": "ORDER_IDX",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnOderDelete(\'' + full["ORDER_IDX"] + '\')"></input>';

                }
            },


            {
                "date": "ORDER_IDX",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Purchase"  style="height: 31px;font-size: 12px;"    onclick="OnPurchase(\'' + full["ORDER_IDX"] + '\')"></input>';

                }
            },


        ],

    });


}

var orderid;
function OnOrderEdit(ORDER_IDX, BROKER_ID, ACTION_ID, ORDER_PROGRESS_ID, ORDER_DATE, SYMBOL, QUANTITY,
    RATE_1, RATE_2, ORDER_TYPE_ID, CLIENT_CODE) {
    orderid = ORDER_IDX;
    //GetUptClientDropdown();
    //GetUptActionTypeDropdown();
    //GetUptOrderTypeDropdown();
    //GetUptOrderProgressDropdown();
    //GetUptBrokerDropdown();
    if (RATE_1 == 'null') {
        RATE_1 = '';
    } else {
        RATE_1
    }
    if (RATE_2 == 'null') {
        RATE_2 = '';
    } else {
        RATE_2
    }
    $('#ddlUpdClient').val(CLIENT_CODE);
    $('#ddlUpdActionType').val(ACTION_ID);
    $('#ddlUpdSymbol option:selected').text(SYMBOL);
    $('#txtUpdOrderDate').val(ORDER_DATE);
    $('#txtUpdQuantity').val(QUANTITY);
    $('#txtUpdRateOne').val(RATE_1);
    $('#txtUpdRateTwo').val(RATE_2);
    $('#ddlUpdBroker').val(BROKER_ID);
    $("#ddlUptOrderType").val(ORDER_TYPE_ID);
    $("#ddlUpdOrderProgress").val(ORDER_PROGRESS_ID);

    $('#EditOder').modal('show');

}
function OnOderDelete(ORDER_IDX) {
    if (confirm("Are you sure you want to Delete?")) {

        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            orderid: ORDER_IDX

        };
        $.ajax({
            url: "api/Products/GETDeleteOrder",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                GetOrders();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateOrder() {
    var r1, r2;
    var eordertype = document.getElementById("ddlUptOrderType");
    var OType = eordertype.options[eordertype.selectedIndex].text;
    //var OType  $("#txtUpdOrderDate option:selected").text();
    if (OType == 'Market Order') {
        r1 = '';
        r2 = '';
    }
    else {
        r1 = $('#txtUpdRateOne').val()
        r2 = $('#txtUpdRateTwo').val()
    }
    debugger
    var ajax_data = {
        client: $('#ddlUpdClient').val(),
        actionType: $('#ddlUpdActionType').val(),
        symbol: $('#ddlUpdSymbol').val(),
        orderDate: $('#txtUpdOrderDate').val(),
        quantity: $('#txtUpdQuantity').val(),
        rate1: r1,
        rate2: r2,
        orderType: $('#ddlUptOrderType').val(),
        orderProgres: $('#ddlUpdOrderProgress').val(),

        orderid



    };


    $.ajax({
        url: "api/Products/GETUpdateOrders",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetOrders();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



var orderid;
function OnPurchase(ORDER_IDX) {
    orderid = ORDER_IDX;


    $('#PurchasedModal').modal('show');
    GetPurchaseOrders();

}

function InsertPurchase() {


    var ajax_data = {
        orderid,
        purchaseDate: $('#txtPurchaseDateTime').val(),
        PurchaseQuant: $('#txtPurchaseQuantity').val(),
        Rate: $('#txtRate').val()
    };

    $.ajax({
        url: "api/Products/GetInsertPurchase",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            alert('Add Successfully !');
            document.getElementById("txtPurchaseDateTime").value = '';
            document.getElementById("txtPurchaseQuantity").value = '';
            document.getElementById("txtRate").value = '';
            GetPurchaseOrders();
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });
}

function GetPurchaseOrders() {
    var ajax_data = {
        orderid
    };

    $.ajax({
        url: "api/Products/GetPurchaseOrders",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadPurchaseOrders(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });
}

function LoadPurchaseOrders(data) {

    debugger
    if ($.fn.dataTable.isDataTable('#tblPurchase')) {
        accounttablevar = $('#tblPurchase').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblPurchase').DataTable({
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


            { "data": "PURCHASE_ID" },
            { "data": "ORDER_IDX" },
            { "data": "PURCHASE_DATETIME" },
            { "data": "QUANTITY" },
            { "data": "RATE" }





        ],

    });


}
function GetUpdateCriteriadropdown() {


    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            $('#ddlUpdCriteria').empty();

            $('#ddlUpdCriteria').append($('<option>').text("Select Criteria"));
            $.each(data, function (i, value) {

                $('#ddlUpdCriteria').append($('<option>').text(value.DESCRIPTION).attr('value', value.CRITERIA_CODE));

            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function GetUpdtConditonDropdown() {


    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETCondition",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlUptCondition').empty();

            $('#ddlUptCondition').append($('<option>').text("Select Condition"));
            $.each(data, function (i, value) {
                $('#ddlUptCondition').append($('<option>').text(value.DESCRIPTION).attr('value', value.CONDITON_CODE));
            });



        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function bindUpdtValue(criCode) {



    var ajax_data = {
        criCode

    };
    $.ajax({
        url: "api/Products/GETGenCriteriaValue",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            $('#ddlUptValueTwo').empty();
            $('#ddlUptValueOne').empty();

            $('#ddlUptValueOne').append($('<option>').text("Select Value 1"));
            $('#ddlUptValueTwo').append($('<option>').text("Select Value 2"));
            $.each(data, function (i, value) {


                $('#ddlUptValueOne').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));
                $('#ddlUptValueTwo').append($('<option>').text(value.VAL).attr('value', value.VALUE_CODE));


            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });


}
//function GetUptClientDropdown() {



//    var ajax_data = {


//    };
//    $.ajax({
//        url: "api/Products/GETClient",
//        type: 'GET',
//        dataType: 'json',
//        data: ajax_data,
//        success: function (data) {

//            $('#ddlUpdClient').empty();
//            $('#ddlUpdClient').append($('<option>').text("Select Client"));

//            $.each(data, function (i, value) {
//                $('#ddlUpdClient').append($('<option>').text(value.DESCRIPTION).attr('value', value.CLIENT_CODE));

//            });


//        },
//        error: function (request) {
//            //notifyError('Data Load failed!');

//        }
//    });

//}

function GetUptActionTypeDropdown() {



    $.ajax({
        url: "api/Products/GETActionType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            $('#ddlUpdActionType').empty();
            $('#ddlUpdActionType').append($('<option>').text("Select Action Type"));

            $.each(data, function (i, value) {
                $('#ddlUpdActionType').append($('<option>').text(value.ACTION_TYPE_DESC).attr('value', value.ACTION_ID));

            });

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function GetUptOrderTypeDropdown() {




    $.ajax({
        url: "api/Products/GETOrderType",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {


            $('#ddlUptOrderType').empty();
            $('#ddlUptOrderType').append($('<option>').text("Select Order Type"));

            $.each(data, function (i, value) {
                $('#ddlUptOrderType').append($('<option>').text(value.ORDER_TYPE_DESC).attr('value', value.ORDER_TYPE_ID));

            });
        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



function GetUptOrderProgressDropdown() {



    $.ajax({
        url: "api/Products/GETOrderProgress",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            $('#ddlUpdOrderProgress').empty();
            $('#ddlUpdOrderProgress').append($('<option>').text("Select Order Progress"));

            $.each(data, function (i, value) {
                $('#ddlUpdOrderProgress').append($('<option>').text(value.ORDER_PROGRESS_DESC).attr('value', value.ORDER_PROGRESS_ID));

            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function GetUptBrokerDropdown() {



    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETBroker",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlUpdBroker').empty();
            $('#ddlUpdBroker').append($('<option>').text("Select Broker"));

            $.each(data, function (i, value) {
                $('#ddlUpdBroker').append($('<option>').text(value.DESCRIPTION).attr('value', value.BROKER_CODE));

            });


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



// Category //


function InsertCategory() {

    var active;


    if (document.getElementById("chkActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        Category: $('#txtCategory').val(),
        Active: active

    };


    $.ajax({
        url: "api/Products/GETInsetCategory",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            GetCategory();
            document.getElementById("txtCategory").value = '';
            $("#chkActive").prop("checked", false);



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });



}
function GetCategory() {




    $.ajax({
        url: "api/Products/GETCategory",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadCategory(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadCategory(data) {
    var tblcat;
    debugger
    if ($.fn.dataTable.isDataTable('#tblCategory')) {
        tblcat = $('#tblCategory').DataTable().clear().destroy();
    }
    tblcat = $('#tblCategory').DataTable({
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


            { "data": "CAT_CODE" },
            { "data": "CAT_DESCRIPTION" },
            { "data": "CAT_ACTIVE" },
            {
                "date": "CAT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"  style="height: 31px;font-size: 12px;"    onclick="OnCategoryEdit(\'' + full["CAT_CODE"] + '\',\'' + full["CAT_DESCRIPTION"] + '\',\'' + full["CAT_ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "CAT_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"  style="height: 31px;font-size: 12px;"    onclick="OnCategoryDelete(' + full["CAT_CODE"] + ')"></input>';

                }
            },


        ],

    });


}
var catcode;
function OnCategoryEdit(CAT_CODE, CAT_DESCRIPTION, CAT_ACTIVE) {
    catcode = CAT_CODE;
    $('#EditCategory').modal('show');
    document.getElementById("txtUptCategory").value = CAT_DESCRIPTION;
    if (CAT_ACTIVE == 'Yes') {
        $("#chkUptActive").prop("checked", true);
    }
    else {
        $("#chkUptActive").prop("checked", false);
    }


}
function OnCategoryDelete(CAT_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        //var getUrl = window.location;
        //var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

        var ajax_data = {
            catcode: CAT_CODE

        };
        $.ajax({
            url: "api/Products/GETCategoryDelete",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                alert('Delete successfully !')

                GetCategory();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}
function UpdateCategory() {
    var active;
    if (document.getElementById("chkUptActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }
    var ajax_data = {
        category: $('#txtUptCategory').val(),
        Active: active,
        catcode: catcode
    };

    $.ajax({
        url: "api/Products/GETUpdateCategory",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Update Successfully');
            GetCategory();




        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}


function GetCategoryDropDown() {
    $.ajax({
        url: "api/Products/GETCategory",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlCategory').empty();
            $('#ddlCategory').append($('<option >').text("Select Category"));
            $('#ddlUptCategory').empty();
            $('#ddlUptCategory').append($('<option >').text("Select Category"));

            $.each(data, function (i, value) {
                $('#ddlCategory').append($('<option>').text(value.CAT_DESCRIPTION).attr('value', value.CAT_CODE));
                $('#ddlUptCategory').append($('<option>').text(value.CAT_DESCRIPTION).attr('value', value.CAT_CODE));

            });

            $('#ddlCategory').chosen();


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function GetStructure() {
    $.ajax({
        url: "api/XBRL/Getstructure",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlStructure').empty();
            $('#ddlStructure').append($('<option>').text("Select Structure"));


            $.each(data, function (i, value) {
                $('#ddlStructure').append($('<option>').text(value.STRUCTURE_NAME).attr('value', value.STRUCTURE_CODE));

            });




        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });
}

function SearchConditionWiseCriteria() {

    var whereConditionArray = [];
    var testarray = [];
    var Conditiontable = $("#tblExpertCriteriaGeneral tbody");

    Conditiontable.find('tr').each(function (i) {
        var rowdata = $('#tblExpertCriteriaGeneral').dataTable().fnGetData(i);
        var CriteriaCode = rowdata.CRITERIA_CODE;
        var Criteria = rowdata.CRITERIA;
        var condition = rowdata.CONDITION;
        var val1 = rowdata.VALUE1;
        var val2 = rowdata.VALUE2;
        var condColumn = rowdata.SECTOR_DESC;
        if (condColumn != null) {

            if (condition == "<>") {
                whereCondition = condColumn + " " + "<" + " " + val1 + " " + "and" + " " + condColumn + " " + ">" + " " + val2;
            }
            else if (condition == "Not Between") {
                whereCondition = condColumn + " " + "Not Between" + " " + val1 + " " + "and" + " " + val2;
            }
            else {
                whereCondition = condColumn + condition + "'" + val1 + "'";
            }
            whereConditionArray.push(whereCondition);


        }

    });


    var WhereConditionMultiColumn = whereConditionArray.join(' or ');

    if (WhereConditionMultiColumn != "") {

        var ajax_data = {
            whereCondition: WhereConditionMultiColumn


        };
        $.ajax({
            url: "api/Products/GetSeacrhConditionData",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                LoadSearchResult(data);

                $('#ConditionTblDiv').show();
                $('#btnShowConstraintModal').show();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });



    }
    else {
        alert('Filter Column Not Map with Criteria')
    }











    //debugger
    //var Criteria = $('#btnCriteria').val();
    //var condition = $('#ddlCondition option:selected').text();
    //var val1 = $('#ddlValueOne option:selected').text();
    //var val2 = $('#ddlValueTwo option:selected').text
    //    ();


    //if (val1 == 'Select Value 1') {
    //    val1 = '';
    //}
    //else {
    //    val1 = val1;
    //}

    //if (val2 == 'Select Value 2') {
    //    val2 = '';
    //}
    //else {
    //    val2 = val2;
    //}
    //if (condition == "Select Condition") {
    //    condition = '';
    //}
    //{
    //    condition: condition;

    //}

    //SearchconditionCol = SearchconditionCol;
    //var whereCondition;
    //if (condition == "<>") {
    //    whereCondition = SearchconditionCol + " " +"<" +" "+ val1 + " "+ "and" +" "+ SearchconditionCol +" "+ ">"+" " + val2;
    //}
    //else if (condition == "Not Between") {
    //    whereCondition = SearchconditionCol +" "+ "Not Between" +" "+ val1 + " "+"and"+" " + val2;
    //}
    //else {
    //    whereCondition = SearchconditionCol + condition + "'" + val1 + "'";
    //}




    //var ajax_data = {
    //    whereCondition: whereCondition


    //};
    //$.ajax({
    //    url: "api/Products/GetSeacrhConditionData",
    //    type: 'GET',
    //    dataType: 'json',
    //    data: ajax_data,
    //    success: function (data) {

    //        LoadSearchResult(data);
    //        $('#ConditionTblDiv').show();

    //    },
    //    error: function (request) {
    //        //notifyError('Data Load failed!');

    //    }
    //});




    //$('#ConditionSearchModal').modal('show');

}

function LoadSearchResult(data) {


    if ($.fn.dataTable.isDataTable('#tblSearchCondtion')) {
        accounttablevar = $('#tblSearchCondtion').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSearchCondtion').DataTable({
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
        "pageLength": 5,
        data: data,
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "COMPANY_NAME" },
            { "data": "COMPANY_SYMBOL" },
            { "data": "PRICE" },
            { "data": "CHANGEVAL" },

            { "data": "RELVOLUME" },
            { "data": "MC" },
            { "data": "INDUSTRY_DESC" },
            { "data": "SECTOR_DESC" },


        ],

    });




}

var condCol;
function GetCondtionColumn() {






    //return condCol;
}


function GetUserType() {
    $.ajax({
        url: "api/XBRL/GetUSerType",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            $('#ddlUserType').empty();

            //$('#ddlUptExpertMaster').append($('<option>').text("Select Expert Master"));
            //$('#ddlExpertMaster').append($('<option>').text("Select Expert Master"));

            $.each(data, function (i, value) {

                $('#ddlUserType').append($('<option>').text(value.USERTYPE).attr('value', value.USERTYPE));

            });


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}


function GetUsers() {
    $.ajax({
        url: "api/XBRL/GetUSers",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            LoadUserTbl(data);



        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}


function LoadUserTbl(data) {


    if ($.fn.dataTable.isDataTable('#tblUser')) {
        accounttablevar = $('#tblUser').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblUser').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "USERID" },
            { "data": "PASSWORD" },
            { "data": "USERTYPE" },
            { "data": "PAGEALLOW" },
            { "data": "MANAGERID" },

            { "data": "EMAIL" },
            { "data": "CONTACTNO" },
            { "data": "EXTERNALUSERID" },
            { "data": "IMAGEPATH" },
            { "data": "CLIENTCODE" },
            { "data": "OUTLOOKPASSWORD" },
            { "data": "NAMEDESCRIPTION" },

            {
                "date": "USERID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditUser(\'' + full["USERID"] + '\',\'' + full["PASSWORD"] + '\',\'' + full["USERTYPE"] + '\',\'' + full["PAGEALLOW"] + '\',\'' + full["MANAGERID"] + '\',\'' + full["EMAIL"] + '\',\'' + full["CONTACTNO"] + '\',\'' + full["EXTERNALUSERID"] + '\',\'' + full["IMAGEPATH"] + '\',\'' + full["CLIENTCODE"] + '\',\'' + full["OUTLOOKPASSWORD"] + '\',\'' + full["NAMEDESCRIPTION"] + '\')"></input>';

                }
            },
            {
                "date": "USERID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteUser(\'' + full["USERID"] + '\')"></input>';

                }
            },

        ],

    });




}


function InsertUSer() {

    var ajax_data = {
        userid: $('#txtUserName').val(),
        password: $('#txtPassword').val(),
        userType: $('#ddlUserType option:selected').val(),
        pageAllow: $('#txtPageAllow').val(),
        mangerid: $('#txtManagerId').val(),
        email: $('#txtEmail').val(),
        contNo: $('#txtContactNo').val(),
        extUSer: $('#txtExternalUser').val(),
        imgPath: $('#txtImagePath').val(),
        clientCode: $('#txtClientCode').val(),
        outlokPAs: $('#txtOutlookPass').val(),
        nameDesc: $('#txtNameDescription').val()

    };
    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {
        $.ajax({
            url: "api/XBRL/GetInsertUSer",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUsers();
                alert('Add Successfully !')
                $('.txtnull').val('');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });

    } else {
        $.ajax({
            url: "api/XBRL/GetUpdateUSer",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUsers();
                alert('Update Successfully !')
                $('.txtnull').val('');
                $('#btnAdd').val('ADD')
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }

}

function onEditUser(USERID, PASSWORD, USERTYPE, PAGEALLOW, MANAGERID, EMAIL, CONTACTNO, EXTERNALUSERID, IMAGEPATH, CLIENTCODE, OUTLOOKPASSWORD, NAMEDESCRIPTION) {

    $('#txtUserName').val(USERID);
    $('#txtPassword').val(PASSWORD);
    $('#ddlUserType option:selected').text(USERTYPE);
    $('#txtPageAllow').val(PAGEALLOW);
    $('#txtManagerId').val(MANAGERID);
    $('#txtEmail').val(EMAIL);
    $('#txtContactNo').val(CONTACTNO);
    $('#txtExternalUser').val(EXTERNALUSERID);
    $('#txtImagePath').val(IMAGEPATH);
    $('#txtClientCode').val(CLIENTCODE);
    $('#txtOutlookPass').val(OUTLOOKPASSWORD);
    $('#txtNameDescription').val(NAMEDESCRIPTION);

    $('#btnAdd').val('UPDATE');
}

function onDeleteUser(USERID) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            USERID: USERID
        };

        $.ajax({
            url: "api/XBRL/GetDeleteUSer",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUsers();
                alert('Delete Successfully !')


            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });

    }
}

function GetUserDropdown() {
    $.ajax({
        url: "api/XBRL/GetUSers",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            $('#ddlUser').empty();


            $('#ddlUser').append($('<option value="0">').text("Select User"));

            $.each(data, function (i, value) {

                $('#ddlUser').append($('<option>').text(value.USERID).attr('value', value.USERID));

            });


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function GetCompanySymbolDropdown() {
    $.ajax({
        url: "api/XBRL/GetCompanySymbol",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            $('#ddlCompanysymbol').empty();


            //$('#ddlCompanysymbol').append($('<option>').text("Select Company Symbol"));

            $.each(data, function (i, value) {

                $('#ddlCompanysymbol').append($('<option>').text(value.COMPANY_SYMBOL).attr('value', value.COMPANY_SYMBOL));

            });
            $('[id*=ddlCompanysymbol]').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                maxHeight: 450,
                buttonWidth: '100%'
            });
            $('.ui-multiselect').css('width', '100px');
            //$('#ddlCompanysymbol').multiselect({
            //    placeholder: 'Select options'

            //});

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}


function GetUserControlDropdown() {
    $.ajax({
        url: "api/XBRL/GetUserControl",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            $('#ddlControl').empty();


            //$('#ddlCompanysymbol').append($('<option>').text("Select Company Symbol"));

            $.each(data, function (i, value) {

                $('#ddlControl').append($('<option>').text(value.CONTROL).attr('value', value.CONTROLID));

            });
            $('[id*=ddlControl]').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                maxHeight: 450,
                buttonWidth: '100%'
            });


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function GetProjectDropdown() {
    $.ajax({
        url: "api/XBRL/GetProject",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {


            $('#ddlProject').empty();


            $('#ddlProject').append($('<option value="0">').text("Select Project"));

            $.each(data, function (i, value) {

                $('#ddlProject').append($('<option>').text(value.USRPROJECT).attr('value', value.USRPROJECT));

            });


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function InsertUSerTickerMAp() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {


        $('#ddlCompanysymbol :selected').each(function () {
            var symbol = $(this).text()
            var ajax_data = {
                user: $('#ddlUser option:selected').val(),
                project: $('#ddlProject option:selected').val(),
                symbol: symbol

            };

            $.ajax({
                url: "api/XBRL/GetInsertUSertickerMap",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    GetUserTrickerMap();
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        });


        alert('Add Successfully !');
        $('#ddlUser').val(0),
            $('#ddlProject').val(0);
        //$("#ddlCompanysymbol").multiselect("refresh");



    }




}

function GetUserTrickerMap() {
    $.ajax({
        url: "api/XBRL/GetUserTickerMap",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadUserTrickerMAp(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function LoadUserTrickerMAp(data) {


    if ($.fn.dataTable.isDataTable('#tblUserTrickerMAp')) {
        accounttablevar = $('#tblUserTrickerMAp').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblUserTrickerMAp').DataTable({
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



            { "data": "USERID" },
            { "data": "COMPANY_SYMBOL" },
            { "data": "PROJECT" },

            //{
            //    "date": "USERID",


            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditUserTriker(\'' + full["USERID"] + '\',\'' + full["COMPANY_SYMBOL"] + '\',\'' + full["PROJECT"] + '\')"></input>';

            //    }
            //},
            {
                "date": "USERID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteUserTrickerMAp(\'' + full["USERID"] + '\',\'' + full["COMPANY_SYMBOL"] + '\')"></input>';

                }
            },

        ],

    });




}



function onDeleteUserTrickerMAp(USERID, COMPANY_SYMBOL) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            USERID: USERID,
            COMPANY_SYMBOL: COMPANY_SYMBOL
        };
        $.ajax({
            url: "api/XBRL/GetDeleteUSertickerMap",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetUserTrickerMap(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
function onEditUserTriker(USERID, COMPANY_SYMBOL, PROJECT) {

}


function InsertUserControl() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {

        var ajax_data = {
            controlname: $('#txtUserControl').val()
        };

        $.ajax({
            url: "api/XBRL/GetInsertUserControl",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserControl();
                alert('Add Successfully !')
                $('#txtUserControl').val('');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            controlidx: controlidx,
            controlname: $('#txtUserControl').val()
        };

        $.ajax({
            url: "api/XBRL/GetUpdateUSerControl",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserControl();
                alert('Update Successfully !');
                $('#txtUserControl').val('');
                $('#btnAdd').val('ADD');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}

function GetUserControl() {
    $.ajax({
        url: "api/XBRL/GetUserControl",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadUserControl(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function LoadUserControl(data) {


    if ($.fn.dataTable.isDataTable('#tblUserControl')) {
        accounttablevar = $('#tblUserControl').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblUserControl').DataTable({
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
        //columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "CONTROLID" },
            { "data": "CONTROL" },


            {
                "date": "CONTROLID",


                "mRender": function (data, type, full, meta) {

                    return '<input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditUserControl(\'' + full["CONTROLID"] + '\',\'' + full["CONTROL"] + '\')"></input>';

                }
            },
            {
                "date": "CONTROLID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteUserControl(\'' + full["CONTROLID"] + '\')"></input>';

                }
            },

        ],

    });




}

var controlidx;
function onEditUserControl(CONTROLID, CONTROL) {
    controlidx = CONTROLID;

    $('#txtUserControl').val(CONTROL);


    $('#btnAdd').val('UPDATE');
}

function onDeleteUserControl(CONTROLID) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            CONTROLID: CONTROLID
        };

        $.ajax({
            url: "api/XBRL/GetDeleteUSerControl",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserControl();
                alert('Delete Successfully !')


            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });

    }
}

// User Project//

function InsertUserProject() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {

        var ajax_data = {
            project: $('#txtUserProject').val()
        };

        $.ajax({
            url: "api/XBRL/GetInsertUSerProject",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserProject();
                alert('Add Successfully !')
                $('#txtUserProject').val('');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            Projectidx: Projectidx,
            Projectname: $('#txtUserProject').val()
        };

        $.ajax({
            url: "api/XBRL/GetUpdateUSerProject",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserProject();
                alert('Update Successfully !');
                $('#txtUserProject').val('');
                $('#btnAdd').val('ADD');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}

function GetUserProject() {
    $.ajax({
        url: "api/XBRL/GetUserProject",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadUserProject(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function LoadUserProject(data) {


    if ($.fn.dataTable.isDataTable('#tblUserProject')) {
        accounttablevar = $('#tblUserProject').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblUserProject').DataTable({
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
        //columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "PRJID" },
            { "data": "USRPROJECT" },


            {
                "date": "PRJID",


                "mRender": function (data, type, full, meta) {

                    return '<input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditUserProject(\'' + full["PRJID"] + '\',\'' + full["USRPROJECT"] + '\')"></input>';

                }
            },
            {
                "date": "PRJID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteUserProject(\'' + full["PRJID"] + '\')"></input>';

                }
            },

        ],

    });




}

var Projectidx;
function onEditUserProject(PRJID, USRPROJECT) {
    Projectidx = PRJID;

    $('#txtUserProject').val(USRPROJECT);


    $('#btnAdd').val('UPDATE');
}

function onDeleteUserProject(PRJID) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            PRJID: PRJID
        };

        $.ajax({
            url: "api/XBRL/GetDeleteUSerProject",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetUserProject();
                alert('Delete Successfully !')


            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}


// USer Control MAp///


function InsertUSerControlMAp() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {


        $('#ddlControl :selected').each(function () {
            var controlname = $(this).text()
            var ajax_data = {
                user: $('#ddlUser option:selected').val(),
                project: $('#ddlProject option:selected').val(),
                controlname: controlname

            };

            $.ajax({
                url: "api/XBRL/GetInsertUSerControlMap",
                type: 'GET',
                dataType: 'json',
                data: ajax_data,
                success: function (data) {
                    GetUserControlMap();
                },
                error: function (request) {
                    //notifyError('Saving User Detail failed!');

                }
            });

        });


        alert('Add Successfully !');
        $('#ddlUser').val(0),
            $('#ddlProject').val(0);
        //$("#ddlCompanysymbol").multiselect("refresh");



    }




}

function GetUserControlMap() {
    $.ajax({
        url: "api/XBRL/GetUserControlMap",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadControlMAp(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function LoadControlMAp(data) {


    if ($.fn.dataTable.isDataTable('#tblUserControlMAp')) {
        accounttablevar = $('#tblUserControlMAp').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblUserControlMAp').DataTable({
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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "USERID" },
            { "data": "CONTROL" },
            { "data": "PROJECT" },

            //{
            //    "date": "USERID",


            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditUserTriker(\'' + full["USERID"] + '\',\'' + full["COMPANY_SYMBOL"] + '\',\'' + full["PROJECT"] + '\')"></input>';

            //    }
            //},
            {
                "date": "USERID",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteUserControlMAp(\'' + full["USERID"] + '\',\'' + full["CONTROL"] + '\')"></input>';

                }
            },

        ],

    });




}



function onDeleteUserControlMAp(USERID, CONTROL) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            USERID: USERID,
            CONTROL: CONTROL
        };
        $.ajax({
            url: "api/XBRL/GetDeleteUSerControlMap",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetUserControlMap(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
/// Pfolio Product///////

function InsertPfolioProduct() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {


        var ajax_data = {
            product: $('#txtProduct').val(),

        };

        $.ajax({
            url: "api/Products/GetInsertPfolioProduct",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetPfolioProduct();
                alert('Add Successfully !');
                $('#txtProduct').val('');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            product: $('#txtProduct').val(),
            productCode: productCode

        };

        $.ajax({
            url: "api/Products/GetUpdatePfolioProduct",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetPfolioProduct();
                alert('Update Successfully !');
                $('#btnAdd').val('ADD');
                $('#txtProduct').val('');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }

}
function GetPfolioProduct() {
    $.ajax({
        url: "api/Products/GetPfolioProduct",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadPfolioProduct(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function LoadPfolioProduct(data) {


    if ($.fn.dataTable.isDataTable('#tblPfolioProduct')) {
        accounttablevar = $('#tblPfolioProduct').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblPfolioProduct').DataTable({
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


            { "data": "PRODUCT_CODE" },
            { "data": "PRODUCT_DESC" },




            {
                "date": "PRODUCT_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditPfolioProducts(\'' + full["PRODUCT_CODE"] + '\',\'' + full["PRODUCT_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "PRODUCT_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeletePfolioProduct(\'' + full["PRODUCT_CODE"] + '\')"></input>';

                }
            },

        ],

    });




}
function onDeletePfolioProduct(PRODUCT_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            productCode: PRODUCT_CODE,

        };
        $.ajax({
            url: "api/Products/GetDeletePfolioProduct",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetPfolioProduct(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
var productCode;
function onEditPfolioProducts(PRODUCT_CODE, PRODUCT_DESC) {
    productCode = PRODUCT_CODE;
    $('#txtProduct').val(PRODUCT_DESC);
    $('#btnAdd').val('UPDATE');



}

/// Pfolio Asset Nature///////

function InsertAssetNature() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {


        var ajax_data = {
            assetnature: $('#txtAssetNature').val(),

        };

        $.ajax({
            url: "api/Products/GetInsertAssetNature",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetAssetNature();
                alert('Add Successfully !');
                $('#txtAssetNature').val('');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            assetnature: $('#txtAssetNature').val(),
            assestnautreCode: assestnautreCode

        };

        $.ajax({
            url: "api/Products/GetUpdateAssetNature",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetAssetNature();
                alert('Update Successfully !');
                $('#btnAdd').val('ADD');
                $('#txtAssetNature').val('');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }

}
function GetAssetNature() {
    $.ajax({
        url: "api/Products/GetAssetNature",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadAssetNature(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function LoadAssetNature(data) {


    if ($.fn.dataTable.isDataTable('#tblAssetNature')) {
        accounttablevar = $('#tblAssetNature').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblAssetNature').DataTable({
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


            { "data": "ASSET_CODE" },
            { "data": "ASSET_DESC" },




            {
                "date": "ASSET_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditAssetNAture(\'' + full["ASSET_CODE"] + '\',\'' + full["ASSET_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "ASSET_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteAssetNAture(\'' + full["ASSET_CODE"] + '\')"></input>';

                }
            },

        ],

    });




}
function onDeleteAssetNAture(ASSET_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            assetnatureCode: ASSET_CODE,

        };
        $.ajax({
            url: "api/Products/GetDeleteAssetNature",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetAssetNature(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
var assestnautreCode;
function onEditAssetNAture(ASSET_CODE, ASSET_DESC) {
    assestnautreCode = ASSET_CODE;
    $('#txtAssetNature').val(ASSET_DESC);
    $('#btnAdd').val('UPDATE');



}


/// Pfolio Product Class Weight///////


function GetPfolioProductDropDown() {
    $.ajax({
        url: "api/Products/GetPfolioProduct",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlPfolioProduct').empty();
            $('#ddlPfolioProduct').append($('<option value="0">').text("Select Product"));

            $.each(data, function (i, value) {
                $('#ddlPfolioProduct').append($('<option>').text(value.PRODUCT_DESC).attr('value', value.PRODUCT_CODE));


            });

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function GetPfolioAssetNatureDropDown() {
    $.ajax({
        url: "api/Products/GetAssetNature",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlAsset').empty();
            $('#ddlAsset').append($('<option value="0">').text("Select Asset Nature"));

            $.each(data, function (i, value) {
                $('#ddlAsset').append($('<option>').text(value.ASSET_DESC).attr('value', value.ASSET_CODE));


            });

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function InsertClassWeight() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {


        var ajax_data = {
            prodCode: $('#ddlPfolioProduct option:selected').val(),
            prodScore: $('#txtScore').val(),
            assetCode: $('#ddlAsset option:selected').val(),
            weightPer: $('#txtWeight').val()

        }
        $.ajax({
            url: "api/Products/GetInsertProdClassWeight",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GetClassWeight();
                alert('Add Successfully !');
                $('#ddlPfolioProduct').val(0);
                $('#ddlAsset').val(0);

                $('#txtScore').val('');

                $('#txtWeight').val('');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            prodCode: $('#ddlPfolioProduct option:selected').val(),
            prodScore: $('#txtScore').val(),
            assetCode: $('#ddlAsset option:selected').val(),
            weightPer: $('#txtWeight').val(),
            classWeightCode: classWeightCode
        };

        $.ajax({
            url: "api/Products/GetUpdateProdClassWeight",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                GetClassWeight();
                alert('Update Successfully !');
                $('#ddlPfolioProduct').val(0);
                $('#ddlAsset').val(0);
                $('#txtScore').val('');

                $('#txtWeight').val('');
                $('#btnAdd').val('ADD');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }

}
function GetClassWeight() {
    $.ajax({
        url: "api/Products/GetProdClassWeight",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadClassWeight(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function LoadClassWeight(data) {


    if ($.fn.dataTable.isDataTable('#tblProductClassWeight')) {
        accounttablevar = $('#tblProductClassWeight').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblProductClassWeight').DataTable({
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


            { "data": "PRODUCT_DESC" },
            { "data": "SCORE" },
            { "data": "ASSET_DESC" },
            { "data": "WEIGHT" },




            {
                "date": "PRODUCT_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditClassWeight(\'' + full["IDX"] + '\',\'' + full["PRODUCT_CODE"] + '\',\'' + full["SCORE"] + '\',\'' + full["ASSET_CODE"] + '\',\'' + full["WEIGHT"] + '\')"></input>';

                }
            },
            {
                "date": "PRODUCT_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteClassWeight(\'' + full["IDX"] + '\')"></input>';

                }
            },

        ],

    });




}
function onDeleteClassWeight(IDX) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            IDX: IDX,

        };
        $.ajax({
            url: "api/Products/GetDeleteProdClassWeight",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetClassWeight(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
var classWeightCode;
function onEditClassWeight(IDX, PRODUCT_CODE, SCORE, ASSET_CODE, WEIGHT) {
    classWeightCode = IDX;

    $('#ddlPfolioProduct').val(PRODUCT_CODE);

    $('#txtScore').val(SCORE);

    $('#ddlAsset').val(ASSET_CODE);
    $('#txtWeight').val(WEIGHT);
    $('#btnAdd').val('UPDATE');



}


$("#btnShowConstraintModal").click(function () {
    $('#ConstraintPanel').show();
    GetExpertCriteriaSpecificConstraint();

    //$('#ExpertCriteriaValueConstraint').modal('show');

    //$('#ExpertCriteriaValue').modal('hide');

});




//Specific Expert Master//
function InsertSpecificExpert() {

    var active;


    if (document.getElementById("chkSGEActive").checked) {
        active = "Yes";
    }
    else {
        active = "No";
    }

    if ($('#btnAdd').val() == "ADD") {
        var ajax_data = {
            SpecificExpert: $('#txtSpecificExpert').val(),
            Active: active

        };
        $.ajax({
            url: "api/Products/GetInsertSpecifictMaster",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                alert('Save Successfully');
                GetSpecificExpert();
                document.getElementById("txtSpecificExpert").value = '';
                $("#chkSGEActive").prop("checked", false);



            },


            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {
        var ajax_data = {
            SpecificExpert: $('#txtSpecificExpert').val(),
            Active: active,
            emscode: emscode

        };
        $.ajax({
            url: "api/Products/GetUpdateSpecifictMaste",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {


                alert('Update Successfully');
                GetSpecificExpert();
                document.getElementById("txtSpecificExpert").value = '';
                $("#chkSGEActive").prop("checked", false);

                $('#btnAdd').val('ADD');

            },


            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }



}
function GetSpecificExpert() {



    $.ajax({
        url: "api/Products/GetSpecifictMaste",
        type: 'GET',
        dataType: 'json',
        data: '',
        success: function (data) {

            LoadSpecificExpert(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadSpecificExpert(data) {


    if ($.fn.dataTable.isDataTable('#tblSpecificExpert')) {
        accounttablevar = $('#tblSpecificExpert').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSpecificExpert').DataTable({
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



            { "data": "EMS_CODE" },
            { "data": "DESCRIPTION" },
            { "data": "ACTIVE" },

            {
                "date": "EMS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnSXEdit(\'' + full["EMS_CODE"] + '\',\'' + full["DESCRIPTION"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

                }
            },
            {
                "date": "EMS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnSXDelete(' + full["EMS_CODE"] + ')"></input>';

                }
            },

        ],

    });




}
var emscode;
function OnSXEdit(EMS_CODE, DESCRIPTION, ACTIVE) {
    emscode = EMS_CODE;

    document.getElementById("txtSpecificExpert").value = DESCRIPTION;
    if (ACTIVE == 'Yes') {
        $("#chkSGEActive").prop("checked", true);
    }
    else {
        $("#chkSGEActive").prop("checked", false);
    }

    $('#btnAdd').val('UPDATE');
}
function OnSXDelete(EMS_CODE) {
    if (confirm("Are you sure you want to Delete?")) {



        var ajax_data = {
            emscode: EMS_CODE

        };
        $.ajax({
            url: "api/Products/GetDeleteSpecifictMaste",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                alert('Delete Successfully !');
                GetSpecificExpert();


            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    }
    else {

    }
}


// Specific Expert Detail//
function GetSpecificExpertDropDown() {
    $.ajax({
        url: "api/Products/GETGeneralExpert",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {

            $('#ddlSpecifcExpertMaster').empty();

            //$('#ddlSpecifcExpertMaster').append($('<option>').text("Select Specific Expert Master"));

            $.each(data, function (i, value) {
                $('#ddlSpecifcExpertMaster').append($('<option>').text(value.DESCRIPTION).attr('value', value.EMG_CODE));

            });
            $('[id*=ddlSpecifcExpertMaster]').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
                maxHeight: 300,
                buttonWidth: '100%'
            });
            $('.ui-multiselect').css('width', '100px');

        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}
function GetSpecificClientDropdown() {



    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GETClient",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            $('#ddlSpecificClient').empty();
            $('#ddlSpecificClient').append($('<option>').text("Select Client"));

            $.each(data, function (i, value) {
                $('#ddlSpecificClient').append($('<option>').text(value.DESCRIPTION).attr('value', value.CLIENT_CODE));

            });

            $('#ddlSpecificClient').chosen();

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function InsertSpecificExpertDetail() {
    var client = $('#ddlSpecificClient').val();
    $('#ddlSpecifcExpertMaster :selected').each(function () {
        var expertmaster = $(this).val();

        var ajax_data = {
            expertmaster: expertmaster,
            client: client

        };
        $.ajax({
            url: "api/Products/GETInsertSpecifictExpertDetail",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            async: false,
            success: function (data) {







            },


            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });

    });
    alert('Save Successfully');

    $('#ddlSpecificClient').val(null).trigger("chosen:updated");
    GetSpecificExpertDetail();
}

function GetSpecificExpertDetail() {



    var ajax_data = {


    };
    $.ajax({
        url: "api/Products/GetSpecifictExpertDetail",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadSpecificExpertDetail(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadSpecificExpertDetail(data) {


    if ($.fn.dataTable.isDataTable('#tblSpecificExpertMastDetail')) {
        accounttablevar = $('#tblSpecificExpertMastDetail').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSpecificExpertMastDetail').DataTable({
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

            //{ "data": "EMG_CODE" },
            { "data": "EDS_CODE" },

            { "data": "CLIENTNAME" },

            { "data": "GENERALEXPERTMASTER" },

            { "data": "DATETIME" },
            //{
            //    "date": "EDS_CODE",

            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="OnSpecifcExperDetailtEdit(\'' + full["EDS_CODE"] + '\',\'' + full["P_CODE"] + '\',\'' + full["EMS_CODE"] + '\',\'' + full["CAT_CODE"] + '\',\'' + full["CLIENT_CODE"] + '\',\'' + full["C_CODE"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

            //    }
            //},
            {
                "date": "EDS_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnSpecifcExpertDetailDelete(' + full["EDS_CODE"] + ')"></input>';

                }
            },
            //{
            //    "date": "EDS_CODE",

            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Apply Criteria"   style="height: 31px;font-size: 12px;"   onclick="AddSpecifcCriteriaValue(\'' + full["EDS_CODE"] + '\',\'' + full["CLIENTNAME"] + '\',\'' + full["GENERALEXPERTMASTER"] + '\',\'' + full["DATETIME"] + '\')"></input>';

            //    }
            //},
        ],

    });




}


function OnSpecifcExpertDetailDelete(EDS_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            edsCode: EDS_CODE,

        };
        $.ajax({
            url: "api/Products/GetDeleteSpecificExpertDetail",
            data: ajax_data,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                GetSpecificExpertDetail(data);

                alert('Delete Successfully');
            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}
var edsCode;
function OnSpecifcExperDetailtEdit(EDS_CODE, P_CODE, EMS_CODE, CAT_CODE, CLIENT_CODE, C_CODE, ACTIVE) {
    edsCode = EDS_CODE;
    debugger
    $('#ddlSpecificClient').val(CLIENT_CODE).trigger("chosen:updated");

    $('#ddlSpecifcExpertMaster').val(EMS_CODE).trigger("chosen:updated");
    $('#ddlProduct').val(P_CODE).trigger("chosen:updated");
    $('#ddlCompany').val(C_CODE).trigger("chosen:updated");
    $('#ddlCategory').val(CAT_CODE).trigger("chosen:updated");
    if (ACTIVE == 'Yes') {
        $("#chkActive").prop("checked", true);
    }
    else {
        $("#chkUpdtGXActive").prop("checked", false);
    }

    $('#btnAdd').val('UPDATE');


}
var EDSCode;
function AddSpecifcCriteriaValue(EDS_CODE, CLIENTNAME, GENERALEXPERTMASTER, DATETIME) {
    EDSCode = EDS_CODE;
    document.getElementById('lblSpecificExpertmaster').innerText = GENERALEXPERTMASTER;
    document.getElementById('lblClient').innerText = CLIENTNAME;
    document.getElementById('lblDate').innerText = DATETIME;



    //$('#SpecificConditionTblDiv').hide();
    $('#btnShowConstraintModal').hide();
    $('#ConstraintPanel').hide();

    $('#SpecificExpertCriteriaValue').modal('show');
    GetExpertCriteriaSpecific();
}

function InsertSpecificExpertCriteria() {

    var Criteria = $('#SpecificbtnCriteria').val();
    var condition = $('#ddlCondition option:selected').val();
    var val1 = $('#ddlValueOne option:selected').val();
    var val2 = $('#ddlValueTwo option:selected').val();

    if (val1 == 'Select Value 1') {
        val1 = '';
    }
    else {
        val1 = val1;
    }

    if (val2 == 'Select Value 2') {
        val2 = '';
    }
    else {
        val2 = val2;
    }
    var active;

    if (document.getElementById("chkCritActive").checked) {
        active = "Yes";
    }
    else {
        active = 'No';
    }

    var ajax_data = {
        EDSCode: EDSCode,
        Criteria: Criteria,
        condition: condition,
        val1: val1,
        val2: val2,
        active: active,
        parametertype: 'Parameter'
    };


    $.ajax({
        url: "api/Products/GetInsertSpecificCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            $('#btnCriteria').text('Select Criteria');
            document.getElementById("ddlCondition").selectedIndex = "0";
            document.getElementById("ddlValueOne").selectedIndex = "0";
            document.getElementById("ddlValueTwo").selectedIndex = "0";
            document.getElementById("ddlExpertMaster").selectedIndex = "0";
            $("#chkCritActive").prop("checked", false);
            GetExpertCriteriaGeneral();



        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });




}


// Standard Type///////

function InsertStandardType() {

    var btntext = $('#btnAdd').val();
    if (btntext == "ADD") {

        var ajax_data = {
            StandardType: $('#txtStandardType').val()
        };

        $.ajax({
            url: "api/XBRL/GetInsertStandardType",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GeStandardTypeList();
                alert('Add Successfully !')
                $('#txtStandardType').val('');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
    else {
        var ajax_data = {
            standardtypeCode: standardtypeCode,
            controlname: $('#txtStandardType').val()
        };

        $.ajax({
            url: "api/XBRL/GetUpdateStandardType",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GeStandardTypeList();
                alert('Update Successfully !');
                $('#txtStandardType').val('');
                $('#btnAdd').val('ADD');

            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });
    }
}

function GeStandardTypeList() {
    $.ajax({
        url: "api/XBRL/GetStandardTypeList",
        data: {},
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            LoadStandardTypeList(data);


        },
        error: function (request) {
            //notifyError('Saving User Detail failed!');

        }
    });

}

function LoadStandardTypeList(data) {


    if ($.fn.dataTable.isDataTable('#tblStandardTypeList')) {
        accounttablevar = $('#tblStandardTypeList').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblStandardTypeList').DataTable({
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
        //columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "STANDARD_TYPE_CODE" },
            { "data": "STANDARD_TYPE_DESC" },


            {
                "date": "STANDARD_TYPE_CODE",


                "mRender": function (data, type, full, meta) {

                    return '<input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditStandardTypeList(\'' + full["STANDARD_TYPE_CODE"] + '\',\'' + full["STANDARD_TYPE_DESC"] + '\')"></input>';

                }
            },
            {
                "date": "STANDARD_TYPE_CODE",


                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="onDeleteStandardTypeList(\'' + full["STANDARD_TYPE_CODE"] + '\')"></input>';

                }
            },

        ],

    });




}

var standardtypeCode;
function onEditStandardTypeList(STANDARD_TYPE_CODE, STANDARD_TYPE_DESC) {
    standardtypeCode = STANDARD_TYPE_CODE;

    $('#txtStandardType').val(STANDARD_TYPE_DESC);


    $('#btnAdd').val('UPDATE');
}

function onDeleteStandardTypeList(STANDARD_TYPE_CODE) {
    if (confirm("Are you sure you want to Delete?")) {
        var ajax_data = {
            standardTypeCode: STANDARD_TYPE_CODE
        };

        $.ajax({
            url: "api/XBRL/GetDeleteStandardType",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                GeStandardTypeList();
                alert('Delete Successfully !')


            },
            error: function (request) {
                //notifyError('Saving User Detail failed!');

            }
        });

    }
}


// Expert Criteria Specific///

function InsertExpertCriteriaSpecific() {

    var expertmaster = $('#ddlExpertMasterSpecific').val();
    var Criteria = $('#SpecificbtnCriteria').val();
    var condition = $('#ddlCondition option:selected').val();
    //var CONDITION = $('#ddlCondition option:selected').text();
    var val1 = $('#ddlValueOne option:selected').val();
    //var VALUE1 = $('#ddlValueOne option:selected').text();
    var val2 = $('#ddlValueTwo option:selected').val();
    //var VALUE2 = $('#ddlValueTwo option:selected').text();

    //if (val1 == 'Select Value 1' || VALUE1 == 'Select Value 1') {
    if (val1 == 'Select Value 1') {
        val1 = '';
        //VALUE1 = '';
    }
    else {
        val1 = val1;
        //VALUE1: VALUE1;
    }

    if (val2 == 'Select Value 2') {
        val2 = '';
        //VALUE2 = '';
    }
    else {
        val2 = val2;
        //VALUE2: VALUE2;
    }
    var active;

    if (document.getElementById("chkCritActive").checked) {
        active = "Yes";
    }
    else {
        active = 'No';
    }

    //var SpecificCriteria = "<tr><td>" + CRITERIA + "</td><td>" + CONDITION + "</td><td>" + VALUE1 + "</td><td>" + VALUE2 + "</td><td>" + active + "</td><td><input type='button' class='btn btn-success' value='Delete'   style='height: 31px; font - size: 12px;'   onclick='OnSpecificExpertCriteriaDelete(this)'></input>'</td>";

    //$("#tblExpertCriteriaSpecific tbody").append(SpecificCriteria);
    //$('#btnCriteria').text('Select Criteria');
    //document.getElementById("ddlCondition").selectedIndex = "0";
    //document.getElementById("ddlValueOne").selectedIndex = "0";
    //document.getElementById("ddlValueTwo").selectedIndex = "0";
    ////document.getElementById("ddlExpertMaster").selectedIndex = "0";
    //$("#chkCritActive").prop("checked", false);

    var ajax_data = {
        EDSCode: expertmaster,
        Criteria: Criteria,
        condition: condition,
        val1: val1,
        val2: val2,
        active: active,
        parametertype: 'Parameter'
    };


    $.ajax({
        url: "api/Products/GETInsertExpertCriteriaSpecific",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            $('#btnCriteria').text('Select Criteria');
            document.getElementById("ddlExpertMasterSpecific").selectedIndex = "0";
            document.getElementById("ddlCondition").selectedIndex = "0";
            document.getElementById("ddlValueOne").selectedIndex = "0";
            document.getElementById("ddlValueTwo").selectedIndex = "0";
            //document.getElementById("ddlExpertMaster").selectedIndex = "0";
            $("#chkCritActive").prop("checked", false);
            GetExpertCriteriaSpecific();
            //GetExpertCriteriaGeneralConstaint();


        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });




}



function GetExpertCriteriaSpecific() {
    var Conditiontable = $("#tblSpecificExpertMastDetail tbody");

    var whereConditionArray = [];
    Conditiontable.find('tr').each(function (i) {
        var rowdata = $('#tblSpecificExpertMastDetail').dataTable().fnGetData(i);
        var GneralExpert = rowdata.EMG_CODE;

        whereConditionArray.push(GneralExpert);
    });
    var WhereConditionMultiColumn = whereConditionArray.join(' , ');

    var ajax_data = {

        WhereConditionMultiColumn: 'EMG_CODE in ( ' + WhereConditionMultiColumn + ')',
        paraType:'Parameter'
          
    };
    $.ajax({
        url: "api/Products/GetSeacrhAllGeneralExpert",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadtblExpertCriteriaSpec(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}

function LoadtblExpertCriteriaSpec(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertCriteriaSpecific')) {
        accounttablevar = $('#tblExpertCriteriaSpecific').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertCriteriaSpecific').DataTable({
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
        "pageLength": 5,
        "sPaginationType": "simple",
        data: data,

        dom: 'Bfrtip',
        select: true,
        //"columnDefs": [
        //    {
        //        "targets": [0],
        //        "visible": false,
        //        "searchable": true
        //    },
        //],
        "columns": [



            //   { "data": "ECG_CODE" },
            //{ "data": "EMG_CODE" },
            //{ "data": "CRITERIA_CODE" },
            { "data": "CRITERIA" },
            { "data": "CONDITION" },
            { "data": "VALUE1" },
            { "data": "VALUE2" },
            { "data": "ACTIVE" },

            {
                "date": "ECG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnSpecificExpertCriteriaDelete(\'' + full["ECG_CODE"] + '\')"></input>';

                }
            },
            //{
            //    "date": "ECG_CODE",


            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditGeneralExpertCriteria(\'' + full["ECG_CODE"] + '\',\'' + full["CRITERIA"] + '\',\'' + full["CRITERIA_CODE"] + '\',\'' + full["CONDITION"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

            //    }
            //},

        ],

    });




}


function OnSpecificExpertCriteriaDelete(ECG_CODE) {
    if (confirm("Are you sure you want to Delete?")) {

    //$(e).closest('tr').remove();
    //$(e).closest('tr').draw();

    var ajax_data = {
        SpecificExpertCriteriaCode: ECG_CODE,
        parameterType: 'Parameter'

    };
    $.ajax({
        url: "api/Products/GETDeleteSpecificExptCriteria",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {
            alert('Delete Successfully !');

            GetExpertCriteriaSpecific();

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });
    }
    else {

    }
}

var ParameterFilterData = [];

function SearchSpecificConditionWiseCriteria() {

    var whereConditionArray = [];
    var testarray = [];
    var Conditiontable = $("#tblExpertCriteriaSpecific tbody");




    Conditiontable.find('tr').each(function (i) {
        var rowdata = $('#tblExpertCriteriaSpecific').dataTable().fnGetData(i);
        //var CriteriaCode = rowdata.CRITERIA_CODE;
        var Criteria = rowdata.CRITERIA;
        var condition = rowdata.CONDITION;
        var val1 = rowdata.VALUE1;
        var val2 = rowdata.VALUE2;
        var condColumn = rowdata.SECTOR_DESC;
        if (condColumn != null) {

            if (condition == "<>") {
                whereCondition = condColumn + " " + "<" + " " + val1 + " " + "and" + " " + condColumn + " " + ">" + " " + val2;
            }
            else if (condition == "Not Between") {
                whereCondition = condColumn + " " + "Not Between" + " " + val1 + " " + "and" + " " + val2;
            }
            else if (condition == "Not Equal to") {
                whereCondition = condColumn + "  not in  " + "'" + val1 + "'";
            }

            else {
                whereCondition = condColumn + condition + "'" + val1 + "'";
            }


            whereConditionArray.push(whereCondition);


        }

    });


    var WhereConditionMultiColumn = whereConditionArray.join(' or ');

    if (WhereConditionMultiColumn != "") {

        var ajax_data = {
            whereCondition: WhereConditionMultiColumn


        };
        $.ajax({
            url: "api/Products/GetSeacrhConditionData",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {

                //ParameterFilterData.push(data);
                DeleteConstraintPreviousData();
                InsertParameterSearchData(data);
                LoadSpecificSearchResult(data);

                $('#tblSpecificSearchCondtion').show();
                $('#btnShowConstraintModal').show();

            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });



    }
    else {
        alert('Filter Column Not Map with Criteria')
    }






}


function DeleteConstraintPreviousData() {



    $.ajax({
        url: "api/XBRL/DelteConstraintDataPrevious",
        type: 'POST',
        dataType: 'json',
        data: '',
        async: false,
        success: function (data) {

        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }

    });

}
function LoadSpecificSearchResult(data) {


    if ($.fn.dataTable.isDataTable('#tblSpecificSearchCondtion')) {
        accounttablevar = $('#tblSpecificSearchCondtion').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSpecificSearchCondtion').DataTable({
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
        "pageLength": 5,
        data: data,
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "COMPANY_NAME" },
            { "data": "COMPANY_SYMBOL" },
            { "data": "PRICE" },
            { "data": "CHANGEVAL" },

            { "data": "RELVOLUME" },
            { "data": "MC" },
            { "data": "INDUSTRY_DESC" },
            { "data": "SECTOR_DESC" },


        ],

    });




}

function InsertParameterSearchData(data) {

    var utility = new Object();
    utility.bulkData = JSON.stringify(data);


    $.ajax({
        url: '/api/XBRL/InsertParamterData',
        type: 'POST',
        dataType: 'json',
        data: utility,
        success: function (data) {

        },
        error: function (request) {

        }
    });



    //var utility = new Object();
    //utility.bulkData = JSON.stringify(data);




    //$.ajax({
    //    type: "POST",
    //    url: "api/XBRL/InsertParamterData",
    //    data: utility,
    //    contentType: "application/json",
    //    dataType: "json",
    //    success: function (msg) {
    //        //alert(msg.d);
    //    }
    //});

    //$.ajax({
    //   contentType: "application/json",
    //    dataType: 'json',
    //    type: 'POST',
    //    url: "api/XBRL/InsertParamterData",


    //    data: ajax_data ,     
    //    //data: JSON.stringify(obj),
    //    //data: JSON.stringify(obj),


    //    success: function () {

    //    },
    //    error: function (request) {
    //        //notifyError('Data Load failed!');

    //    }

    //});
}
/// Specific Constraint /////
function InsertExpertCriteriaSpecificConstraint() {
    var expertmaster = $('#ddlExpertMasterSpecificConstraint').val();
    var Criteria = $('#SpecificbtnCriteriaConstraint').val();
    var condition = $('#ddlConditionConstraint option:selected').val();
    var val1 = $('#ddlValueOneConstraint option:selected').val();
    var val2 = $('#ddlValueTwoConstraint option:selected').val();

    if (val1 == 'Select Value 1') {
        val1 = '';
    }
    else {
        val1 = val1;
    }

    if (val2 == 'Select Value 2') {
        val2 = '';
    }
    else {
        val2 = val2;
    }
    var active;

    if (document.getElementById("chkCritActiveConstraint").checked) {
        active = "Yes";
    }
    else {
        active = 'No';
    }

    var ajax_data = {
        EDSCode: expertmaster,
        Criteria: Criteria,
        condition: condition,
        val1: val1,
        val2: val2,
        active: active,
        parametertype: 'Constraint'
    };


    $.ajax({
        url: "api/Products/GETInsertExpertCriteriaSpecificConstraint",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {


            alert('Save Successfully');
            $('#SpecificbtnCriteriaConstraint').text('Select Criteria');
            document.getElementById("ddlConditionConstraint").selectedIndex = "0";
            document.getElementById("ddlValueOneConstraint").selectedIndex = "0";
            document.getElementById("ddlValueTwoConstraint").selectedIndex = "0";
            //document.getElementById("ddlExpertMaster").selectedIndex = "0";
            $("#chkCritActiveConstraint").prop("checked", false);
            GetExpertCriteriaSpecificConstraint();
            //GetExpertCriteriaGeneralConstaint();


        },


        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });




}
function GetExpertCriteriaSpecificConstraint() {



    var ajax_data = {

        EDSCode: EDSCode,
        parametertype: 'Constraint'
    };
    $.ajax({
        url: "api/Products/GETGenCriteriaSpecific",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadtblExpertCriteriaSpecConstraint(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}
function LoadtblExpertCriteriaSpecConstraint(data) {


    if ($.fn.dataTable.isDataTable('#tblExpertCriteriaGeneralConstraint')) {
        accounttablevar = $('#tblExpertCriteriaGeneralConstraint').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblExpertCriteriaGeneralConstraint').DataTable({
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
        "pageLength": 5,
        "sPaginationType": "simple",
        data: data,

        dom: 'Bfrtip',
        select: true,
        "columnDefs": [
            {
                "targets": [0],
                "visible": false,
                "searchable": true
            },
        ],
        "columns": [



            //   { "data": "ECG_CODE" },
            //{ "data": "EMG_CODE" },
            { "data": "CRITERIA_CODE" },
            { "data": "CRITERIA" },
            { "data": "CONDITION" },
            { "data": "VALUE1" },
            { "data": "VALUE2" },
            { "data": "ACTIVE" },

            {
                "date": "ECG_CODE",

                "mRender": function (data, type, full, meta) {

                    return ' <input type="button" class="btn btn-success" value="Delete"   style="height: 31px;font-size: 12px;"   onclick="OnSpecificConstraintDelete(' + full["ECG_CODE"] + ')"></input>';

                }
            },
            //{
            //    "date": "ECG_CODE",


            //    "mRender": function (data, type, full, meta) {

            //        return ' <input type="button" class="btn btn-success" value="Edit"   style="height: 31px;font-size: 12px;"   onclick="onEditGeneralExpertCriteria(\'' + full["ECG_CODE"] + '\',\'' + full["CRITERIA"] + '\',\'' + full["CRITERIA_CODE"] + '\',\'' + full["CONDITION"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["VALUE_CODE"] + '\',\'' + full["ACTIVE"] + '\')"></input>';

            //    }
            //},

        ],

    });




}

function OnSpecificConstraintDelete(ECG_CODE) {
    if (confirm("Are you sure you want to Delete?")) {


        var ajax_data = {
            SpecificExpertCriteriaCode: ECG_CODE,
            parameterType: 'Constraint'
        };
        $.ajax({
            url: "api/Products/GETDeleteSpecificExptCriteria",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                alert('Delete Successfully !');

                GetExpertCriteriaSpecificConstraint();


            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });
    }
    else {

    }
}



$("#btnSearchConditionConstraint").click(function () {
    var Conditiontable = $("#tblExpertCriteriaGeneralConstraint tbody");
    var whereConditionArray = [];


    Conditiontable.find('tr').each(function (i) {
        var rowdata = $('#tblExpertCriteriaGeneralConstraint').dataTable().fnGetData(i);
        var CriteriaCode = rowdata.CRITERIA_CODE;
        var Criteria = rowdata.CRITERIA;
        var condition = rowdata.CONDITION;
        var val1 = rowdata.VALUE1;
        var val2 = rowdata.VALUE2;
        var condColumn = rowdata.SECTOR_DESC;
        if (condColumn != null) {

            if (condition == "<>") {
                whereCondition = condColumn + " " + "<" + " " + val1 + " " + "or" + " " + condColumn + " " + ">" + " " + val2;
            }
            else if (condition == "Not Between") {
                whereCondition = condColumn + " " + "Not Between" + " " + val1 + " " + "or" + " " + val2;
            }
            else if (condition == "Not Equal to") {
                whereCondition = condColumn + "  not in  " + "'" + val1 + "'";
            }
            else if (condition == "=") {
                whereCondition = condColumn + condition + "'" + val1 + "'";

            }
            whereConditionArray.push(whereCondition);

            console.log(whereCondition);


        }

    });

    var WhereConditionMultiColumn = whereConditionArray.join(', ').replace(/,(?!.*,)/gmi, ' or');


    if (WhereConditionMultiColumn != "") {

        var ajax_data = {
            whereCondition: WhereConditionMultiColumn


        };
        $.ajax({
            url: "api/Products/GetSeacrhConstraintData",
            type: 'GET',
            dataType: 'json',
            data: ajax_data,
            success: function (data) {
                $('#ConstraintConditionTblDiv').show();
                LoadSpecificConstraintSearchResult(data);

                ApplyCoverianceMatrix(data);
            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }
        });



    }
    else {
        alert('Filter Column Not Map with Criteria')
    }


});


function LoadSpecificConstraintSearchResult(data) {


    if ($.fn.dataTable.isDataTable('#tblSearchConstraintCondtion')) {
        accounttablevar = $('#tblSearchConstraintCondtion').DataTable().clear().destroy();
    }
    var accounttablevar = $('#tblSearchConstraintCondtion').DataTable({
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
        "pageLength": 5,
        data: data,
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [



            { "data": "COMPANY_NAME" },
            { "data": "COMPANY_SYMBOL" },
            { "data": "PRICE" },
            { "data": "CHANGEVAL" },

            { "data": "RELVOLUME" },
            { "data": "MC" },
            { "data": "INDUSTRY_DESC" },
            { "data": "SECTOR_DESC" },


        ],

    });




}


function ApplyCoverianceMatrix(data) {
    if (data.length > 0) {
        var rowArray = [];
        for (var index = 0; index < data.length; index++) {

            var tricker = data[index].COMPANY_SYMBOL;

            for (var i = 0; i < data.length; i++) {
                if (tricker != data[i].COMPANY_SYMBOL) {

                    rowArray.push({ "COMPANY_CIK1": tricker, "COMPANY_CIK2": data[i].COMPANY_SYMBOL, "VALUE": data[i].SECTOR_DESC });
                }
            }
        }

        //var utility = new Object();
        //utility.MatrixBulk = JSON.stringify(rowArray);
        //JSON.stringify(rowArray);

        //var obj = {
        //    ConvMatrix: JSON.stringify(rowArray)
        //};
        var ajax_data = {
            rowArray: JSON.stringify(rowArray)
        };

        $.ajax({
            url: "api/XBRL/InsertCovarianceMatrix",
            type: 'POST',
            //dataType: 'json',
            contentType: "application/json",
            data: ajax_data,


            success: function (data) {
                alert('Insert Successfully covariance matrix');
            },
            error: function (request) {
                //notifyError('Data Load failed!');

            }

        });


    }

}
$('#btnGetGeneralCriteria').on('click', function () {
    $('#tblExpertCriteriaSpecific tbody tr').empty();
    GetExpertCriteriaSpecific();
    $('#tblSpecificSearchCondtion').hide();
    $('#SpecificExpertCriteriaValue').modal('show');

});


function GetExpertCriteriaSpecificConstraint() {
    var Conditiontable = $("#tblSpecificExpertMastDetail tbody");

    var whereConditionArray = [];
    Conditiontable.find('tr').each(function (i) {
        var rowdata = $('#tblSpecificExpertMastDetail').dataTable().fnGetData(i);
        var GneralExpert = rowdata.EMG_CODE;

        whereConditionArray.push(GneralExpert);
    });
    var WhereConditionMultiColumn = whereConditionArray.join(' , ');

    var ajax_data = {

        WhereConditionMultiColumn: 'EMG_CODE in ( ' + WhereConditionMultiColumn + ')',
        paraType: 'Constraint'
    };
    $.ajax({
        url: "api/Products/GetSeacrhAllGeneralExpert",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadtblExpertCriteriaSpecConstraint(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}