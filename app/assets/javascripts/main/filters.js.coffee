filters = angular.module('RecommendationsFilters', [])

filters.filter 'scopeValueFormat', ->
  (value) =>
    if value > 0
      'Like'
    else
      'Dislike'
