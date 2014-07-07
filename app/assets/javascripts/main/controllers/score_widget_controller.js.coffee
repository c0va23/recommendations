angular
.module 'RecommendationsControllers'
.controller 'ScoreWidgetController', class

  @$inject: [ '$scope', 'Score' ]

  constructor: (@$scope, @Score) ->
    @$scope.score = @Score.get(thingId: @thingId())
    @$scope.setValue = @setValue

  thingId: => @$scope.thingId

  setValue: (newValue) =>
    if newValue != @$scope.score.value
      @$scope.score.value = newValue
      @$scope.score.$update(thingId: @thingId())
