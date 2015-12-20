@MoviesForLater.module 'UserApp', (UserApp, App, Backbone, Marionette, $, _) ->

  class UserApp.Router extends Marionette.AppRouter
    appRoutes:
      'user/signup' : 'signup'
      'user/sign_in': 'signin'
      'user': 'show'

  API =
    signup: ->
      new UserApp.Signup.Controller
    signin: ->
      new UserApp.Signin.Controller
    signout: ->
      new UserApp.Singout.Controller
    show: (options) ->
      new UserApp.Show.Controller options

  App.commands.setHandler 'user:show', (options)->
    App.navigate Routes.user_path()
    API.show(options)

  App.commands.setHandler 'user:signout', ->
    API.signout()

  App.commands.setHandler 'user:signin', ->
    API.signin()

  App.commands.setHandler 'user:signup', ->
    API.signup()

  App.addInitializer ->
    new UserApp.Router
      controller: API
