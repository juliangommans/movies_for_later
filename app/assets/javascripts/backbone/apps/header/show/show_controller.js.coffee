@MoviesForLater.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', ->
        @showView()
      @show @layout

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'show', ->
        @showAccountView(showView)
      @layout.showRegion.show showView

    showAccountView: (view) ->
      showAccountView = @getAccountView()
      view.accountRegion.show showAccountView

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Header

    getAccountView: ->
      new Show.Account
