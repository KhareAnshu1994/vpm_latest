
app.controller("ChqIssuedReport", ["$scope", "ChqIssuedReportFactory", "$timeout", "$location", "$window", function ($scope, ChqIssuedReportFactory, $timeout, $location, $window) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate) {
        debugger;
        $scope.searchButtonText = "Searching";
        ChqIssuedReportFactory.getChqIssuedReportOnSearch(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* ChqIssuedReport Search Start*/
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
                        .column(5)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(5, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Update footer
                    $(api.column(5).footer()).html(
                        '$' + pageTotal + ' ( $' + total + ' total)'
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
                    { extend: 'excelHtml5', footer: true, text: 'Export to Excel'}
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
                    { 'data': 'Department' },
                    { 'data': 'PartyName' },
                    { 'data': 'PayableAtNumber' },
                    {
                        'data': 'PayableAtDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                    },
                    { 'data': 'NetAmount' }

                    
                ]
            });
            /* ChqIssuedReport Search End*/
            if (success.data.length < 1) {
             //   alert("No record found !")
            }
        });
    }





    ChqIssuedReportFactory.init(
        function (success) {
         //   debugger;
            /* ChqIssuedReport Search Start*/
            //$("#table_id").dataTable({
            //    bLengthChange: true,
            //    lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
            //    bFilter: true,
            //    bSort: true,
            //    bPaginate: true,
            //    bDestroy: true,
            //    data: success[0].data,
            //    columns: [
            //        { 'data': 'Department' },
            //        {
            //            'data': 'Id',
            //            "render": function (data, type, full, meta) {
            //                success[0].data[meta.row].id = meta.row + 1; // adds id to dataset
            //                return meta.row + 1; // adds id to serial no
            //            }
            //        },
            //        { 'data': 'PartyName' },
            //        { 'data': 'ChequeNumber' },
            //        { 'data': 'NetAmount' },
            //        { 'data': 'InwardDate' }
            //    ]
            //});
            /* ChqIssuedReport Search End*/
        });
}]);
app.factory("ChqIssuedReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
          //  this.getChqIssuedReportOnSearch(null, null)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getChqIssuedReportOnSearch = function (fromDate, toDate) {
        debugger;
        return $http.post(("/Reports/Cheque_Issued_ReportGrid"), { fromDate: fromDate, toDate: toDate });
    }
    return this;
}]);