@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Home extends App.Entities.Model
    urlRoot: -> Routes.home_index_path()

  class Entities.HomeCollection extends App.Entities.Collection
    model: Entities.Home
    url: -> Routes.home_index_path()

  API =
    getHomes: ->
      homes = new Entities.HomeCollection
      homes.fetch
        reset: true
      homes
    getHome: (id) ->
      home = new Entities.Home
        id: id
      home.fetch()
      home
    newHome: ->
      new Entities.Home

  App.reqres.setHandler 'home:entities', ->
    API.getHomes()

  App.reqres.setHandler 'home:entity', (id) ->
    API.getHome id

  App.reqres.setHandler 'new:home:entity', ->
    API.newHome()