@MoviesForLater.module 'MovieApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser, @movies } = options
      @layout = @getLayout()
      @listenTo @layout, 'show', ->
        @listView()

      App.modalRegion.show @layout

    listView: ->
      listView = @getListView()
      @listenTo listView, 'childview:show:movie:page', (args) ->
        console.log "MODEL AND VIEW", args
        App.execute 'movie:show',
          region: @layout.modal
          movie: args.model
          currentUser: @currentUser
          movies: @movies

      @layout.modal.show listView,
        loading:
          entities: @movies

    getLayout: ->
      new List.Layout

    getListView: ->
      new List.MovieList collection: @movies
