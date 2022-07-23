app.controller("Report", ["$scope", "ReportFactory", "CommonFactory", "$timeout", "$location", "$window", function ($scope, ReportFactory, CommonFactory, $timeout, $location, $window) {
    $scope.searchButtonText = "Search";
    $scope.isExportBtnHide = true;
    $scope.FROM_DATE = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.TO_DATE = new Date(new Date().setHours(0, 0, 0, 0));
    $scope.is_send_mail_allowed = false;
    $scope.is_download_excel_allowed = false;
    //$scope.reportTypes = [{ "ID": 0, "Name": "Select" }, { "ID": 1, "Name": "Non Participation" }, { "ID": 2, "Name": "Outlier" }, { "ID": 3, "Name": "OMS_Data" }]
   // $scope.ReportType = $scope.reportTypes[0];


   

    $scope.GetGridRecord = function (FROM_DATE, TO_DATE) {
      
        $scope.searchButtonText = "Searching";
        ReportFactory.getGridDetail(FROM_DATE, TO_DATE).then(function (success) {
           
            $scope.searchButtonText = "Search";
            $scope.report_grid_data = success.data;
            if (success.data.length < 1) {

                alert("No record found !")
            }
            else {
                $scope.isExportBtnHide = false;
            }
        });
    }
   
}]);
app.factory("ReportFactory", ["$rootScope", "$http", "$q", "CommonFactory", function ($rootScope, $http, $q, CommonFactory) {
    this.init = function (success, failure) {
        var id = 0;
        var urls = window.location.href.split('?')[0].split('/');
        if (!isNaN(urls[urls.length - 1]))
            id = eval(urls[urls.length - 1]);

        $q.all([
           CommonFactory.getReportAccess()
        ]).then(function (msg) {
            success(msg);
        }, failure);
    }
    this.getGridDetail = function (FROM_DATE, TO_DATE) {
        return $http.post(('/Report/GetGridDetail/'), { FROM_DATE: FROM_DATE.toJSON(), TO_DATE: TO_DATE.toJSON()});
    }
    return this;
}]);