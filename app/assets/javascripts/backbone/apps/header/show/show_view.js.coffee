@MoviesForLater.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Header extends App.Views.Layout
    template: 'header/show/_header'
    regions:
      accountRegion: '#account-options'

  class Show.Account extends App.Views.ItemView
    template: 'header/show/_account_options'
    triggers:
      'click .sign-up': 'show:user:signup'

  class Show.Layout extends App.Views.Layout
    template: 'header/show/show_layout'
    regions:
      showRegion: '#show-region'
