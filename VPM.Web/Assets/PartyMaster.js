
app.controller("PartyMasterController", ["$scope", "PartyMasterFactory", "$timeout", "$location", "$window", "$validator", function ($scope, PartyMasterFactory, $timeout, $location, $window, $validator) {
      $scope.Save = function () {
          debugger;
        $validator.validate($scope).success(function () {
        PartyMasterFactory.save($scope.model).then(function (success) {
            if (success.data == "Data Save Successfully !") {
                window.location.href = window.location.origin + '/PartyMaster/Index';
                alert(success.data);
            }
            else {
                alert(success.data);
            }
        });
    });
    }

    PartyMasterFactory.init(
        function (success) {
            $scope.model = success[0].data;
            $scope.lst_Banks = success[2].data;
            //$scope.CustomerMasterGridData = success[1].data;
            //$scope.lst_countries = success[2].data;
            //$scope.CM_CustomerNames = success[3].data;
            //$scope.lst_Province = success[4].data;
            //$scope.lst_RiskLevel = success[5].data;

            if ($scope.model.Id > 0) {
                $scope.model = success[0].data;
                $scope.lst_Banks = success[2].data;
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

            }

            /* PartyMasterView Start*/
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
                    //{
                    //    "data": null,
                    //    'render': function (data, type, row) {
                    //        return '<a href="/PartyMaster/Item/' + row.Id + '">Edit</a>'
                    //    }
                    //},
                    {
                        'data': 'PartyName',
                        'render': function (data, type, row) {
                            return '<a href="/PartyMaster/Item/' + row.Id + '">' + row.PartyName + '</a>'
                        }
                    },
                 /*   { 'data': '' },*/
                    { 'data': 'Location' },
                    { 'data': 'Address1' },
                    { 'data': 'Address2' },
                    { 'data': 'Address3' },
                    { 'data': 'State' },
                    { 'data': 'Pincode' },
                    { 'data': 'BankName' },
                    { 'data': 'IFSCCODE' },
                    { 'data': 'AccountNo' },
                    { 'data': 'GSTNO' },
                    { 'data': 'PANNO' },
                    { 'data': 'Remark' },
                    { 'data': 'IsActive' }
                    

                ]
            });
            /* PartyMasterView End*/
         });

}]);

app.factory("PartyMasterFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var Id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            Id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(Id),
            this.getPartyMasterGrid(),
            this.GetAllDDL('Bank'),
            ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (Id) {
        debugger;
        return $http.post(("/PartyMaster/GetItem"), { Id: Id })
    },
        this.save = function (model) {
        debugger;
            return $http.post(("/PartyMaster/Save"), { model: model });
        },
        this.Update = function (model) {
        return $http.post(("/PartyMaster/Update"), { model: model });
        },
        this.DeleteItem = function (id) {
        return $http.post(("/PartyMaster/DeleteItem"), { Id: Id })
        },
        this.getPartyMasterGrid = function () {
        debugger;
        return $http.post("/PartyMaster/GetPartyMasterGrid");
        },
        this.GetAllDDL = function (category_code) {
            return $http.post(("/Common/GetAllDDL"), { category_code: category_code });
        }
     return this;
}]);