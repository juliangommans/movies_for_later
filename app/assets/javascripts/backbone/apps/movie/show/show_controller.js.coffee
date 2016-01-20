@MoviesForLater.module 'MovieApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @region, @currentUser, @movie, @movies } = options
      console.log @movie, @region
      @movie.set
        backdrop: @movie.getImageUrl(
          type: 'backdrop'
          size: 'small'
          )
        poster: @movie.getImageUrl(
          type: 'poster'
          size: 'medium'
          )
      @showView()

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'go:back', @back
      @listenTo showView, 'save:user:movie', (args) ->
        @saveUserMovie(args)

      @region.show showView,
        loading:
          entities: @movie

    saveUserMovie: (params) ->
      userMovie = App.request 'new:user_movie:entity'
      App.execute "when:fetched", userMovie, =>
        params['user_id'] = @currentUser.id
        params['api_id'] = @movie.get('id')
        userMovie.set user_movie: params
        userMovie.save({},
          success: (model, response, options) =>
            console.log "you saved the movie", model, response, options
            @back()
            App.vent.trigger 'user:movie:list:change'
          error: (model, xhr, response) ->
            console.log "ERROR - MOVIE MALFUNKTION", model, xhr, response
          )

    back: ->
      if @movies?
        App.execute 'movie:list',
          movies: @movies
          currentUser: @currentUser
      else
        App.execute 'user:show'


    getShowView: ->
      new Show.Movie model: @movie
