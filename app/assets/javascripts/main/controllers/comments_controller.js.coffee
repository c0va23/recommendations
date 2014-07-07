angular
.module 'RecommendationsControllers'
.controller 'CommentsController', class
  @$inject: [ '$scope', 'Comment', 'dispatcher' ]

  constructor: (@$scope, @Comment, @dispatcher) ->
    @bindScope()
    @resetComment()
    @subscribe()

  bindScope: ->
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
    @$scope.$apply =>
      @$scope.comments.push createdComment

  resetComment: =>
    @$scope.newComment = new @Comment()
  saveNewComment: =>
    @Comment.save @queryParams(), @$scope.newComment, @resetComment
