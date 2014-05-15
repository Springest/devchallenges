(function() {
  'use strict';

  angular.module('app', [
    'ngRoute',
    'ngResource',
    'ui.bootstrap',
    'directives.in-place'
  ])
    .config(['$routeProvider',
      function($routeProvider) {

        $routeProvider
          .when('/', {
            templateUrl: '/javascripts/app/surveys/edit.html',
            controller: 'SurveysEditController'
          })
          .when('/section/:id', {
            templateUrl: '/javascripts/app/surveys/section.html',
            controller: 'SurveysEditSectionController',
            resolve: {
              section: function($q, $http, $route) {
                var deferred = $q.defer();

                $http({
                  method: 'GET',
                  url: '/admin/survey_sections/' + $route.current.params.id + '.json'
                })
                  .success(function(data) {
                    deferred.resolve(data);
                  })
                  .error(function(data) {
                    deferred.resolve({
                      error: 'Not found'
                    });
                  });

                return deferred.promise;
              }
            }
          })
          .otherwise({
            redirect: '/'
          });
      }
    ])
    .config(['$resourceProvider',
      function($resourceProvider) {

      }
    ])
    .controller('AppController', function($rootScope) {
      $rootScope.flash = {
        message: 'Success!',
        type: 'alert-nothing'
      }
      $rootScope.showFlash = false;
    });

}());
