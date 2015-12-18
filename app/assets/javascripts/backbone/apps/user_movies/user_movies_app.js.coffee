@MoviesForLater.module 'UserMoviesApp', (UserMoviesApp, App, Backbone, Marionette, $, _) ->

  class UserMoviesApp.Router extends Marionette.AppRouter
    appRoutes:
      'user_movies' : 'show'

  API =
    show: ->
      new UserMoviesApp.Show.Controller

  App.reqres.setHandler 'user_movies:show', ->
    App.navigate Routes.user_movies_path()
    API.show()

  App.addInitializer ->
    new UserMoviesApp.Router
      controller: API
