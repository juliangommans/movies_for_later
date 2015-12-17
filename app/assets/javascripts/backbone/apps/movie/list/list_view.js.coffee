@MoviesForLater.module 'MovieApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Movie extends App.Views.ItemView
    template: 'movie/list/_movie'
    className: 'movie-list-items'

  class List.MovieList extends App.Views.CompositeView
    template: 'movie/list/list'
    childView: List.Movie
    childViewContainer: '#movie-list'

  class List.Layout extends App.Views.ModalLayout
    template: 'movie/list/layout'
    regions:
      modal: '#movie-modal-region'
