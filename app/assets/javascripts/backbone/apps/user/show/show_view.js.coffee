@MoviesForLater.module 'UserApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends App.Views.ItemView
    template: 'user/show/_user'
    ui:
      saved: '#saved-movies'
      watched: '#watched-movies'
    triggers:
      'click @ui.saved': 'show:saved:movies'
      'click @ui.watched': 'show:watched:movies'
    events:
      'click li': 'activateActive'

    activateActive: (args) ->
      $('.active').removeClass('active')
      $(args.currentTarget).addClass('active')


  class Show.UserMovie extends App.Views.ItemView
    template: 'user/show/_movie'
    ui:
      watch: '#watch-movie'
      remove: '#remove-movie'
    triggers:
      'click @ui.watch': 'watch:movie'
      'click @ui.remove': 'remove:movie'

  class Show.UserMovies extends App.Views.CompositeView
  	template: 'user/show/user_movies'
  	childView: Show.UserMovie
  	childViewContainer: '#user-movie-list'

  class Show.Layout extends App.Views.Layout
    template: 'user/show/show_layout'
    regions:
      showRegion: '#user-show-region'
      moviesRegion: '#user-movies-region'
