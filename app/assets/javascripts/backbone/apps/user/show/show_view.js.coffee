@MoviesForLater.module 'UserApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends App.Views.ItemView
    template: 'user/show/_user'

  class Show.Show extends App.Views.ItemView
    template: 'user/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'user/show/show_layout'
    regions:
      showRegion: '#show-region'