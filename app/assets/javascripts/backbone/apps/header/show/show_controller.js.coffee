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
      @listenTo showAccountView, 'show:user:signup', ->
        console.log "YOU CLICKED SIGN UP"
        App.execute 'user:signup'

      view.accountRegion.show showAccountView

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Header

    getAccountView: ->
      new Show.Account
