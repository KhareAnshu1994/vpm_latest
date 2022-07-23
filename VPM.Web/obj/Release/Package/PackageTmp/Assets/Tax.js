
app.controller("TaxController", ["$scope", "TaxFactory", "$timeout", "$location", "$window", "$validator", function ($scope, TaxFactory, $timeout, $location, $window, $validator) {
    $scope.SaveTax = function () {
        debugger;

  //     $validator.validate($scope).success(function () {
         TaxFactory.SaveTax($scope.model).then(function (success) {
            if (success.data == "Data Save Successfully !") {
                window.location.href = window.location.origin + '/Tax/Item';
                alert(success.data);
            }
            else {
                alert(success.data);
            }
        });
    // });
    }

    $scope.SaveTempTaxation = function () {
        debugger;
        $validator.validate($scope).success(function () {
        TaxFactory.SaveTempTaxation($scope.model).then(function (success) {
            debugger;
              alert(success.data);
              TaxFactory.GetTempTaxationRecords().then(function (success) {
              $scope.tempTaxationrecords = success.data;
            });
              
        });
        });
    }

    $scope.DeleteTempTaxationRecord = function (Id) {
        debugger;
        $validator.validate($scope).success(function () {
        TaxFactory.DeleteTempTaxationRecord(Id).then(function (success) {
            debugger;
            alert(success.data);
            TaxFactory.GetTempTaxationRecords().then(function (success) {
                $scope.tempTaxationrecords = success.data;
            });

        });
        });
    }

    $scope.SaveTaxation = function () {
        debugger;
        $validator.validate($scope).success(function () {
        TaxFactory.SaveTaxation().then(function (success) {
            if (success.data == "Data Save Successfully !") {
                window.location.href = window.location.origin + '/Tax/Index';
                alert(success.data);
            }
            else {
                alert(success.data);
            }
        });
        });
    }

    $scope.EditTaxation = function () {
        debugger;
        $validator.validate($scope).success(function () {
        TaxFactory.EditTaxation($scope.model).then(function (success) {
            if (success.data == "Data Save Successfully !") {
                window.location.href = window.location.origin + '/Tax/Index';
                alert(success.data);
            }
            else {
                alert(success.data);
            }
        });
        });
    }

    $scope.DeleteTaxation = function (Id) {
        debugger;
        TaxFactory.DeleteTaxation(Id).then(function (success) {
                if (success.data == "Record Deleted Successfully !") {
                    window.location.href = window.location.origin + '/Tax/Index';
                    alert(success.data);
                }
                else {
                    alert(success.data);
                }
        });
    }

    TaxFactory.init(
        function (success) {
            $scope.lst_Taxes = success[0].data;
            $scope.model = success[2].data;
             //   $scope.model = success[0].data;
          //  $scope.lst_Taxes = success[2].data;
            //$scope.CustomerMasterGridData = success[1].data;
            //$scope.lst_countries = success[2].data;
            //$scope.CM_CustomerNames = success[3].data;
            //$scope.lst_Province = success[4].data;
            //$scope.lst_RiskLevel = success[5].data;

            if ($scope.model.Id > 0) {
                  $scope.model = success[2].data;
            }
            //    $scope.lst_Taxes = success[0].data;
             
              //  $scope.lst_Banks = success[2].data;
                //$scope.model.Dob = new Date($scope.model.Dob);
                //$scope.model.date_of_issue1 = new Date($scope.model.date_of_issue1);
                // $scope.model.date_of_expiry1 = new Date($scope.model.date_of_expiry1);
                // $scope.model.Verification_Date1 = new Date($scope.model.Verification_Date1);
                // $scope.model.date_of_issue2 = new Date($scope.model.date_of_issue2);
                /// $scope.model.date_of_expiry2 = new Date($scope.model.date_of_expiry2);
                /// $scope.model.Verification_Date2 = new Date($scope.model.Verification_Date2);
                //Reload City Again
                //CustomerMasterFactory.GetCity($scope.model.ProvinceId).then(function (d) {
                //    $scope.lst_cities = d.data;
                //}, function (error) {
                //    alert('Error!');
                //});
                //Reload City Again End

         //   }

            /* Taxation Master View Start*/
            debugger;
            $("#table_id").dataTable({
                bLengthChange: true,
                lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success[1].data,
                columns: [
                    {
                        'data': 'Id',
                        "render": function (data, type, full, meta) {
                         return meta.row + 1; // adds id to serial no
                        }
                    },
                    { 'data': 'TaxName' },
                    { 'data': 'TaxPercentage' },
                    { 'data': 'Remark' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/Tax/GetTaxationById/' + row.Id + '">Edit</a>'
                        }
                    }
                ]
            });
            /* Taxation Master View End*/
        });

}]);

app.factory("TaxFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var Id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            Id = eval(urls[urls.length - 1]);
        $q.all([
            this.getTaxList(),
            this.getTaxationMasterGrid(),
            this.GetTaxationById(Id)
           ]).then(function (msg) {
            success(msg);
        }, failure);
    }
       this.SaveTax = function (model) {
            debugger;
        return $http.post(("/Tax/SaveTax"), { model: model });
       },
           this.getTaxList = function () {
            debugger;
           return $http.post(("/Tax/GetTaxNames"));
       },
        this.SaveTempTaxation = function (model) {
            debugger;
        return $http.post(("/Tax/SaveTempTaxation"), { model: model });
        },
        this.SaveTaxation = function () {
            debugger;
        return $http.post(("/Tax/SaveTaxation"));
        },
        this.GetTempTaxationRecords = function () {
               return $http.post(("/Tax/GetTempTaxationRecords"));
        }
        this.DeleteTempTaxationRecord = function (Id) {
        return $http.post(("/Tax/DeleteTempTaxationRecord"), { Id: Id })
        },
        this.GetTaxationById = function (Id) {
            return $http.post(("/Tax/GetTaxationById"), { Id: Id })
        },
        this.getTaxationMasterGrid = function () {
            debugger;
            return $http.post("/Tax/getTaxationMasterGrid");
        },
        this.GetAllDDL = function (category_code) {
            return $http.post(("/Common/GetAllDDL"), { category_code: category_code });
        },
        this.EditTaxation = function (model) {
        debugger;
            return $http.post(("/Tax/EditTaxation"), { model: model });
        },
            this.DeleteTaxation = function (Id) {
        debugger;
            return $http.post(("/Tax/DeleteTaxationById"), { Id: Id });
        }
    return this;
}]);