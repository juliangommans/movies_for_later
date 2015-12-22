@MoviesForLater.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayout()
      @listenTo @layout, 'show', ->
        @showView()
      @show @layout

      App.vent.on 'user:status:change', =>
        @showView()

    showView: ->
      showView = @getShowView()
      @listenTo showView, 'show', ->
        @checkUserLoggedIn(showView)

      @layout.showRegion.show showView

    checkUserLoggedIn: (view) ->
      @currentUser = App.request 'user:entity'

      App.execute "when:fetched", @currentUser, =>
        if @currentUser.get 'logged_in'
          @showAccountView(view)
        else
          @showRegisterView(view)
        @showSeachBox(view)

    showRegisterView: (view) ->
      showRegisterView = @getRegisterView()
      @listenTo showRegisterView, 'show:user:signup', ->
        App.execute 'user:signup'

      @listenTo showRegisterView, 'show:user:signin', ->
        App.execute 'user:signin'

      view.accountRegion.show showRegisterView

    showAccountView: (view) ->
      showAccountView = @getAccountView()
      @listenTo showAccountView, 'show:user:movie', ->
        App.execute 'user:show',
          currentUser: @currentUser

      @listenTo showAccountView, 'show:edit:user', ->
        App.execute 'show:user:edit',
          currentUser: @currentUser

      view.accountRegion.show showAccountView

    showSeachBox: (view) ->
      App.execute 'show:search:box',
        currentUser: @currentUser
        region: view.searchRegion

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Header

    getRegisterView: ->
      new Show.Register model: @currentUser

    getAccountView: ->
      new Show.Account model: @currentUser
