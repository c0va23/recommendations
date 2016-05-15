angular
.module 'RecommendationsControllers'
.controller 'ThingController', class

  @$inject: [ '$scope','$routeParams', 'Thing' ]

  constructor: (@$scope, @$routeParams, @Thing) ->
    @$scope.thingId = @$routeParams.thingId
    @$scope.thing = @Thing.get(thingId: @$scope.thingId)
