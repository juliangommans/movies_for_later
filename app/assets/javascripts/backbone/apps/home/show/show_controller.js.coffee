@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      upcoming = App.request 'movie:entities', context: 'upcoming'
      @currentUser = App.request 'user:entity'
      console.log "users deeeets", @currentUser

      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @showView()
        App.request "show:carousel:show",
          view: @layout
          collection: upcoming

      @show @layout,
        loading:
          entities: upcoming

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'start:search', @search
      @listenTo showView, 'save:movies', @saveMoviesToDb
      @listenTo showView, 'get:upcoming', @getUpcoming
      @listenTo showView, 'save:user:movie', @saveUserMovie
      @layout.homeRegion.show showView

    saveMoviesToDb: ->
      @results.each( (movie) ->
        newMovie = App.request 'new:movie:entity'
        newMovie.filterMovieData(movie)
        newMovie.save()
        )

    saveUserMovie: ->
      movie = @results.models[0]
      newMovie = App.request 'new:movie:entity'
      newMovie.filterMovieData(movie)
      newMovie.save()

      userMovie = App.request 'new:user_movie:entity'
      App.execute "when:fetched", userMovie, =>
        if newMovie.id?
          params =
            movie_id: newMovie.id
        else
          params =
            api_id: newMovie.get('api_id')
        params['user_id'] = @currentUser.id
        userMovie.set user_movie: params
        console.log "USER MOVIE", userMovie
        userMovie.save()

    getUpcoming: ->
      params =
        url: 'movie/upcoming'

      @fetchMovies(params, 'upcoming')

    search: ->
      query = $('#search-box').val()
      params =
        url: 'search/movie'
        query: query

      @fetchMovies(params)

    fetchMovies: (params, options) ->
      @results = App.request 'external:movie:entities', params
      App.execute 'movie:list',
        movies: @results
        currentUser: @currentUser


      App.execute "when:fetched", @results, =>
        if options?
          @results.each((result) ->
            result.set context: 'upcoming'
            )
          console.log 'results', @results

        test = @results.models[0].getImageUrl(type: "backdrop", size: "medium")
        $('.img-test').append("<img src=#{test}></img>")

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Home
