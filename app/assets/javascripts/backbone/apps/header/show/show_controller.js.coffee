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
      checkUser = App.request 'user:entity'

      App.execute "when:fetched", checkUser, =>
        if checkUser.get 'logged_in'
          @showAccountView(view, checkUser)
        else
          @showRegisterView(view, checkUser)

    showRegisterView: (view, checkUser) ->
      showRegisterView = @getRegisterView(checkUser)
      @listenTo showRegisterView, 'show:user:signup', ->
        App.execute 'user:signup'

      @listenTo showRegisterView, 'show:user:signin', ->
        App.execute 'user:signin'

      view.accountRegion.show showRegisterView

    showAccountView: (view, checkUser) ->
      showAccountView = @getAccountView(checkUser)

      view.accountRegion.show showAccountView

    getLayout: ->
      new Show.Layout

    getShowView: ->
      new Show.Header

    getRegisterView: (checkUser) ->
      new Show.Register model: checkUser

    getAccountView: (checkUser) ->
      new Show.Account model: checkUser
