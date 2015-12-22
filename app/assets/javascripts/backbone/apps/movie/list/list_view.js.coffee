@MoviesForLater.module 'MovieApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Movie extends App.Views.ItemView
    template: 'movie/list/_movie'
    className: 'movie-list-items'
    ui:
      movie: '.movie-popover-box'
    events:
      'mouseenter @ui.movie': 'showData'
      'mouseleave @ui.movie': 'hideData'
    triggers:
      'click @ui.movie': 'show:movie:page'

  class List.MovieList extends App.Views.CompositeView
    template: 'movie/list/list'
    childView: List.Movie
    childViewContainer: '#movie-list'
    ui:
      cancel: '.cancel-button'
      user: '.user-show-button'
    events:
      'click @ui.cancel': 'hideModal'
    triggers:
      'click @ui.user': 'show:user:page'

  class List.Layout extends App.Views.ModalLayout
    template: 'movie/list/layout'
    regions:
      modal: '#movie-modal-region'
