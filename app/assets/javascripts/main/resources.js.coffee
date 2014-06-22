resources = angular.module('RecommendationsResources', [ 'ngResource' ])

resources.factory 'Thing', [ '$resource', ($resource) ->
  $resource('/api/things/:thingId.json')
]
