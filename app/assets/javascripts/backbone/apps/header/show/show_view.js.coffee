@MoviesForLater.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Header extends App.Views.Layout
    template: 'header/show/header'
    regions:
      accountRegion: '#account-options'

  class Show.Account extends App.Views.ItemView
    template: 'header/show/_account_options'

  class Show.Register extends App.Views.ItemView
    template: 'header/show/_register_account'
    triggers:
      'click .sign-up': 'show:user:signup'
      'click .sign-in': 'show:user:signin'

  class Show.Layout extends App.Views.Layout
    template: 'header/show/show_layout'
    regions:
      showRegion: '#show-region'
