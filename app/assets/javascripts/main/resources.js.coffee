resources = angular.module('RecommendationsResources', [ 'ngResource' ])

resources.factory 'Thing', [ '$resource', ($resource) ->
  $resource('/api/things/:thingId.json')
]

resources.factory 'Score', [ '$resource', ($resource) ->
  $resource('/api/scores/:scoreId.json', {}, { update: { method: 'PATCH' } })
]
