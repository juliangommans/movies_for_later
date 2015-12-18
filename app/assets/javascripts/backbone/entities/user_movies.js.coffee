@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.UserMovie extends App.Entities.Model
    urlRoot: -> Routes.user_movies_path()

  class Entities.UserMoviesCollection extends App.Entities.Collection
    model: Entities.User_movies
    url: -> Routes.user_movies_path()

  API =
    getUserMovies: ->
      user_moviess = new Entities.UserMoviesCollection
      user_moviess.fetch
        reset: true
      user_moviess
    getUserMovie: (id) ->
      user_movies = new Entities.UserMovie
        id: id
      user_movies.fetch()
      user_movies
    newUserMovie: ->
      new Entities.UserMovie

  App.reqres.setHandler 'user_movies:entities', ->
    API.getUserMovies()

  App.reqres.setHandler 'user_movie:entity', (id) ->
    API.getUserMovie id

  App.reqres.setHandler 'new:user_movie:entity', ->
    API.newUserMovie()
