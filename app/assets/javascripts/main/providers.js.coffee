providers = angular.module('RecommendationsProviders', [])

providers.provider 'dispatcher', ->
  path = location.host + '/websocket'

  $get: -> new WebSocketRails(path)
  setPath: (newPath) -> path = newPath
