@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends App.Entities.Model
    urlRoot: -> Routes.header_index_path()

  class Entities.HeaderCollection extends App.Entities.Collection
    model: Entities.Header
    url: -> Routes.header_index_path()

  API =
    getHeaders: ->
      headers = new Entities.HeaderCollection
      headers.fetch
        reset: true
      headers
    getHeader: (id) ->
      header = new Entities.Header
        id: id
      header.fetch()
      header
    newHeader: ->
      new Entities.Header

  App.reqres.setHandler 'header:entities', ->
    API.getHeaders()

  App.reqres.setHandler 'header:entity', (id) ->
    API.getHeader id

  App.reqres.setHandler 'new:header:entity', ->
    API.newHeader()