controllers = angular.module('RecommendationsControllers', []) 

controllers.controller 'ThingsController', ($scope, $http) ->
  $http.get('/api/things.json').success (data) ->
    $scope.things = data
