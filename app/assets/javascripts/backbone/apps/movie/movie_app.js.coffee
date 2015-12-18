@MoviesForLater.module 'MovieApp', (MovieApp, App, Backbone, Marionette, $, _) ->

  class MovieApp.Router extends Marionette.AppRouter
    appRoutes:
      'movie' : 'show'
      'movie/list' : 'list'

  API =
    show: (options) ->
      new MovieApp.Show.Controller options
    list: (options) ->
      new MovieApp.List.Controller options

  App.commands.setHandler 'movie:show', (options) ->
    API.show(options)

  App.commands.setHandler 'movie:list', (options) ->
    API.list(options)

  App.addInitializer ->
    new MovieApp.Router
      controller: API
