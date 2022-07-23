
app.controller("BankLetterReport", ["$scope", "BankLetterReportFactory", "$timeout", "$location", "$window", function ($scope, BankLetterReportFactory, $timeout, $location, $window) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate) {
        debugger;
        $scope.searchButtonText = "Searching";
        BankLetterReportFactory.getBankLetterReportOnSearch(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* Bank Letter Report Start*/
            debugger;
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

                    // Total over all pages
                    total = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(3, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Update footer
                    $(api.column(3).footer()).html(
                        '$' + pageTotal + ' ( $' + total + ' total)'
                    );
                },
                lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                bLengthChange: true,
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
                    { 'data': 'PayableAt' },
                    { 'data': 'NetAmount' }
                ]
            });
            /* Bank Letter Report End*/
            if (success.data.length < 1) {
             //   alert("No record found !")
            }
        });
    }





    BankLetterReportFactory.init(
        function (success) {
          //  debugger;
           /* Bank Letter Report Start*/
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
            //        { 'data': 'NetAmount' },
            //        { 'data': 'PayableAt' }
            //    ]
            //});
            /* Bank Letter Report End*/
        });
}]);
app.factory("BankLetterReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
         //   this.getBankLetterReportOnSearch(null, null)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getBankLetterReportOnSearch = function (fromDate, toDate) {
        debugger;
        return $http.post(("/Reports/Bank_Letter_Repor_Grid"), { fromDate: fromDate, toDate: toDate });
    }
       return this;
}]);