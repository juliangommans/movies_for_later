@MoviesForLater.module 'CarouselApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Movie extends App.Views.ItemView
    template: 'carousel/show/_movie'
    className: 'item carousel-movie-item'
    # triggers:
    #   'click .carousel-images': 'load:carousel:movie'

  class Show.Carousel extends App.Views.CompositeView
    template: 'carousel/show/show_carousel'
    childView: Show.Movie
    childViewContainer: '.item-wrapper'

