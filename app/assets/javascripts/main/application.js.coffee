#= require angular
#= require angular-route
#= require_tree .
#= require_self

app = angular.module('RecommendationsApplication', ['ngRoute', 'RecommendationsControllers'])

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/things', controller: 'ThingsController', templateUrl: '/assets/things/index.html'
    .when '/things/:thingId', controller: 'ThingController', templateUrl: '/assets/things/show.html'
    .otherwise redirectTo: '/things'
]
