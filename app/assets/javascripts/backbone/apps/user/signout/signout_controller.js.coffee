@MoviesForLater.module 'UserApp.Signout', (Signout, App, Backbone, Marionette, $, _) ->

  class Signout.Controller extends App.Controllers.Base

    initialize: ->
      $.ajax
        url: '/users/sign_out'
        settings:
          async: false
          method: 'DELETE'
          success: ->
            console.log "YAY SUCCESS"
            App.vent.trigger 'user:status:change'
          error: ->
            console.log "well shit"
