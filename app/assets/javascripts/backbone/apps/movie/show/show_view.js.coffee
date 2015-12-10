@MoviesForLater.module 'MovieApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Movie extends App.Views.ItemView
    template: 'movie/show/_movie'

  class Show.Show extends App.Views.ItemView
    template: 'movie/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'movie/show/show_layout'
    regions:
      showRegion: '#show-region'