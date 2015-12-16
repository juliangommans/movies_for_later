@MoviesForLater.module 'UserApp', (UserApp, App, Backbone, Marionette, $, _) ->

  class UserApp.Router extends Marionette.AppRouter
    appRoutes:
      'user' : 'signup'
      'user/sign_in': 'signin'

  API =
    signup: ->
      new UserApp.Signup.Controller
    signin: ->
      new UserApp.Signin.Controller
    signout: ->
      new UserApp.Singout.Controller
    show: ->
      new UserApp.Show.Controller

  App.commands.setHandler 'user:show', ->
    App.navigate Routes.user_path()
    API.show()

  App.commands.setHandler 'user:signout', ->
    API.signout()

  App.commands.setHandler 'user:signin', ->
    API.signin()

  App.commands.setHandler 'user:signup', ->
    API.signup()

  App.addInitializer ->
    new UserApp.Router
      controller: API
