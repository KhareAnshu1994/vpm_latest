app.controller("CustomerMasterList", ["$scope", "CustomerMasterListFactory", "$timeout", "$location", "$window", function ($scope, CustomerMasterListFactory, $timeout, $location, $window) {
    //CustomerMasterListFactory.init(
    //    function (success) {
    //        $scope.CustomerMasterGridData = success[0].data;
    //    });

    
}]);

app.factory("CustomerMasterListFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        $q.all([
            this.getCustomerMasterGrid()
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
  return this;
}]);


app.controller("CustomerMaster", ["$scope", "CustomerMasterFactory", "$timeout", "$location", "$window", "$validator", function ($scope, CustomerMasterFactory, $timeout, $location, $window, $validator) {
    $scope.searchButtonText = "Search";
    $scope.save = function () {
        debugger;
        $validator.validate($scope).success(function () {
            CustomerMasterFactory.save($scope.model).then(function (success) {
                //toaster.pop('success', "success", "text");
                alert(success.data);
                window.location.href = window.location.origin + '/CustomerMaster';
                //$window.location.reload();
            });
        });
    };

    //Load City
    $scope.GetCity = function () {
        debugger;
        CustomerMasterFactory.GetCity($scope.model.ProvinceId).then(function (d) {
            
            $scope.lst_cities = d.data;
        }, function (error) {
            alert('Error!');
        });
    }
     $scope.Delete = function () {
        debugger;
            CustomerMasterFactory.Delete($scope.model).then(function (success) {
                //toaster.pop('success', "success", "text");
                alert(success.data);
                window.location.href = window.location.origin + '/CustomerMaster';
                //$window.location.reload();
            });
    };

    $scope.EditCusttomerDocDetails = function (pcust_doc_detail_id, pcustomer_id, pdocument_id, padd_doc_id, pdocument_no, pplace_of_issue, pdate_of_issue, pdate_of_expiry, pverification_date) {
        debugger;
        CustomerMasterFactory.EditCusttomerDocumentDetails(pcust_doc_detail_id, pcustomer_id, pdocument_id, padd_doc_id, pdocument_no, pplace_of_issue, pdate_of_issue, pdate_of_expiry, pverification_date).then(function (success) {
            alert(success.data);
        });
    }

     $scope.search = function (customerid, customername, mobile, email, verified) {
        debugger;
        $scope.searchButtonText = "Searching";
        CustomerMasterFactory.getCustomerDetailOnSearch(customerid, customername, mobile, email, verified).then(function (success) {
            $scope.searchButtonText = "Search";
            //$scope.CustomerMasterGridData = null;
            //$scope.CustomerMasterGridData = success.data;
            //debugger;
          //  $("#table_id").dataTable(null);
            debugger;
            /* Customer Page1 Search Start*/
            $("#table_id").dataTable({
                bLengthChange: true,
                lengthMenu: [[20, 50, 100, -1], [20, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success.data,
                columns: [
                    { 'data': 'CustomerName' },
                    { 'data': 'UnitApartmentNumber' },
                    { 'data': 'Street' },
                    { 'data': 'City' },
                    { 'data': 'Province' },
                    { 'data': 'Country' },
                    { 'data': 'MobileNo' },
                    { 'data': 'Notes' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/CustomerMaster/Item/' + row.Id + '">Edit</a>'
                        }
                    }
                   
                ]
            });
        /* Customer Page1 Search End*/

            /* Customer Report Search Start*/
            $("#table_id1").dataTable({
                bLengthChange: true,
                lengthMenu: [[20, 50, 100, -1], [20, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success.data,
                columns: [
                    { 'data': 'Id' },
                    { 'data': 'Verified' },
                    { 'data': 'CustomerName' },
                    { 'data': 'Street' },
                    { 'data': 'City' },
                    { 'data': 'Country' },
                    { 'data': 'Province' },
                    { 'data': 'Email' },
                    { 'data': 'MobileNo' },
                    { 'data': 'Notes' },
                    { 'data': 'Occupation' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/CustomerMaster/Item/' + row.Id + '">Edit</a>'
                        }
                    }
                ]
            });
        /* Customer Report Search end*/

            if (success.data.length < 1) {
                alert("No record found !")
            }
        });
    }
   
    CustomerMasterFactory.init(
        function (success) {
            $scope.model = success[0].data;
         //   $scope.CustomerMasterGridData = success[1].data;
            $scope.lst_countries = success[2].data;
            $scope.CM_CustomerNames = success[3].data;
            $scope.lst_Province = success[4].data;
            $scope.lst_RiskLevel = success[5].data;

            if ($scope.model.Id > 0) {
                $scope.model.Dob = new Date($scope.model.Dob);
                $scope.model.date_of_issue1 = new Date($scope.model.date_of_issue1);
                $scope.model.date_of_expiry1 = new Date($scope.model.date_of_expiry1);
                $scope.model.Verification_Date1 = new Date($scope.model.Verification_Date1);
                $scope.model.date_of_issue2 = new Date($scope.model.date_of_issue2);
                $scope.model.date_of_expiry2 = new Date($scope.model.date_of_expiry2);
                $scope.model.Verification_Date2 = new Date($scope.model.Verification_Date2);
                //Reload City Again
                CustomerMasterFactory.GetCity($scope.model.ProvinceId).then(function (d) {
                    $scope.lst_cities = d.data;
                }, function (error) {
                    alert('Error!');
                });
                //Reload City Again End
                
            }
            
            /* Customer Page1 Search Start*/
            debugger;
                    $("#table_id").dataTable({
                        bLengthChange: true,
                        lengthMenu: [[20, 50, 100, -1], [20, 50, 100, "All"]],
                        bFilter: true,
                        bSort: true,
                        bPaginate: true,
                        bDestroy:true,
                        data: success[1].data,
                        columns: [
                            { 'data': 'CustomerName' },
                            { 'data': 'UnitApartmentNumber' },
                            { 'data': 'Street' },
                            { 'data': 'City' },
                            { 'data': 'Province' },
                            { 'data': 'Country' },
                            { 'data': 'MobileNo' },
                            { 'data': 'Notes' },
                            {
                                "data": null,
                                'render': function (data, type, row) {
                                    return '<a href="/CustomerMaster/Item/' + row.Id + '">Edit</a>'
                                }
                            }
                           
                        ]
                    });
        /* Customer Page1 Search End*/
            /* Customer Report Search Start*/
            $("#table_id1").dataTable({
                bLengthChange: true,
                lengthMenu: [[20, 50, 100, -1], [20, 50, 100, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                bDestroy: true,
                data: success[1].data,
                columns: [
                    { 'data': 'Id' },
                    { 'data': 'Verified' },
                    { 'data': 'CustomerName' },
                    { 'data': 'Street' },
                    { 'data': 'City' },
                    { 'data': 'Country' },
                    { 'data': 'Province' },
                    { 'data': 'Email' },
                    { 'data': 'MobileNo' },
                    { 'data': 'Notes' },
                    { 'data': 'Occupation' },
                    {
                        "data": null,
                        'render': function (data, type, row) {
                            return '<a href="/CustomerMaster/Item/' + row.Id + '">Edit</a>'
                        }
                    }
                ]
            });
        /* Customer Report Search end*/
        });












 }]);


app.factory("CustomerMasterFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q,CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(id),
            this.getCustomerMasterGrid(),
            this.GetCountry(),
            CommonFactory.GetCustomerId(),
            CommonFactory.GetProvinces(),
            this.GetAllDDL('RL'),
          ]).then(function (msg) {
            success(msg);
        }, failure);
    
    }
        this.getItem = function (id) {
        return $http.post(("/CustomerMaster/GetItem"), { id: id })
        },
        this.save = function (model) {
        return $http.post(("/CustomerMaster/save"), { model: model });
        },
        this.Delete = function (model) {
            return $http.post(("/CustomerMaster/Delete"), { model: model });
        },
        this.getCustomerDetailOnSearch = function (customerid, customername, mobile, email, verified) {
                return $http.post(("/CustomerMaster/Find"), { customerid: customerid, customername: customername, mobile: mobile, email: email, verified: verified });
        },
        this.getCustomerMasterGrid = function () {
                return $http.post("/CustomerMaster/GetCustomerMaster");
        },
        this.GetAllDDL = function (category_code) {
        return $http.post(("/Common/GetAllDDL"), { category_code: category_code });
        },
        this.GetCountry = function (ProvinceId) {
                debugger;
            return $http.post(("/Common/GetCountry"));
        }
        this.GetCity = function (ProvinceId) {
            debugger;
            return $http.post(("/Common/GetCitiesByProvince"), { ProvinceId: ProvinceId });
        },
        this.EditCusttomerDocumentDetails = function (pcust_doc_detail_id, pcustomer_id, pdocument_id, padd_doc_id, pdocument_no, pplace_of_issue, pdate_of_issue, pdate_of_expiry, pverification_date) {
              debugger;
            return $http.post(("/CustomerMaster/EditCusttomerDocumentDetails"), { pcust_doc_detail_id: pcust_doc_detail_id, pcustomer_id: pcustomer_id, pdocument_id: pdocument_id, padd_doc_id: padd_doc_id, pdocument_no: pdocument_no, pplace_of_issue: pplace_of_issue, pdate_of_issue: pdate_of_issue, pdate_of_expiry: pdate_of_expiry, pverification_date: pverification_date });
        }
        return this;
}]);