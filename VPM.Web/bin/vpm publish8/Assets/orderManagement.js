app.controller("OrderManagementList", ["$scope", "OrderManagementListFactory", "$timeout", "$location", "$window", function ($scope, OrderManagementListFactory, $timeout, $location, $window) {


    //$scope.save = function () {
    //    debugger;
    //    OrderManagementFactory.save($scope.model).then(function (success) {
    //        alert(success.data);
    //        $window.location.reload();
    //    });
    //};


    OrderManagementListFactory.init(
        function (success) {
            $scope.OrderManagement_grid_data = success[0].data;
        });
}]);

app.factory("OrderManagementListFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        $q.all([
            this.getOrderManagementGrid()
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getOrderManagementGrid = function () {
        return $http.post("/OrderManagement/GetOrderManagementGrid");
    }
    return this;
}]);


app.controller("OrderManagement", ["$scope", "OrderManagementFactory", "$timeout", "$location", "$window", "$validator", "$filter", function ($scope, OrderManagementFactory, $timeout, $location, $window, $validator, $filter) {

    $scope.selected = null;
    $scope.multipleSelected = [];
    $scope.disabled = false;

    $scope.$watch("model.price_yield_id", function (newVal, oldVal) {
        debugger;
        if (typeof newVal == "undefined" || newVal == 0)
            return;
        if (newVal == oldVal)
            return;
        if (newVal === 9) {
            $scope.decvalues = "/^[0-9]+(\.[0-9]{1,2})?$/";
        }
        if (newVal === 10) {
            $scope.decvalues = "[0-9]+(\.[0-9]{1,2})?%?";
        }
    });

    $scope.save = function () {

        $validator.validate($scope).success(function () {
            OrderManagementFactory.save($scope.model).then(function (success) {
                //toaster.pop('success', "success", "text");
                alert(success.data);
                window.location.href = window.location.origin + '/OrderManagement';
                //$window.location.reload();
            });
        })//.error(function () {
        //    alert("Fields with * is mandatory, Please fill the required fields !");
        //});
    };


    OrderManagementFactory.init(
        function (success) {
            debugger;
            $scope.model = success[0].data;
            $scope.model.system_time = new Date($scope.model.system_time);
            if ($scope.model.ID == 0) {
                $scope.model.system_date = new Date(new Date().setHours(0, 0, 0, 0));
                //$scope.model.system_time = {
                //    date: new Date(),
                //    time: $filter('date')(new Date(), 'HH:mm')
                //};

            }
            else {
                $scope.model.system_date = new Date($scope.model.system_date);


                $scope.scheme_temp = $scope.model.scheme_list
                $scope.model.scheme_list = [];
                for (var k = 0; k < $scope.scheme_temp.length; k++) {
                    $scope.model.scheme_list.push(parseInt($scope.scheme_temp[k]));
                }
            }
            $scope.security_types = success[1].data;
            //$scope.model.security_type_id = $scope.security_types[0];
            $scope.scheme_names = success[2].data;
            // $scope.model.scheme_id = $scope.scheme_names[0];
            $scope.toggles = success[3].data;
            //$scope.model.toggle_id = $scope.toggles[0];
            $scope.priceyields = success[4].data;
    
        });
}]);


app.factory("OrderManagementFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(id),
            CommonFactory.getSecurityTypes(),
            CommonFactory.getSchemes(),
            CommonFactory.getToggles(),
            CommonFactory.getPriceYields(),
          ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (id) {
        return $http.post(("/OrderManagement/GetItem"), { id: id })
    },
        this.save = function (model) {
            return $http.post(("/OrderManagement/save"), { model: model });
        }
    return this;
}]);