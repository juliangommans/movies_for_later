@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Model extends Backbone.Model
    destroy: (options = {}) ->
      _.defaults options,
        wait: true

      @set _destroy: true
      super options

    isDestroyed: ->
      @get '_destroy'

    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success: _.bind(@saveSuccess, @, isNew, options.collection)
        error: _.bind(@saveError, @)

      @unset '_errors'
      super data, options

    saveSuccess: (isNew, collection) ->
      if isNew
        collection.add @ if collection
        collection.trigger 'model:created', @ if collection
        @trigger 'created', @
      else
        collection ?= @collection
        collection.trigger 'model:updated', @ if collection
        @trigger 'updated', @

    saveError: (model, xhr, options) ->
      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404

#### Movie Methods

    filterMovieData: (oldMovie) ->
      @set
        title: oldMovie.get('title')
        overview: oldMovie.get('overview')
        genre_ids: oldMovie.get('genre_ids')
        release_date: oldMovie.get('release_date')
        api_id: oldMovie.get('id')
        poster_path: oldMovie.get('poster_path')
        backdrop_path: oldMovie.get('backdrop_path')
        vote_count: oldMovie.get('vote_count')
        vote_average: oldMovie.get('vote_average')
        context: oldMovie.get('context')

    getImageUrl: (options) ->
      options['url'] = 'http://image.tmdb.org/t/p/'
      if options.type is 'poster'
        @poster(options)
      else
        @backdrop(options)

    poster: (options) ->
      size =
        small: 'w45'
        medium: 'w92'
        large: 'w185'
        backdrop: 'w780'
      url = options.url + size[options.size]
      url += @get('poster_path')

    backdrop: (options) ->
      size =
        small: 'w300'
        medium: 'w780'
        large: 'w1280'
      url = options.url + size[options.size]
      url += @get('backdrop_path')

