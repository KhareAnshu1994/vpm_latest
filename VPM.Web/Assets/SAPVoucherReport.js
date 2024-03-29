﻿
app.controller("SAPVoucherReport", ["$scope", "SAPVoucherReportFactory", "$timeout", "$location", "$window", "$filter", function ($scope, SAPVoucherReportFactory, $timeout, $location, $window, $filter) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.searchButtonText = "Search";
    $scope.is_download_enable = false;
    $scope.convertdateTostring = function (from_date, to_date, payableat) {

        if (from_date === undefined) {
            $scope.is_download_enable = false;
        }
        else {
            $scope.temp_from_date = $filter('date')(from_date, "yyyy-MM-dd");
        }
        if (to_date === undefined) {
            $scope.is_download_enable = false;
        } else {
            $scope.temp_to_date = $filter('date')(to_date, "yyyy-MM-dd");
        }

        if (from_date !== undefined && to_date !== undefined) {
            $scope.is_download_enable = true;
        }

        $scope.selectpaybleat = $scope.lst_PayableAt.filter(function (el) {
            return el.ID == payableat;
        });
        $scope.payableAt_name = $scope.selectpaybleat[0].Name

    }

    $scope.Search = function (fromDate, toDate, PayableAt) {

        $scope.searchButtonText = "Searching";
        SAPVoucherReportFactory.getSAPVoucherReportOnSearch(fromDate, toDate, PayableAt).then(function (success) {
            $scope.searchButtonText = "Search";

            /* SAPVoucherReport Search Start*/
         
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
                    totalbill = api
                        .column(10)
                        .data()
                        .reduce(function (a, b) {

                            return intVal(a) + intVal(b);
                        }, 0);


                    // Total over this page
                    pageTotal = api
                        .column(10, { page: 'current' })
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Update footer
                    $(api.column(10).footer()).html(
                        '$' + pageTotal + ' ( $' + totalbill + ' total)'
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
                    //{
                    //    'data': 'InwardDate',
                    //    'render': function (value) {
                    //        if (value === null) return "";
                    //        return moment(value).format('DD/MM/YYYY');
                    //    }
                    //},
                    { 'data': 'VoucherNo' },
                  //  { 'data': 'Voucher_Date1' },
                    {
                        'data': 'VoucherDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                    },
                    { 'data': 'SchCode' },
                   // { 'data': 'Post_Date1,' },
                    {
                        'data': 'PostDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }

                          
                    },
                    //{ 'data': 'PostDate' },
                    { 'data': 'VoucherType' },
                    { 'data': 'BillNo' },
                    { 'data': 'Department' },
                    { 'data': 'PK' },
                    { 'data': 'SapCode' },
                    { 'data': 'CONTRASCH' },
                    { 'data': 'BillAmount' },
                    { 'data': 'BA' },
                    //{ 'data': 'ValueDate' },
                    
                        {
                            'data': 'ValueDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                       
                    },
                    { 'data': 'Naration' }
                ]
            });
            /* SAPVoucherReport Search End*/
            if (success.data.length < 1) {
                //  alert("No record found !")
            }
        });
    }

    SAPVoucherReportFactory.init(
        function (success) {
            // debugger;
            $scope.lst_PayableAt = success[0].data;
            /* SAPVoucherReport Search Start*/
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
            //        {
            //            'data': 'InwardDate',
            //             "render": function (data) {
            //                var date = new Date(data);
            //                var month = date.getMonth() + 1;
            //                //return date.getDate() + "/" + (month.toString().length > 1 ? month : "0" + month) + "/" + date.getFullYear();
            //                return date.getDate() + "/" + (month.toString().length > 1 ? month : "0" + month) + "/" + date.getFullYear();
            //            }
            //        },
            //        { 'data': 'SchCode' },
            //        { 'data': 'VoucherType' },
            //    {
            //        'data': 'BillDate',
            //            'render': function (value) {
            //                if (value === null) return "";
            //                return moment(value).format('DD/MM/YYYY');
            //            }
            //    },
            //{ 'data': 'BillNo' },
            //        { 'data': 'Department_PVNo_SNo' },
            //        { 'data': 'PK' },
            //        { 'data': 'GLCode' },
            //        { 'data': 'BillAmount' }
            //]
            //});
            /* SAPVoucherReport Search End*/
        });
}]);
app.factory("SAPVoucherReportFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
            //  this.getSAPVoucherReportOnSearch(null, null, 0),
            this.GetAllDDL('PayableAt'),
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getSAPVoucherReportOnSearch = function (fromDate, toDate, PayableAt) {
       
        return $http.post(("/Reports/SAP_Voucher_Report_Grid"), { fromDate: fromDate, toDate: toDate, PayableAt: PayableAt });
    },
        this.GetAllDDL = function (category_code) {
            return $http.post(("/Common/GetAllDDL"), { category_code: category_code });
        }
    return this;
}]);