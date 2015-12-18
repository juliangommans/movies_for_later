@MoviesForLater.module 'CarouselApp', (CarouselApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: (options) ->
      new CarouselApp.Show.Controller options

  App.reqres.setHandler 'show:carousel:show', (options) ->
    API.show(options)
