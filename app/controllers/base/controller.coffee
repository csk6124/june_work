SiteView = require 'views/site-view'
HeaderView = require 'views/header-view'
Navigation = require 'models/navigation'
NavigationView = require 'views/navigation-view'

module.exports = class Controller extends Chaplin.Controller
  beforeAction: (params, route) ->
    @compose 'site', SiteView
    @compose 'header', HeaderView

    if route.name in ['users#show', 'repos#show', 'topics#show']
      @compose 'navigation', ->
        @model = new Navigation
        @view = new NavigationView {@model}
