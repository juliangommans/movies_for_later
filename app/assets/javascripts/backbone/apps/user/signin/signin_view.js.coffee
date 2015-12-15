@MoviesForLater.module 'UserApp.Signin', (Signin, App, Backbone, Marionette, $, _) ->

  class Signin.User extends App.Views.ItemView
    template: 'user/signin/_user'

  class Signin.Signin extends App.Views.ItemView
    template: 'user/signin/_signin'

  class Signin.Layout extends App.Views.Layout
    template: 'user/signin/signin_layout'
    regions:
      signinRegion: '#signin-region'