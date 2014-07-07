angular
.module 'RecommendationsControllers'
.controller 'CheckedThingsController', class

  @$inject: [ '$scope', 'Thing' ]

  constructor: (@$scope, @Thing) ->
    @$scope.things = @Thing.query(checked: true)
