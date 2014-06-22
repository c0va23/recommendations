directives = angular.module('RecommendationsDirectives', [])

directives.directive 'wgScore', ->
  templateUrl: 'assets/widgets/score.html'
  scope: { thingId: '=thingId' }

directives.directive 'wgComments', ->
  templateUrl: 'assets/widgets/comments.html'
  scope: { thingId: '=thingId' }
