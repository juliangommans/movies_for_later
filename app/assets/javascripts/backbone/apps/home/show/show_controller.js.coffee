@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @showView()
      @show @layout

    getLayout: ->
      new Show.Layout

    showView: ->
      showView = @getShowView()

      @listenTo showView, 'start:search', (args) ->
        console.log "ARGS and VIEW", args

      @layout.showRegion.show showView

    getShowView: ->
      new Show.Home
