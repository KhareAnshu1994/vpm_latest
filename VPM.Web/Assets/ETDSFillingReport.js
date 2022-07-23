
app.controller("ETDSFillingReport", ["$scope", "ETDSFillingReportFactory", "$timeout", "$location", "$window", function ($scope, ETDSFillingReportFactory, $timeout, $location, $window) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate, monthyear) {
        debugger;
        $scope.searchButtonText = "Searching";
        ETDSFillingReportFactory.getETDSFillingReportOnSearch(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* ETDSFillingReport Search Start*/
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


                    // Income Tax Amount Total over all pages
                    incometaxamttotal = api
                        .column(6)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Income Tax   Total over this page
                    incometaxamtpageTotal = api
                        .column(6, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Income Tax   Update footer
                    $(api.column(6).footer()).html(
                        '$' + incometaxamtpageTotal + ' ( $' + incometaxamttotal + ' total)'
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
                    { 'data': 'Department' },
                    {
                        'data': 'InwardDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                    },
                    { 'data': 'BillAmount' },
                    { 'data': 'GLCODE_INCOMETAX' },
                    { 'data': 'IncomeTaxRate' },
                    { 'data': 'IncomeTax' },
                    { 'data': 'PartyName' },
                    { 'data': 'PartyAddress' },
                    { 'data': 'PANNO' }
                ]
            });
            /* ETDSFillingReport Search End*/
            if (success.data.length < 1) {
              //  alert("No record found !")
            }
        });
    }


    ETDSFillingReportFactory.init(
        function (success) {
          //  debugger;
            /* ETDSFillingReport Search Start*/
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
            //        { 'data': 'Department' },
            //        { 'data': 'InwardDate' },
            //        { 'data': 'BillAmount' },
            //        { 'data': 'IncomeTaxRate' },
            //        { 'data': 'PartyName' },
            //        { 'data': 'PartyAddress' },
            //        { 'data': 'PANNO' }
                    
            //    ]
            //});
            /* ETDSFillingReport Search End*/
        });
}]);
app.factory("ETDSFillingReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
         //   this.getETDSFillingReportOnSearch(null, null)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getETDSFillingReportOnSearch = function (fromDate, toDate) {
        return $http.post(("/Reports/ETDS_Filling_ReportGrid"), { fromDate: fromDate, toDate: toDate});
    }
    return this;
}]);