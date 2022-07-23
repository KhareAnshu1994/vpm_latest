
app.controller("TDSDepositReport", ["$scope", "TDSDepositReportFactory", "$timeout", "$location", "$window", function ($scope, TDSDepositReportFactory, $timeout, $location, $window) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate, monthyear) {
        debugger;
        $scope.searchButtonText = "Searching";
        TDSDepositReportFactory.getTDSDepositReportOnSearch(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* TDSDepositReport Search Start*/
            $("#table_id").dataTable({
                "footerCallback": function (row, data, start, end, display) {
                    var api = this.api(), data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function (i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                                i : 0;
                    };

                    // Bill Amount Total over all pages
                    billamttotal = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Bill Amount  Total over this page
                    billamtpageTotal = api
                        .column(2, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Bill Amount  Update footer
                    $(api.column(2).footer()).html(
                        '$' + billamtpageTotal + ' ( $' + billamttotal + ' total)'
                    );


                    // IncomeTax Amount Total over all pages
                    IncomeTaxamttotal = api
                        .column(5)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // IncomeTax   Total over this page
                    IncomeTaxamtpageTotal = api
                        .column(5, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // IncomeTax   Update footer
                    $(api.column(5).footer()).html(
                        '$' + IncomeTaxamtpageTotal + ' ( $' + IncomeTaxamttotal + ' total)'
                    );

                    // Surcharge Amount Total over all pages
                    Surchargeamttotal = api
                        .column(6)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Surcharge  Total over this page
                    SurchargeamtpageTotal = api
                        .column(6, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Surcharge   Update footer
                    $(api.column(6).footer()).html(
                        '$' + SurchargeamtpageTotal + ' ( $' + Surchargeamttotal + ' total)'
                    );

                    // CES Amount Total over all pages
                    CESamttotal = api
                        .column(7)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // CES  Total over this page
                    CESamtpageTotal = api
                        .column(7, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // CES   Update footer
                    $(api.column(7).footer()).html(
                        '$' + CESamtpageTotal + ' ( $' + CESamttotal + ' total)'
                    );


                    // Total Amount Total over all pages
                    Totalamttotal = api
                        .column(8)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total  Total over this page
                    TotalamtpageTotal = api
                        .column(8, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total   Update footer
                    $(api.column(8).footer()).html(
                        '$' + TotalamtpageTotal + ' ( $' + Totalamttotal + ' total)'
                    );


                },
                bLengthChange: true,
                lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                dom: 'lBfrtip',
                buttons: [
                    { extend: 'excelHtml5', footer: true, text: 'Export to Excel' }
                ],
                data: success.data,
                columns: [
                    {
                        'data': 'Id',
                        "render": function (data, type, full, meta) {
                            success.data[meta.row].id = meta.row + 1; // adds id to dataset
                            return meta.row + 1; // adds id to serial no
                        }
                    },
                    { 'data': 'PartyName' },
                    { 'data': 'BillAmount' },
                    { 'data': 'GLCODE_INCOMETAX' },
                    { 'data': 'IncomeTaxRate' },
                    { 'data': 'IncomeTax' },
                    { 'data': 'Surcharge' },
                    { 'data': 'CES' },
                    { 'data': 'Total' }
                ]
            });
            /* TDSDepositReport Search End*/
            if (success.data.length < 1) {
            //    alert("No record found !")
            }
        });
    }


TDSDepositReportFactory.init(
    function (success) {
       // debugger;
        /* TDSDepositReport Search Start*/
        //$("#table_id").dataTable({
        //    bLengthChange: true,
        //    lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
        //    bFilter: true,
        //    bSort: true,
        //    bPaginate: true,
        //    bDestroy: true,
        //    data: success[0].data,
        //    columns: [
        //        {
        //            'data': 'Id',
        //            "render": function (data, type, full, meta) {
        //                success[0].data[meta.row].id = meta.row + 1; // adds id to dataset
        //                return meta.row + 1; // adds id to serial no
        //            }
        //        },
        //        { 'data': 'PartyName' },
        //        { 'data': 'BillAmount' },
        //        { 'data': 'IncomeTaxRate' }
                  //{ 'data': 'IncomeTax' },
                  //{ 'data': 'Surcharge' },
                  //{ 'data': 'CES' },
                  //{ 'data': 'Total' }
        //    ]
        //});
        /* TDSDepositReport Search End*/
    });
}]);
app.factory("TDSDepositReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
         //   this.getTDSDepositReportOnSearch(null, null)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getTDSDepositReportOnSearch = function (fromDate, toDate) {
        return $http.post(("/Reports/TDS_Deposited_ReportGrid"), { fromDate: fromDate, toDate: toDate});
    }
    return this;
}]);