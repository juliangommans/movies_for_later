@MoviesForLater.module 'UserApp.Signout', (Signout, App, Backbone, Marionette, $, _) ->

  class Signout.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @signoutView()
      @show @layout

    getLayout: ->
      new Signout.Layout

    signoutView: ->
      signoutView = @getSignoutView()
      @layout.signoutRegion.show signoutView

    getSignoutView: ->
      new Signout.User