(function () {
  "use strict";

  angular.module("gymmedUp").controller("gymmedUpCtlr", function($scope, $http) {
    window.$scope = $scope;
    $scope.message = "We in the controller!";
  });
})();
