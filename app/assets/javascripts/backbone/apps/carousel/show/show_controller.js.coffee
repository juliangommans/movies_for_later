@MoviesForLater.module 'CarouselApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { view, collection } = options

      carouselView = @getCarouselView(collection)
      @listenTo carouselView, 'show', ->
        $($('.carousel-movie-item')[0]).addClass('active')

      view.carouselRegion.show carouselView

    getCarouselView: (collection) ->
      new Show.Carousel collection: collection
