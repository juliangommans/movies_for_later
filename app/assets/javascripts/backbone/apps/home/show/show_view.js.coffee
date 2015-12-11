@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Home extends App.Views.ItemView
    template: 'home/show/_home'
    ui:
      search: '#search-button'
      save: '#save-button'
    triggers:
      'click @ui.search': 'start:search'
      'click @ui.save': 'save:movies'

  class Show.Show extends App.Views.ItemView
    template: 'home/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'home/show/show_layout'
    regions:
      homeRegion: '#home-region'
