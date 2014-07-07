angular
.module 'RecommendationsControllers'
.controller 'RecommendedThingsController', class

  @$inject: [ '$scope', 'Thing' ]

  constructor: (@$scope, @Thing) ->
    @$scope.things = @Thing.query(recommendations: true)
