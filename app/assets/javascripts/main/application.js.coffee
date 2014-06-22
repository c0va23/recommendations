#= require angular
#= require angular-route
#= require angular-resource
#= require_tree .
#= require_self

app = angular.module('RecommendationsApplication', ['ngRoute', 'RecommendationsControllers', 'RecommendationsResources'])

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/things', controller: 'ThingsController', templateUrl: '/assets/things/index.html'
    .when '/things/:thingId', controller: 'ThingController', templateUrl: '/assets/things/show.html'
    .when '/scores', controller: 'ScoresController', templateUrl: '/assets/scores/index.html'
    .otherwise redirectTo: '/things'
]
