
app.controller("LovCategory", ["$scope", "LovCategoryFactory", "$timeout", "$location", "$window",function ($scope, LovCategoryFactory, $timeout, $location, $window) {
    $scope.save = function () {
        debugger;
              LovCategoryFactory.save($scope.model).then(function (success) {
                if (success.data == "Data Save Successfully !") {
                    alert(success.data);
                    window.location.href = window.location.origin + '/LovCategory';
                }
                else {
                    alert(success.data);
                }
            });
      
    };

    $scope.delete = function (id) {
        debugger;
        LovCategoryFactory.DeleteItem(id).then(function (success) {
            //toaster.pop('success', "success", "text");
            alert(success.data);
            window.location.href = window.location.origin + '/LovCategory';
            //$window.location.reload();
        });
    };

       LovCategoryFactory.init(
        function (success) {
            $scope.model = success[0].data;
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
                        'data': 'ID',
                        "render": function (data, type, full, meta) {
                         return meta.row + 1; // adds id to serial no
                        }
                    },
                    {
                        'data': 'Code',
                        'render': function (data, type, row) {
                            return '<a href="/LovCategory/Item/' + row.ID + '">' + row.Code + '</a>'
                        }
                    },
                    { 'data': 'Name' },
                    { 'data': 'isactive' }]
            });

        });
}]);


app.factory("LovCategoryFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var Id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            Id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(Id),
            this.getLovCategoryGrid()
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getItem = function (Id) {
        return $http.post(("/LovCategory/GetItem"), { Id: Id })
    },
        this.save = function (model) {
            return $http.post(("/LovCategory/save"), { model: model });
        },
        this.DeleteItem = function (id) {
        return $http.post(("/LovCategory/DeleteItem"), { id: id })
        },
        this.getLovCategoryGrid = function () {
            debugger;
            return $http.post("/LovCategory/GetLovCategoryGrid");
        }
    return this;
}]);