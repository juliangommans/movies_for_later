@MoviesForLater.module 'UserApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser } = options
      @currentUser or= App.request 'user:entity'

      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @filterPreMovies(@buildMovies())
        @showView()
      @show @layout,
        loading:
          entities: @currentUser

      App.vent.on 'user:movie:list:change', =>
        @currentUser = App.request 'user:entity'
        App.execute "when:fetched", [@currentUser], =>
          @filterPreMovies(@buildMovies())
          @showView()

      # App.vent.on 'user:watched:list:change', =>
      #   @currentUser = App.request 'user:entity'
      #   App.execute "when:fetched", [@currentUser], =>
      #     @filterPostMovies(@buildMovies())
      #     @showView()

    buildMovies: ->
      movies = @currentUser.get('movies')
      user_movies = @currentUser.get('user_movies')
      combinedMovies = []
      unless movies.length < 1
        for i in [0..movies.length-1]
          movie = @mergeObject(movies[i],user_movies[i])
          model = new App.Entities.Model movie
          combinedMovies.push(model)
      new Backbone.Collection combinedMovies

    addValues: (movie) ->
      movie.url = "/user_movies/#{movie.id}"
      movie.set backdrop: movie.getImageUrl
        type: 'backdrop'
        size: 'small'

      movie.set poster: movie.getImageUrl
        type: 'poster'
        size: 'medium'

    filterPostMovies: (movies) ->
      filtered = movies.filter( (movie) ->
        return movie if movie.get('watched') )
      @showFilteredMovies(filtered)

    filterPreMovies: (movies) ->
      filtered = movies.filter( (movie) ->
        return movie unless movie.get('watched') )
      @showFilteredMovies(filtered)

    showFilteredMovies: (movies) ->
      newMovies = new Backbone.Collection movies
      newMovies.each( (movie) =>
        @addValues(movie)
        )
      @showMovies(newMovies)

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'show:saved:movies', =>
        @filterPreMovies(@buildMovies())
      @listenTo showView, 'show:watched:movies', =>
        @filterPostMovies(@buildMovies())

      @layout.showRegion.show showView

    showMovies: (movies) ->
      showMoviesView = @getMoviesView(movies)
      @listenTo showMoviesView, 'childview:watch:movie', (args) ->
        App.execute 'movie:watch',
          currentUser: @currentUser
          movie: args.model
      @listenTo showMoviesView, 'childview:remove:movie', @remove


      @layout.moviesRegion.show showMoviesView

    remove: (args) ->
      userMovie = args.model
      userMovie.destroy()

    getMoviesView: (movies) ->
      new Show.UserMovies collection: movies

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.User model: @currentUser
