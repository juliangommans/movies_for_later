@MoviesForLater.module 'FooterApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Footer extends App.Views.ItemView
    template: 'footer/show/_footer'

  class Show.Show extends App.Views.ItemView
    template: 'footer/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'footer/show/show_layout'
    regions:
      showRegion: '#show-region'