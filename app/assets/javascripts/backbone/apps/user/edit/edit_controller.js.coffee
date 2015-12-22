@MoviesForLater.module 'UserApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @currentUser } = options
      @layout = @getLayout()
      @listenTo @layout, 'show', =>
        @editView()
      App.modalRegion.show @layout

    editView: ->
      editView = @getEditView()
      @layout.editRegion.show editView

    getLayout: ->
      new Edit.Layout

    getEditView: ->
      new Edit.User model: @currentUser
