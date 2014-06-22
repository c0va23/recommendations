resources = angular.module('RecommendationsResources', [ 'ngResource' ])

resources.factory 'Thing', [ '$resource', ($resource) ->
  $resource('/api/things/:thingId.json')
]

resources.factory 'Score', [ '$resource', ($resource) ->
  $resource('/api/things/:thingId/score.json', {}, { update: { method: 'PATCH' } })
]

resources.factory 'Comment', [ '$resource', ($resource) ->
  $resource('/api/things/:thingId/comments.json')
]
