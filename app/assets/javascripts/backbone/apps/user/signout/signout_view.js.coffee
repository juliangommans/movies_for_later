@MoviesForLater.module 'UserApp.Signout', (Signout, App, Backbone, Marionette, $, _) ->

  class Signout.User extends App.Views.ItemView
    template: 'user/signout/_user'

  class Signout.Signout extends App.Views.ItemView
    template: 'user/signout/_signout'

  class Signout.Layout extends App.Views.Layout
    template: 'user/signout/signout_layout'
    regions:
      signoutRegion: '#signout-region'