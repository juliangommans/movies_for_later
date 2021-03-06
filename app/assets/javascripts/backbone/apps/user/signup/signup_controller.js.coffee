@MoviesForLater.module 'UserApp.Signup', (Signup, App, Backbone, Marionette, $, _) ->

  class Signup.Controller extends App.Controllers.Base

    initialize: ->
      newUser = App.request 'new:user:entity'

      App.execute 'when:fetched', newUser, =>

        signupView = @getSignupView(newUser)
        @listenTo signupView, 'sign:in:user', ->
          App.execute 'user:signin'

        App.modalRegion.show signupView

    getSignupView: (newUser) ->
      new Signup.User model: newUser
