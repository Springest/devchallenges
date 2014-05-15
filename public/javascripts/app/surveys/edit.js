(function() {
  'use strict';
  
  angular.module('app')
    .controller('SurveysEditController', function($rootScope, $scope, $location, $modal, $resource, $http, $timeout) {
            
      $scope.saveSurvey = function() {
        var postData = "utf8="+encodeURIComponent('✓')+"&_method=patch&authenticity_token=" + encodeURIComponent($rootScope.authToken);
        
        ['name', 'description', 'attempts_number', 'finished', 'active', 'locale_name', 'locale_description'].forEach(function(key, index) {
          var v = $scope.survey[key];
          
          if (typeof v === 'boolean') v = (v === true ? '1' : '0');
          
          postData += "&survey_survey["+key+"]="+encodeURIComponent(v);
        });
        
        $http({
          method: 'POST',
          url: '../' + $scope.survey.id + '.json',
          headers: {
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          data: postData
        }).success(function(data, status) {
          
          $rootScope.showFlash = true;
          $rootScope.flash = {
            message: 'Success!',
            type: 'alert-success'
          }
                    
        }).error(function(data, status) {
          $rootScope.showFlash = true;
          $rootScope.flash = {
            message: 'Something went wrong!',
            type: 'alert-danger'
          }
        });
        
        //return false;
        // var SurveyEdit = $resource('../:id', {}, {
        //   update: {method: 'POST'}
        // });
        // 
        // var edit = SurveyEdit.update({id: surveyId}, {_method: 'patch', utf8: '✓', authenticity_token: $rootScope.authToken, survey_survey: uSurvey}, function () {
        //   console.log(edit);
        // });
      }
      
      $scope.sectionAdd = function() {

      };

      $scope.sectionEdit = function(id) {
        $location.url('/section/' + id);
      };

      $scope.sectionDelete = function(id) {
        
        $scope.alert = {
          name: 'Are you sure?',
          description: 'You are about to delete a section. Are you sure?',
          cancel: 'No, thank you!',
          confirm: 'Yes, i\'m sure!'
        };
                
        var modal = $modal.open({
          templateUrl: '/javascripts/app/alert.html',
          scope: $scope
        });
        
        $scope.alertCancel = function() {
          modal.dismiss('cancel');
        };
        
        $scope.alertConfirm = function() {
          deleteSection(id, function(err, survey) {
            surveyResult(err, survey);
                        
            modal.close();
          });
          

        };
      };
      
      function surveyResult(err, survey) {
        if (err) {
          $scope.error = err;
          return;
        }
        
        $scope.error = null;
        $scope.survey = survey;
      }
      
      function init() {
        // $scope.survey = null;
        var Survey = $resource('./edit.json');
        var survey = Survey.get({}, function () {
          $scope.survey = survey;
        });
      }

      init();
    });

}());
