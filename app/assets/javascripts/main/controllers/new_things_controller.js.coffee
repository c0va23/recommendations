angular
.module 'RecommendationsControllers'
.controller 'NewThingsController', class

  @$inject: [ '$scope', 'Thing' ]

  constructor: (@$scope, @Thing) ->
    @bindScope()

  bindScope: =>
    @$scope.save = @saveThing
    @$scope.reset = @resetThing

  saveThing: =>
    @Thing.save @$scope.thing, @resetThing, @errorCallback

  resetThing: =>
    @$scope.thing = new @Thing()
    @$scope.errors_data = null

  errorCallback: (respond) => 
    @$scope.errors_data = respond.data.errors
