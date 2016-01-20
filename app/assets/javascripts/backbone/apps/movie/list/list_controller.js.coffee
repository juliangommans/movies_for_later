@MoviesForLater.module 'MovieApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser, @movies } = options
      @layout = @getLayout()
      @listenTo @layout, 'show', ->
        @listView()

      App.modalRegion.show @layout

    redirectUser: (args) ->
      if @currentUser.get('logged_in')
        App.execute 'movie:show',
          region: @layout.modal
          movie: args.model
          currentUser: @currentUser
          movies: @movies
      else
        App.execute 'user:signup'

    listView: ->
      App.execute "when:fetched", @movies, =>
        listView = @getListView()
        @listenTo listView, 'childview:show:movie:page', (args) ->
          @redirectUser(args)

        @listenTo listView, 'show:user:page', ->
          App.execute 'user:show'
          $('#modal').modal 'hide'
          listView.destroy()

        @layout.modal.show listView,
          loading:
            entities: @movies

    rejectLowScoreMovies: ->
      leftovers = @movies.reject( (movie) ->
        return movie unless movie.get('vote_count') >= 1
        )
      console.log leftovers
      new Backbone.Collection leftovers

    getLayout: ->
      new List.Layout

    getListView: ->
      new List.MovieList collection: @rejectLowScoreMovies()
