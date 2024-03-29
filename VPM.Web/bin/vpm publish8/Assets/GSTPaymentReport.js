﻿
app.controller("GSTPaymentReport", ["$scope", "GSTPaymentReportFactory", "$timeout", "$location", "$window", function ($scope, GSTPaymentReportFactory, $timeout, $location, $window) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate, monthyear) {
        debugger;
        $scope.searchButtonText = "Searching";
        GSTPaymentReportFactory.getGSTPaymentReportOnSearch(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* GSTPaymentReport Search Start*/
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
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Bill Amount  Total over this page
                    billamtpageTotal = api
                        .column(3, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Bill Amount  Update footer
                    $(api.column(3).footer()).html(
                        '$' + billamtpageTotal + ' ( $' + billamttotal + ' total)'
                    );


                    // SGST Amount Total over all pages
                    SGSTamttotal = api
                        .column(6)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // SGST   Total over this page
                    SGSTamtpageTotal = api
                        .column(6, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // SGST   Update footer
                    $(api.column(6).footer()).html(
                        '$' + SGSTamtpageTotal + ' ( $' + SGSTamttotal + ' total)'
                    );

                    // CGST Amount Total over all pages
                    CGSTamttotal = api
                        .column(9)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // CGST  Total over this page
                    CGSTamtpageTotal = api
                        .column(9, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // CGST   Update footer
                    $(api.column(9).footer()).html(
                        '$' + CGSTamtpageTotal + ' ( $' + CGSTamttotal + ' total)'
                    );

                    // IGST Amount Total over all pages
                    IGSTamttotal = api
                        .column(12)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // IGST  Total over this page
                    IGSTamtpageTotal = api
                        .column(12, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // IGST   Update footer
                    $(api.column(12).footer()).html(
                        '$' + IGSTamtpageTotal + ' ( $' + IGSTamttotal + ' total)'
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
                    { 'data': 'GSTRNo' },
                    { 'data': 'PartyName' },
                    { 'data': 'BillAmount' },
                    { 'data': 'GLCODE_SGST' },
                    { 'data': 'SGSTRate' },
                    { 'data': 'SGST' },
                    { 'data': 'GLCODE_CGST' },
                    { 'data': 'CGSTRate' },
                    { 'data': 'CGST' },
                    { 'data': 'GLCODE_IGST' },
                    { 'data': 'IGSTRate' },
                    { 'data': 'IGST' },
                    { 'data': 'HSNCode' }
                ]
            });
            /* GSTPaymentReport Search End*/
            if (success.data.length < 1) {
               // alert("No record found !")
            }
        });
    }


    GSTPaymentReportFactory.init(
        function (success) {
          //  debugger;
            /* GSTPaymentReport Page1 Search Start*/
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
            //        { 'data': 'GSTRNo' },
            //        { 'data': 'PartyName' },
            //        { 'data': 'BillAmount' },
            //        { 'data': 'TDSUnderSGSTRate' },
            //        { 'data': 'SGSTRate' },
            //        { 'data': 'TDSUnderCGSTRate' },
            //        { 'data': 'CGSTRate' },
            //        { 'data': 'TDSUnderIGSTRate' },
            //        { 'data': 'IGSTRate' },
            //        { 'data': 'HSNCode' }
            //    ]
            //});
            /* GSTPaymentReport Page1 Search End*/
        });
}]);
app.factory("GSTPaymentReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
         //   this.getGSTPaymentReportOnSearch(null, null)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getGSTPaymentReportOnSearch = function (fromDate, toDate) {
        return $http.post(("/Reports/GST_Payment_ReportGrid"), { fromDate: fromDate, toDate: toDate });
    }
    return this;
}]);