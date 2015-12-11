@MoviesForLater.module 'MovieApp', (MovieApp, App, Backbone, Marionette, $, _) ->

  class MovieApp.Router extends Marionette.AppRouter
    appRoutes:
      'movie' : 'show'

  API =
    show: ->
      new MovieApp.Show.Controller

  App.reqres.setHandler 'movie:show', ->
    App.navigate Routes.movie_path()
    API.show()

  App.addInitializer ->
    new MovieApp.Router
      controller: API