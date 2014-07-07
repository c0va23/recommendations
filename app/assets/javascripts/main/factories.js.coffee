factories = angular.module('RecommendationsFactories', [])

factories.factory 'TranslationLoader', [ '$q', '$http', ($q, $http) ->

  (options) =>
    deffered = $q.defer()

    if options.localePaths[options.key]
      $http
        .get options.localePaths[options.key]
        .success deffered.resolve
        .error deffered.reject
    else
      deffered.reject options.key

    deffered.promise
]
