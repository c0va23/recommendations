controllers = angular.module('RecommendationsControllers', []) 

controllers.controller 'ThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query()
  ]

controllers.controller 'ThingController', 
  [ '$scope','$routeParams', 'Thing', ($scope, $routeParams, Thing) ->
    $scope.thing = Thing.get(thingId: $routeParams.thingId)
  ]

controllers.controller 'ScoresController',
  [ '$scope', 'Score', ($scope, Score) ->
    $scope.scores = Score.query()
  ]

controllers.controller 'ScoreController',
  [ '$scope', 'Score', '$routeParams', ($scope, Score, $routeParams) ->
    $scope.score = Score.get(scoreId: $routeParams.scopeId)
  ]
