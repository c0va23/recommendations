angular
.module 'RecommendationsControllers'
.controller 'ThingsController', class
  @$inject: [ '$scope', 'Thing' ]
  
  constructor: (@$scope, @Thing) ->
    @$scope.things = @Thing.query()
