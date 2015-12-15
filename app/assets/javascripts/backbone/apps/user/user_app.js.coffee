@MoviesForLater.module 'UserApp', (UserApp, App, Backbone, Marionette, $, _) ->

  class UserApp.Router extends Marionette.AppRouter
    appRoutes:
      'user' : 'signup'

  API =
    signup: ->
      new UserApp.Signup.Controller
    signin: ->
      new UserApp.Singin.Controller
    signout: ->
      new UserApp.Singout.Controller
    show: ->
      new UserApp.Show.Controller

  App.reqres.setHandler 'user:show', ->
    App.navigate Routes.user_path()
    API.show()

  App.reqres.setHandler 'user:signout', ->
    API.signout()

  App.reqres.setHandler 'user:signin', ->
    API.signin()

  App.commands.setHandler 'user:signup', ->
    API.signup()

  App.addInitializer ->
    new UserApp.Router
      controller: API