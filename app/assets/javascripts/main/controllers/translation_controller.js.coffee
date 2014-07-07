angular
.module 'RecommendationsControllers'
.controller 'TranslationController', class

  @$inject: [ '$translate', '$scope', '$rootScope' ]

  constructor: (@$translate, @$scope, @$rootScope) ->
    @bindScope()
    @bindRootScope()

  bindScope: =>
    @$scope.setLocale = @setLocale

  bindRootScope: =>
    @$rootScope.$on '$translateChangeSuccess', @updateCurrentLocale

  updateCurrentLocale: => @$scope.currentLocale = @$translate.use()

  setLocale: (locale) => @$translate.use(locale)
