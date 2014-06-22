#= require angular
#= require angular-route
#= require angular-resource
#= require_tree .
#= require_self

app = angular.module 'RecommendationsApplication', [
  'ngRoute',
  'RecommendationsControllers',
  'RecommendationsResources',
  'RecommendationsFilters',
  'RecommendationsDirectives',
]

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/things', controller: 'ThingsController', templateUrl: '/assets/things/index.html'
    .when '/things/recommendations', controller: 'ThingRecommendationsController', templateUrl: '/assets/things/recommendations.html'
    .when '/things/:thingId', controller: 'ThingController', templateUrl: '/assets/things/show.html'
    .when '/scores', controller: 'ScoresController', templateUrl: '/assets/scores/index.html'
    .when '/scores/:scopeId', controller: 'ScoreController', templateUrl: '/assets/scores/show.html'
    .otherwise redirectTo: '/things'
]

app.run [ '$http', ($http) -> 
  token = document.querySelector('meta[name=csrf-token]').content
  $http.defaults.headers.common['X-Csrf-Token'] = token
]
