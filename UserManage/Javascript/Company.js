function GetCompany() {

    var getUrl = window.location;
    var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[0];

    var ajax_data = {


    };
    $.ajax({
        url: baseUrl + "api/",
        type: 'GET',
        dataType: 'json',
        data: ajax_data,
        success: function (data) {

            LoadProduct(data);


        },
        error: function (request) {
            //notifyError('Data Load failed!');

        }
    });

}



function LoadGetCompany(data) {

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
        columnDefs: [{ "width": "10%", "targets": 1 }],
        dom: 'Bfrtip',
        select: true,


        "columns": [


       { "data": "C_CODE" },
        { "data": "DESCRIPTION" },
         { "data": "NTN" },
         { "data": "ACTIVE" },




        ],

    });




}
