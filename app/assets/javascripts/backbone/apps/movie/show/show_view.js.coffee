@MoviesForLater.module 'MovieApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Movie extends App.Views.ItemView
    template: 'movie/show/_movie'
    ui:
      cancel: '.cancel-button'
      back: '.back-button'
      submit: '.submit-button'
      form: '#user-movie-form'
    events:
      'click @ui.cancel': 'hideModal'
      'click @ui.back': 'hideModal'
      'click @ui.submit': 'saveUserMovie'
    triggers:
      'click @ui.back': 'go:back'

    saveUserMovie: ->
      data =
        pre_watch_rating: $('#select-rating').val()
        comment: $('#comment').val()
      @trigger('save:user:movie', data)


