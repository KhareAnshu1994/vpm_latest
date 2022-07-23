app.controller("Lov", ["$scope", "LovFactory", "$timeout", "$location", "$window", function ($scope, LovFactory, $timeout, $location, $window) {
$scope.save = function () {
        debugger;
     
            LovFactory.save($scope.model).then(function (success) {
            //toaster.pop('success', "success", "text");
            alert(success.data);
            window.location.href = window.location.origin + '/Lov';
            //$window.location.reload();
            });
       
    }

    $scope.delete = function (Id) {
        debugger;
        LovFactory.DeleteItem(Id).then(function (success) {
            //toaster.pop('success', "success", "text");
            alert(success.data);
            window.location.href = window.location.origin + '/Lov';
            //$window.location.reload();
        });
    }

 LovFactory.init(
     function (success) {
            debugger;
            $scope.model = success[0].data;
            debugger;
            $scope.lov_categories = success[1].data;
            debugger;
            $("#table_id").dataTable({
             bLengthChange: true,
             lengthMenu: [[10, 50, 100, -1], [10, 50, 100, "All"]],
             bFilter: true,
             bSort: true,
             bPaginate: true,
             bDestroy: true,
             data: success[2].data,
             columns: [
                 {
                     'data': 'ID',
                     "render": function (data, type, full, meta) {
                      return meta.row + 1; // adds id to serial no
                     }
                 },
                 { 'data': 'Category_Code' },
                 {
                     'data': 'Code',
                     'render': function (data, type, row) {
                         return '<a href="/Lov/Item/' + row.ID + '">' + row.Code + '</a>'
                     }
                 },
                 { 'data': 'Name' },
                 { 'data': 'Isactive' }]
         });


         if ($scope.model.Id > 0) {
             $scope.model = success[0].data;
             $scope.lov_categories = success[1].data;
         }
        });
}]);

app.factory("LovFactory", ["$rootScope", "$http", "$q", function ($rootScope, $http, $q) {
    this.init = function (success, failure) {
        var Id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            Id = eval(urls[urls.length - 1]);
        $q.all([
            this.getItem(Id),
            this.getCategoryTypes(),
            this.getLovGrid()
        ]).then(function (msg) {
            success(msg);
        }, failure);  
    }
    this.getItem = function (Id) {
        debugger;
        return $http.post(("/Lov/GetItem"), { Id: Id })
    },
        this.save = function (model) {
            return $http.post(("/Lov/Save"), { model: model });
        },
        this.DeleteItem = function (id) {
        return $http.post(("/Lov/DeleteItem"), { Id: Id })
        }
    this.getCategoryTypes = function () {
        debugger;
        return $http.post(("/Lov/getCategoryTypes"));
        },
        this.getLovGrid = function () {
              debugger;
              return $http.post("/Lov/GetLovGrid");
        }
    return this;
}]);