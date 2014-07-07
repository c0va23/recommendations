angular
.module 'RecommendationsControllers'
.controller 'UncheckedThingsController', class

  @$inject: [ '$scope', 'Thing' ]

  constructor: (@$scope, @Thing) ->
    @$scope.things = @Thing.query(unchecked: true)
