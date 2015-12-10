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

    filterMovieData: (newMovie, oldMovie) ->
      newMovie.set
        name: oldMovie.get('title')
        description: oldMovie.get('overview')
        genre_ids: oldMovie.get('genre_ids')
        release_date: oldMovie.get('release_date')
        api_id: oldMovie.get('id')
        poster: oldMovie.get('poster_path')
        backdrop: oldMovie.get('backdrop_path')
        vote_count: oldMovie.get('vote_count')
        vote_average: oldMovie.get('vote_average')
      newMovie
