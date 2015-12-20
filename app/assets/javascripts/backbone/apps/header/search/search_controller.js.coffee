@MoviesForLater.module 'HeaderApp.Search', (Search, App, Backbone, Marionette, $, _) ->

  class Search.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser, @region } = options
      @searchView()

    searchView: ->
      searchView = @getSearchView()
      @listenTo searchView, 'start:search', @search
      @listenTo searchView, 'get:upcoming', @getUpcoming
      @region.show searchView

    saveMoviesToDb: ->
      @results.each( (movie) ->
        newMovie = App.request 'new:movie:entity'
        newMovie.filterMovieData(movie)
        newMovie.save()
        )

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
        @saveMoviesToDb()

    getSearchView: ->
      new Search.SearchBox

#### THIS IS HERE INCASE CORS FUCKS US AGAIN

    # search: ->
    #   query = $('#search-box').val()
    #   $.ajax
    #     type: 'GET'
    #     url: "http://api.themoviedb.org/3/search/movie?api_key=911a1b0e5f364d5b2a864cddca1f1cb3&query=#{$('#search-box').val()}"
    #     dataType: 'jsonp'
    #     async: true
    #     crossDomain: true
    #     success: (data) =>
    #       console.log "results are", data
    #       @results = data.results
    #       console.log "results", @results
    #       @saveMoviesToDb()
    #     error: (a,b,c) ->
    #       console.log "ERROR are", a,b,c

    # saveMoviesToDb: ->
    #   _.each(@results, (result) ->
    #     newMovie = App.request 'new:movie:entity'
    #     result['api_id'] = result.id
    #     delete result.id
    #     console.log "this result is", result
    #     newMovie.set result
    #     console.log "MOVIE MODEL", newMovie
    #     newMovie.save()
    #     )
