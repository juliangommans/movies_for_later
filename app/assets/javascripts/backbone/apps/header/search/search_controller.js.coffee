@MoviesForLater.module 'HeaderApp.Search', (Search, App, Backbone, Marionette, $, _) ->

  class Search.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser, @region } = options
      @searchView()

    searchView: ->
      searchView = @getSearchView()
      @listenTo searchView, 'start:search', @search

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
        @saveMoviesToDb()
        if options?
          @results.each((result) ->
            result.set context: 'upcoming'
            )

    getSearchView: ->
      new Search.SearchBox
