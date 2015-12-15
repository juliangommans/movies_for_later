@MoviesForLater.module 'UserApp.Signin', (Signin, App, Backbone, Marionette, $, _) ->

  class Signin.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @signinView()
      @show @layout

    getLayout: ->
      new Signin.Layout

    signinView: ->
      signinView = @getSigninView()
      @layout.signinRegion.show signinView

    getSigninView: ->
      new Signin.User