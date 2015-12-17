@MoviesForLater.module 'MovieApp', (MovieApp, App, Backbone, Marionette, $, _) ->

  class MovieApp.Router extends Marionette.AppRouter
    appRoutes:
      'movie' : 'show'
      'movie/list' : 'list'

  API =
    show: ->
      new MovieApp.Show.Controller
    list: (options) ->
      new MovieApp.List.Controller options

  App.reqres.setHandler 'movie:show', ->
    App.navigate Routes.movie_path()
    API.show()

  App.commands.setHandler 'movie:list', (options) ->
    API.list(options)

  App.addInitializer ->
    new MovieApp.Router
      controller: API
