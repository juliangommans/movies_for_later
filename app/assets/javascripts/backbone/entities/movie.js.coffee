@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.LocalMovie extends App.Entities.Model
    urlRoot: -> Routes.movies_path()

  class Entities.LocalMovieCollection extends App.Entities.Collection
    model: Entities.LocalMovie
    url: -> Routes.movies_path()

  class Entities.ExternalMovie extends App.Entities.Model

  class Entities.ExternalMovieCollection extends App.Entities.Collection
    model: Entities.ExternalMovie

    parse: (resp) ->
      resp.results

  API =
    getLocalMovies: (options) ->
      console.log "options??", options
      movies = new Entities.LocalMovieCollection
      movies.fetch
        data: options
        reset: true
      console.log movies
      movies
    getLocalMovie: (id) ->
      movie = new Entities.LocalMovie
        id: id
      movie.fetch()
      movie
    newMovie: ->
      new Entities.LocalMovie

    getExternalMovies: (params = {}) ->
      _.defaults params,
        api_key: '911a1b0e5f364d5b2a864cddca1f1cb3'
        page: 1

      movies = new Entities.ExternalMovieCollection
      movies.url = "http://api.themoviedb.org/3/#{params.url}?"
      delete params.url
      movies.fetch
        reset: true
        data: params
      movies

  App.reqres.setHandler 'movie:entities', (options) ->
    API.getLocalMovies(options)

  App.reqres.setHandler 'movie:entity', (id) ->
    API.getLocalMovie(id)

  App.reqres.setHandler 'new:movie:entity', ->
    API.newMovie()

  App.reqres.setHandler 'external:movie:entities', (params) ->
    API.getExternalMovies(params)
