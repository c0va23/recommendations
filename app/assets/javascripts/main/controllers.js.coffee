controllers = angular.module('RecommendationsControllers', []) 

controllers.controller 'ThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query()
  ]

controllers.controller 'RecommendedThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query(recommendations: true)
  ]

controllers.controller 'UncheckedThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query(unchecked: true)
  ]

controllers.controller 'CheckedThingsController', 
  [ '$scope', 'Thing', ($scope, Thing) ->
    $scope.things = Thing.query(checked: true)
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

controllers.controller 'NewThingsController',
  [ '$scope', 'Thing', ($scope, Thing) ->
    errorCallback = (respond) -> $scope.errors_data = respond.data.errors
    $scope.save = -> 
      Thing.save $scope.thing, $scope.reset, errorCallback
    $scope.reset = (event) -> 
      $scope.thing = new Thing()
      $scope.errors_data = null
  ]

controllers.controller 'CommentsController', class CommentsController
  @$inject: [ '$scope', 'Comment', 'dispatcher' ]

  constructor: (@$scope, @Comment, @dispatcher) ->
    @bindScore()
    @resetComment()
    @subscribe()

  bindScore: ->
    @$scope.comments = @Comment.query(@queryParams())
    @$scope.resetComment = @resetComment
    @$scope.saveNewComment = @saveNewComment
    @$scope.$on '$destroy', @unsubscribe

  thingId: => @$scope.thingId
  queryParams: => thingId: @thingId()
  commentsChannelName:  => "things/#{@thingId()}/comments"

  subscribe: =>
    @dispatcher
      .subscribe @commentsChannelName()
      .bind 'new', @addComment
  unsubscribe: => 
    @dispatcher
      .unsubscribe @commentsChannelName()

  addComment: (createdComment) =>
    @$scope.$apply -> 
      @$scope.comments.push createdComment

  resetComment: =>
    @$scope.newComment = new @Comment()
  saveNewComment: =>
    @Comment.save @queryParams(), @$scope.newComment, @resetComment


