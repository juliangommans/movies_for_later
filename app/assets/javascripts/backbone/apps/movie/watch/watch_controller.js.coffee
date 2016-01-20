@MoviesForLater.module 'MovieApp.Watch', (Watch, App, Backbone, Marionette, $, _) ->

  class Watch.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @movie, @currentUser } = options
      @watchView()

    submitChanges: (args) ->
      model = args.model
      model.set
        post_watch_rating: $('#select-rating').val()
        watched: true
      args.model.save({},
          success: (model, response, options) =>
            console.log "you've watched =>", model
            App.vent.trigger "user:movie:list:change"
            $('#modal').modal 'hide'
            @watch.destroy()
          error: (model, xhr, response) ->
            console.log "ERROR - MOVIE MALFUNKTION", model, xhr, response
          )

    watchView: ->
      @watch = @getWatchView()
      @listenTo @watch, 'submit:movie:changes', @submitChanges
      App.modalRegion.show @watch

    getWatchView: ->
      new Watch.Movie model: @movie
