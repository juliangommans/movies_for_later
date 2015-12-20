@MoviesForLater.module 'HeaderApp.Search', (Search, App, Backbone, Marionette, $, _) ->

  class Search.SearchBox extends App.Views.ItemView
    template: 'header/search/_search_box'
    className: 'search-box-wrapper'
    ui:
      search: '#search-button'
      upcoming: '#upcoming-button'
    triggers:
      'click @ui.search': 'start:search'
      'click @ui.upcoming': 'get:upcoming'
