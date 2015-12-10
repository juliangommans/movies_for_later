@MoviesForLater.module 'HomeApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Home extends App.Views.ItemView
    template: 'home/show/_home'
    ui:
      search: '#search-button'
    events:
      'click @ui.search': 'beginSearch'

    beginSearch: (args,view) ->
      console.log "args and view?", args, view

  class Show.Show extends App.Views.ItemView
    template: 'home/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'home/show/show_layout'
    regions:
      showRegion: '#show-region'
