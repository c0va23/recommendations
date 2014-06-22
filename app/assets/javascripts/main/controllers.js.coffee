controllers = angular.module('RecommendationsControllers', []) 

controllers.controller 'ThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query()
  ]

controllers.controller 'ThingController', 
  [ '$scope','$routeParams', 'Thing', ($scope, $routeParams, Thing) ->
    $scope.thingId = $routeParams.thingId
    $scope.thing = Thing.get(thingId: $scope.thingId)
  ]

controllers.controller 'ScoreWidgetController',
  [ '$scope', 'Score', ($scope, Score) ->
    $scope.score = Score.get(thingId: $scope.thingId)

    $scope.setValue = (newValue) ->
      if newValue != $scope.score.value
        $scope.score.value = newValue
        $scope.score.$update(thingId: $scope.thingId)
  ]
