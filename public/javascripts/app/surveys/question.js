(function() {
  'use strict';
    
  angular.module('app')
    .controller('SurveysQuestionController', function($scope, $modal) {
      $scope.questionTypes = [
        {id: 1, name: 'Multi Choices'},
      	{id: 2, name: 'Single Choice'},
      	{id: 3, name: 'Number'},
      	{id: 4, name: 'Text'},
      	{id: 5, name: 'Multi Choices With Text'},
      	{id: 6, name: 'Single Choice with Text'},
      	{id: 7, name: 'Multi Choices With Number'},
      	{id: 8, name: 'Single Choice with Number'},
      	{id: 9, name: 'Large Text'}
      ];
      
      // $scope.type = $scope.question.type;
    });
}());
