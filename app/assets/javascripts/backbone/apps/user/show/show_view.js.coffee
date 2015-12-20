@MoviesForLater.module 'UserApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends App.Views.ItemView
    template: 'user/show/_user'

  class Show.UserMovie extends App.Views.ItemView
  	template: 'user/show/_movie'

  class Show.UserMovies extends App.Views.CompositeView
  	template: 'user/show/user_movies'
  	childView: Show.UserMovie
  	childViewContainer: '#user-movie-list'

  class Show.Layout extends App.Views.Layout
    template: 'user/show/show_layout'
    regions:
      showRegion: '#user-show-region'
      moviesRegion: '#user-movies-region'