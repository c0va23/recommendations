filters = angular.module('RecommendationsFilters', [])

filters.filter 'scoreValueFormat', ->
  (value) =>
    if value > 0
      'Like'
    else
      'Dislike'
