@MoviesForLater.module 'UserMoviesApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.UserMovies extends App.Views.ItemView
    template: 'user_movies/show/_user_movies'

  class Show.Show extends App.Views.ItemView
    template: 'user_movies/show/_show'

  class Show.Layout extends App.Views.Layout
    template: 'user_movies/show/show_layout'
    regions:
      showRegion: '#show-region'
