@MoviesForLater.module 'MovieApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser, @movies } = options
      @movies.fetch
      console.log "List options", options

      @layout = @getLayout()
      @listenTo @layout, 'show', ->
        @listView()
      App.modalRegion.show @layout



    listView: ->
      listView = @getListView()

      @layout.modal.show listView,
        loading:
          entities: @movies

    getLayout: ->
      new List.Layout

    getListView: ->
      new List.MovieList collection: @movies
