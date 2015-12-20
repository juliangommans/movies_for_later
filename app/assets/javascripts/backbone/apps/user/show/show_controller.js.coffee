@MoviesForLater.module 'UserApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser } = options

      @currentUser or= App.request 'user:entity'

      movies = new Backbone.Collection @currentUser.get('movies')
      console.log "movies", movies
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @showMovies(movies)
        @showView()
      @show @layout,
        loading:
          entities: @currentUser

    showView: ->
      showView = @getShowView()
      @layout.showRegion.show showView

    showMovies: (movies) ->
      showMoviesView = @getMoviesView(movies)

      @layout.moviesRegion.show showMoviesView

    getMoviesView: (movies) ->
      new Show.UserMovies collection: movies

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.User model: @currentUser