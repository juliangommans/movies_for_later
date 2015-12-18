@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      upcoming = App.request 'movie:entities', context: 'upcoming'


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
      @listenTo showView, 'get:upcoming', @getUpcoming
      @layout.homeRegion.show showView

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Home
