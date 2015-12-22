@MoviesForLater.module 'MovieApp.Watch', (Watch, App, Backbone, Marionette, $, _) ->

  class Watch.Movie extends App.Views.ModalView
    template: 'movie/watch/_movie'
    ui:
      submit: '.submit-button'
      cancel: '.cancel-button'
    events:
      'click @ui.cancel': 'hideModal'
    triggers:
      'click @ui.submit': 'submit:movie:changes'
