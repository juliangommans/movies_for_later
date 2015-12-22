@MoviesForLater.module 'MovieApp.Watch', (Watch, App, Backbone, Marionette, $, _) ->

  class Watch.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @movie, @currentUser } = options
      @watchView()

    submitChanges: (args) ->
      console.log "args?", args
      args.model.save()

    watchView: ->
      watchView = @getWatchView()
      @listenTo watchView, 'submit:movie:changes', @submitChanges

      App.modalRegion.show watchView

    getWatchView: ->
      new Watch.Movie model: @movie
