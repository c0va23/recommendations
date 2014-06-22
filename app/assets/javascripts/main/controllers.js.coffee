controllers = angular.module('RecommendationsControllers', []) 

controllers.controller 'ThingsController', ($scope, $http) ->
  $http.get('/api/things.json').success (data) ->
    $scope.things = data

controllers.controller 'ThingController', ($scope, $http, $routeParams) ->
  $http.get("/api/things/#{$routeParams.thingId}.json").success (data) ->
    $scope.thing = data
