@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @showView()
      @show @layout

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'start:search', @search
      @listenTo showView, 'save:movies', @saveMoviesToDb

      @layout.showRegion.show showView

    saveMoviesToDb: ->
      @results.each( (movie) ->
        newMovie = App.request 'new:movie:entity'
        newMovie.filterMovieData(movie)
        newMovie.save()
        )

    search: ->
      query = $('#search-box').val()
      params =
        url: 'search/movie'
        query: query

      console.log "query and params", query, params

      @results = App.request 'external:movie:entities', params

      App.execute "when:fetched", @results, =>
        console.log "results IS NOW +++>", @results

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Home
