@MoviesForLater.module 'HeaderApp', (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      new HeaderApp.Show.Controller
        region: App.headerRegion
    search: (options) ->
      new HeaderApp.Search.Controller options

  HeaderApp.on 'start', ->
    API.show()

  App.commands.setHandler 'show:search:box', (options) ->
    API.search(options)
