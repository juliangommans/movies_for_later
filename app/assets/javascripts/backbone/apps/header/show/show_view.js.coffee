@MoviesForLater.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Header extends App.Views.ItemView
    template: 'header/show/_header'

  class Show.Show extends App.Views.ItemView
    template: 'header/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'header/show/show_layout'
    regions:
      showRegion: '#show-region'