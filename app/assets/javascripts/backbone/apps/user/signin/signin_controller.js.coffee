@MoviesForLater.module 'UserApp.Signin', (Signin, App, Backbone, Marionette, $, _) ->

  class Signin.Controller extends App.Controllers.Base

    initialize: ->
      console.log 'we are in the controller'
      session = App.request 'user:session:entity'
      App.execute 'when:fetched', session, =>
        signinView = @getSigninView(session)
        console.log "we have a session?", session

        App.modalRegion.show signinView

    getSigninView: (session) ->
      new Signin.User model: session
