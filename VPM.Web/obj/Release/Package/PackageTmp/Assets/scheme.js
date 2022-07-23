app.controller("SchemeList", ["$scope", "SchemeListFactory", "$timeout", "$location", "$window", function ($scope, SchemeListFactory, $timeout, $location, $window) {


    //$scope.save = function () {
    //    debugger;
    //    SchemeFactory.save($scope.model).then(function (success) {
    //        alert(success.data);
    //        $window.location.reload();
    //    });
    //};


    SchemeListFactory.init(
        function (success) {
            $scope.scheme_grid_data = success[0].data;
        });
}]);

app.factory("SchemeListFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        $q.all([
            this.getSchemeGrid()
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getSchemeGrid = function () {
        return $http.post("/Scheme/GetSchemeGrid");
    }
    return this;
}]);


app.controller("Scheme", ["$scope", "SchemeFactory", "$timeout", "$location", "$window", "$validator", function ($scope, SchemeFactory, $timeout, $location, $window, $validator) {


    $scope.save = function () {
        debugger;
        $validator.validate($scope).success(function () {
            SchemeFactory.save($scope.model).then(function (success) {
                //toaster.pop('success', "success", "text");
                alert(success.data);
                window.location.href = window.location.origin + '/Scheme';
                //$window.location.reload();
            });
        });
    };


    SchemeFactory.init(
        function (success) {
            $scope.model = success[0].data;
        });
}]);


app.factory("SchemeFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(id)
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (id) {
        return $http.post(("/Scheme/GetItem"), { id: id })
    },
        this.save = function (model) {
            return $http.post(("/Scheme/save"), { model: model });
        }
    return this;
}]);