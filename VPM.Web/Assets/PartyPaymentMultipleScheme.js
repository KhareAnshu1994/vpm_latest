app.controller("PartyPaymentMultipleSchemeController", ["$scope", "PartyPaymentMultipleSchemeFactory", "$timeout", "$location", "$window", "$validator", "$filter", function ($scope, PartyPaymentMultipleSchemeFactory, $timeout, $location, $window, $validator, $filter) {
    $scope.fromDate = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.toDate = new Date(new Date().setHours(0, 0, 0, 0));
  //  $scope.FileTypeId = 0;
    $scope.SGSTRate =0;
    $scope.CGSTRate = 0;
    $scope.IGSTRate = 0;
    //Load VenderDetails
    $scope.GetVenderDetails = function () {
        debugger;
        PartyPaymentMultipleSchemeFactory.getVenderDetailsById($scope.model.PartyId).then(function (d) {
            $scope.model.PartyAddress = d.data.Address1;
            $scope.model.GSTRNo = d.data.GSTNO;
            $scope.model.PANNO = d.data.PANNO;
        }, function (error) {
            alert('Error!');
        });
    }

    /* SavePPMultipleScheme created for save Party Payment Multiple Scheme Start*/
    $scope.SavePMultipleScheme = function () {
        debugger;
        $validator.validate($scope).success(function () {
            /* All If and else block comment on 13-09-2021 after rule change */
          /*   if (($scope.model.SGSTRate == 0 && $scope.model.CGSTRate == 0 && $scope.model.IGSTRate == 0)) {
                debugger;
                alert('Please Select Either CGST and SGST or IGST.');
            }
           else if (($scope.model.SGSTRate > 0 && $scope.model.CGSTRate > 0) && $scope.model.IGSTRate > 0) {
                debugger;
                alert('Either CGST and SGST or IGST will be filled');
            }
            else if (($scope.model.SGSTRate== 0 && $scope.model.CGSTRate > 0) && $scope.model.IGSTRate > 0) {
                debugger;
                alert('Either CGST and SGST or IGST will be filled');
            }
            else if (($scope.model.SGSTRate > 0 && $scope.model.CGSTRate == 0) && $scope.model.IGSTRate > 0) {
                debugger;
                alert('Either CGST and SGST or IGST will be filled');
            }*/
            //else {
                debugger;
                PartyPaymentMultipleSchemeFactory.SavePMultipleScheme($scope.model).then(function (success) {
                    if (success.data == "Data Save Successfully !") {
                        //window.location.href = window.location.origin + '/PartyPaymentMultipleScheme/Item';
                        alert(success.data);
                        $scope.model.SGSTRate = 0;
                        $scope.model.CGSTRate = 0;
                        $scope.model.IGSTRate = 0;
                        $scope.model.GLCODE_CGST= "";
                        $scope.model.GLCODE_SGST= "";
                        $scope.model.GLCODE_IGST= "";
                        $scope.model.SchCode= "";
                        $scope.model.GLCode= "";
                        $scope.model.BillAmount="";
                        $scope.model.TotalBill="";
                        debugger;
                          

                        /* Call function CalculateNetAmount() for update net amount*/
                      //  $scope.CalculateNetAmount();

                        /*Call function GetDetailsByBillNo() for gets NetTotalBill and  Payment Multiple Scheme by Bill No*/
                        $scope.GetDetailsByBillNo();
                   }
                    else {
                        alert(success.data);
                    }
                });
           // }
        });
    }
/* SavePPMultipleScheme created for save Party Payment Multiple Scheme End*/

    /*Delete Payment Multiple Scheme Record by Id*/ 
    $scope.DeleteTempPMSRecords = function (Id) {
        debugger;
        $validator.validate($scope).success(function () {
            var result = confirm("are you sure to delete this record?");
            if (result) {
                PartyPaymentMultipleSchemeFactory.DeleteTempPMSRecords(Id).then(function (success) {
                    debugger;
                    alert(success.data);
                    /*Call function GetDetailsByBillNo() for gets NetTotalBill and  Payment Multiple Scheme by Bill No*/
                    $scope.GetDetailsByBillNo();
                });
            }
        });
    }

    $scope.Save = function () {
        debugger;
        $validator.validate($scope).success(function () {
            /* All If and else block comment on 13-09-2021 after rule change */

            /*if (($scope.model.SGSTRate != 0 && $scope.model.CGSTRate != 0 && $scope.model.IGSTRate != 0) || ($scope.model.SGSTRate == 0 && $scope.model.CGSTRate == 0 && $scope.model.IGSTRate == 0)) {
               debugger;
               alert('Either CGST and SGST or IGST will be filled');
           }
           else 
            if (($scope.model.TDSUnderSGSTRate != 0 && $scope.model.TDSUnderCGSTRate != 0 && $scope.model.TDSUnderIGSTRate != 0) || ($scope.model.TDSUnderSGSTRate == 0 && $scope.model.TDSUnderCGSTRate == 0 && $scope.model.TDSUnderIGSTRate == 0)) {
                debugger;
                alert('Either TDSUnderCGST and TDSUnderSGST or TDSUnderIGST will be filled');
                }*/
          //  else {
                debugger;
                PartyPaymentMultipleSchemeFactory.Save($scope.model).then(function (success) {
                    if (success.data == "Data Save Successfully !") {
                        window.location.href = window.location.origin + '/PartyPaymentMultipleScheme/Index';
                        alert(success.data);


                    }
                    else {
                        alert(success.data);
                    }
                });
           // }
        });
    }

    /*function for gets NetTotalBill and  Payment Multiple Scheme by Bill No*/
    $scope.GetDetailsByBillNo = function () {
       
    /* Gets Payment Multiple Scheme by Bill No*/
        PartyPaymentMultipleSchemeFactory.GetPMultipleScheme($scope.model.BillNo).then(function (success) {
            debugger;
            angular.forEach(success.data, function (value, key) {
                success.data[key].BillDate = ConvertJsonDateToDateTime(success.data[key].BillDate);
            })
            $scope.tempPaymentMultipleSchemeRecords = success.data;
        }, function (error) {
            $scope.NetTotalBillAmount = 0;
        });

        /* Gets NetTotalBill by Bill No*/
        debugger;
        PartyPaymentMultipleSchemeFactory.GetSumOfTotalBill($scope.model.BillNo).then(function (success) {
            $scope.model.NetTotalBill = success.data.NetTotalBill;
            $scope.model.NetBillAmount = success.data.NetBillAmount;

            /* Call function CalculateNetAmount() for update net amount*/
            $scope.CalculateNetAmount();

        }, function (error) {
            $scope.model.NetBillAmount = 0;
            $scope.model.NetTotalBill = 0;
        });

        //$scope.SGST = ((eval($scope.model.BillAmount) * eval($scope.model.SGSTRate)) / 100);
        //$scope.CGST = ((eval($scope.model.BillAmount) * eval($scope.model.CGSTRate)) / 100);
        //$scope.IGST = ((eval($scope.model.BillAmount) * eval($scope.model.IGSTRate)) / 100);
        //$scope.model.TotalBill = eval($scope.model.BillAmount) + $scope.SGST + $scope.CGST + $scope.IGST;
        //$scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
    }

    $scope.CalculateTotalBill = function () {
        debugger;
        if ($scope.model.SGSTRate == null && $scope.model.CGSTRate == null && $scope.model.IGSTRate == null) {
            $scope.model.TotalBill = eval($scope.model.BillAmount);
            $scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
        }
        else if (($scope.model.SGSTRate != null && $scope.model.CGSTRate != null) && ($scope.model.IGSTRate == null || $scope.model.IGSTRate ==0) ) {
            debugger;
            $scope.SGST = ((eval($scope.model.BillAmount) * eval($scope.model.SGSTRate)) / 100);
            $scope.CGST = ((eval($scope.model.BillAmount) * eval($scope.model.CGSTRate)) / 100);
            $scope.model.TotalBill = eval($scope.model.BillAmount) + $scope.SGST + $scope.CGST;
            $scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
        }
        else if ((($scope.model.SGSTRate == null && $scope.model.CGSTRate == null) || ($scope.model.SGSTRate == 0 && $scope.model.CGSTRate == 0))  && $scope.model.IGSTRate != null) {
            $scope.IGST = ((eval($scope.model.BillAmount) * eval($scope.model.IGSTRate)) / 100);
            $scope.model.TotalBill = eval($scope.model.BillAmount) + $scope.IGST;
            $scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
        }
        else
            {
                $scope.model.TotalBill = eval($scope.model.BillAmount);
                $scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
        }



            //$scope.SGST = ((eval($scope.model.BillAmount) * eval($scope.model.SGSTRate)) / 100);
            //$scope.CGST = ((eval($scope.model.BillAmount) * eval($scope.model.CGSTRate)) / 100);
            //$scope.IGST = ((eval($scope.model.BillAmount) * eval($scope.model.IGSTRate)) / 100);
            //$scope.model.TotalBill = eval($scope.model.BillAmount) + $scope.SGST + $scope.CGST + $scope.IGST;
            //$scope.model.TotalBill = $scope.model.TotalBill.toFixed(2);
        
        debugger;
    }

    $scope.CalculateNetAmount = function () {
        debugger;
        $scope.IncomeTax = ((eval($scope.model.NetBillAmount) * eval($scope.model.IncomeTaxRate)) / 100);
        $scope.TDSUnderSGST = ((eval($scope.model.NetBillAmount) * eval($scope.model.TDSUnderSGSTRate)) / 100);
        $scope.TDSUnderCGST = ((eval($scope.model.NetBillAmount) * eval($scope.model.TDSUnderCGSTRate)) / 100);
        $scope.TDSUnderIGST = ((eval($scope.model.NetBillAmount) * eval($scope.model.TDSUnderIGSTRate)) / 100);
        $scope.model.NetAmount = eval($scope.model.NetTotalBill) - ($scope.TDSUnderSGST + $scope.TDSUnderCGST + $scope.TDSUnderIGST + $scope.IncomeTax);
        $scope.model.NetAmount = $scope.model.NetAmount.toFixed(2);
        debugger;
    }

    $scope.searchButtonText = "Search";
    $scope.Search = function (fromDate, toDate) {
        $scope.searchButtonText = "Searching";
        PartyPaymentMultipleSchemeFactory.GetPartyPaymentGrid(fromDate, toDate).then(function (success) {
            $scope.searchButtonText = "Search";

            /* SAPVoucherReport Search Start*/
            $("#table_id").dataTable({
                bLengthChange: true,
                lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success.data,
                type: json,
                columns: [
                    { 'data': 'PartyName' },
                    {
                        'data': 'BillNoDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                    },
                    { 'data': 'BillAmount' },
                    { 'data': 'NetAmount' },
                    { 'data': 'TotalBill' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/PartyMaster/Item/' + row.Id + '">Edit</a>'
                        }
                    }
                ]
            });
            /* SAPVoucherReport Search End*/
            if (success.data.length < 1) {
                //   alert("No record found !")
            }
        });
    }
    function ConvertJsonDateToDateTime(date) {
        var parsedDate = new Date(parseInt(date.substr(6)));
        var newDate = new Date(parsedDate);
        var month = ('0' + (newDate.getMonth())).slice(-2);
        var day = ('0' + newDate.getDate()).slice(-2);
        var year = newDate.getFullYear();
        return new Date(year, month, day);
    }

    PartyPaymentMultipleSchemeFactory.init(
        function (success) {
            debugger;
            $scope.model = success[0].data;
            $scope.lst_PartyNames = success[1].data;
            $scope.lst_PayableAt = success[2].data;
            $scope.lst_SGST_Rates = success[3].data;
            $scope.lst_CGST_Rates = success[4].data;
            $scope.lst_IGST_Rates = success[5].data;
            $scope.lst_Income_Tax_Rates = success[6].data;
            $scope.lst_TDS_under_SGST_Rates = success[7].data;
            $scope.lst_TDS_Under_CGST_Rates = success[8].data;
            $scope.lst_TDS_Under_IGST_Rates = success[9].data;
            $scope.lst_VoucherTypes = success[11].data;


            if ($scope.model.Id > 0) {
                $scope.model = success[0].data;
                $scope.model.InwardDate = ConvertJsonDateToDateTime(success[0].data.InwardDate);
                $scope.model.PVDate = ConvertJsonDateToDateTime(success[0].data.PVDate);
                $scope.model.BillDate = ConvertJsonDateToDateTime(success[0].data.BillDate);
                if (success[0].data.PayableAtDate != null) {
                    $scope.model.PayableAtDate = ConvertJsonDateToDateTime(success[0].data.PayableAtDate);
                }
                /*Call function GetDetailsByBillNo() for gets NetTotalBill and  Payment Multiple Scheme by Bill No*/
                $scope.GetDetailsByBillNo();
            }
            else {
                $scope.model.BillDate = new Date(new Date().setHours(0, 0, 0, 0));
            }
            /* PartyMasterView Start*/
            $("#table_id").dataTable({
                bLengthChange: true,
                lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success[10].data,
                columns: [
                    { 'data': 'PartyName' },
                    {
                        'data': 'BillDate',
                        'render': function (value) {
                            if (value === null) return "";
                            return moment(value).format('DD/MM/YYYY');
                        }
                    },
                    { 'data': 'NetBillAmount' },
                    { 'data': 'NetTotalBill' },
                    { 'data': 'NetAmount' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/PartyPaymentMultipleScheme/Item/' + row.Id + '">Edit</a>'
                        }
                    }

                ]
            });
            /* PartyMasterView End*/
        });

}]);

app.factory("PartyPaymentMultipleSchemeFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var Id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            Id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(Id),
            this.GetPartyNames(),
            this.GetAllDDL('PayableAt'),//PayableAt
            this.GetTaxPercentageDDL(1),//SGST
            this.GetTaxPercentageDDL(2),//CGST
            this.GetTaxPercentageDDL(3),//IGST
            this.GetTaxPercentageDDL(4),//Income Tax
            this.GetTaxPercentageDDL(5),//TDS under SGST
            this.GetTaxPercentageDDL(6),//TDS Under CGST
            this.GetTaxPercentageDDL(7),//TDS Under IGST
            this.GetPartyPaymentMultipleSchemeGrid(null, null),
            this.GetAllDDL('VoucherTypes')// VoucherTypes
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (Id) {
        debugger;
        return $http.post(("/PartyPaymentMultipleScheme/GetItem"), { Id: Id })
    },
        this.getVenderDetailsById = function (Id) {
        debugger;
        debugger;
            return $http.post(("/PartyMaster/GetItem"), { Id: Id })
        },
        this.Save = function (model) {
            debugger;
            return $http.post(("/PartyPaymentMultipleScheme/Save"), { model: model });
        },
        this.SavePMultipleScheme = function (model) {
            debugger;
            return $http.post(("/PartyPaymentMultipleScheme/SavePMultipleScheme"), { model: model });
        },
        this.DeleteTempPMSRecords = function (Id) {
        return $http.post(("/PartyPaymentMultipleScheme/DeleteTempPMS"), { Id: Id })
        },
        this.GetPartyPaymentMultipleSchemeGrid = function (fromDate, toDate) {
            debugger;
        return $http.post(("/PartyPaymentMultipleScheme/GetPartyPaymentMultipleSchemeGrid"), { fromDate: fromDate, toDate: toDate });
        },
        this.GetAllDDL = function (category_code) {
            return $http.post(("/Common/GetAllDDL"), { category_code: category_code });
        },
        this.GetPMultipleScheme = function (BillNo) {
        return $http.post(("/PartyPaymentMultipleScheme/GetPMultipleSchemeList"), { BillNo: BillNo });
        }
        this.GetSumOfTotalBill = function (BillNo) {
            return $http.post(("/PartyPaymentMultipleScheme/GetPaymentMultipleScheme"), { BillNo: BillNo });
        }
        this.GetTaxPercentageDDL = function (Id) {
            return $http.post(("/Common/GetTaxPercentageDDL"), { Id: Id });
        },
        this.GetPartyNames = function () {
            return $http.post(("/Common/GetPartyNames"));
        }
    return this;
}]);