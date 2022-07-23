app.controller("LoginController", ["$scope", "LoginFactory", "$timeout", "$location", "$window",function ($scope, LoginFactory, $timeout, $location, $window) {
    $scope.Login = function () {
           debugger;
            LoginFactory.Login($scope.model).then(function (success) {
                if (success.data == "Login suggesfully.") {
                window.location.href = window.location.origin + '/Home/Index';
            }
            else {
                 alert(success.data);
            }
            });
    };
        
     $scope.Logout = function () {
        debugger;
        LoginFactory.Logout().then(function (success) {
            if (success.data == "Logout suggesfully.") {
                alert(success.data);
                window.location.href = window.location.origin + '/Login/Index';
            }
        });
        };
}]);

app.factory("LoginFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(id),
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (id) {
        return $http.post(("/Lov/GetItem"), { id: id })
    },
        this.save = function (model) {
            return $http.post(("/Lov/Save"), { model: model });
        },
        this.Update = function (model) {
            return $http.post(("/Lov/Update"), { model: model });
        },
        this.DeleteItem = function (id) {
            return $http.post(("/Lov/DeleteItem"), { id: id })
        },
        this.Login = function (model) {
        debugger;
        return $http.post(("/Login/userlogin"), { model: model })
        },
        this.Logout = function() {
            debugger;
        return $http.post(("/Login/Logout"))
        }
        return this;
}]);