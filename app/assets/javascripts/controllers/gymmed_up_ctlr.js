(function () {
  "use strict";

  angular.module("gymmed_up").controller("gymmed_up_ctlr", function($scope) {
    function setup() {
      $http.get('/api/v1/employees.json').then(function(response){
        $scope.gyms = response.data;
      });
    }
    setup();

    $scope.addGym = function(employee){
      $http.post('/api/v1/employees.json', employee).success(function(response){
        $scope.message = response.data.message;
        $scope.employees.push(employee);
        $scope.employee = {};
      }).error(function(response){
        $scope.errors = response.errors;
      });
    };

  });
})();
