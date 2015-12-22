@MoviesForLater.module 'Controllers', (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.Base extends Marionette.Controller

    constructor: (options = {}) ->
      @region = options.region or App.request 'default:region'
      super options
      @_instance_id = _.uniqueId('controllers')
      App.execute 'register:instance', @, @_instance_id

    destroy: (args...) ->
      delete @region
      delete @options
      super args
      App.execute 'unregister:instance', @, @_instance_id

    show: (view, options = {}) ->
      _.defaults options,
        loading: false
        region: @region

      @_setMainView view
      @_manageView view, options

    _setMainView: (view) ->
      ## the first view we show is always going to become the mainView of our
      ## controller (whether its a layout or another view type).  So if this
      ## *is* a layout, when we show other regions inside of that layout, we
      ## check for the existance of a mainView first, so our controller is only
      ## closed down when the original mainView is closed.

      return if @_mainView
      @_mainView = view
      @listenTo view, "destroy", @destroy

    _manageView: (view, options) ->
      if options.loading
        ## show the loading view
        App.execute "show:loading", view, options
      else
        options.region.show view

#### Custom controller methods for this movies app.

    mergeObject: (obj1, obj2) ->
      obj3 = {}
      for attrname of obj1
        obj3[attrname] = obj1[attrname]
      for attrname of obj2
        obj3[attrname] = obj2[attrname]
      obj3
