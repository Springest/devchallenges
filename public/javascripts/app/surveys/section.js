(function() {
  'use strict';

  angular.module('app')
    .controller('SurveysEditSectionController', function($scope, section) {
      $scope.section = section;
    });
      
}());
