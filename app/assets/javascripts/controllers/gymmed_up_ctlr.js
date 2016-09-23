(function () {
  "use strict";

  angular.module("gymmed_up").controller("gymmed_up_ctlr", function($scope) {
    function setup() {
      $http.get('/api/v1/employees.json').then(function(response){
        $scope.gyms = response.data;
      });
    }
    setup();
  });
})();
