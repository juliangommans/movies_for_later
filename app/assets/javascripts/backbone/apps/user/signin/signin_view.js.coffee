@MoviesForLater.module 'UserApp.Signin', (Signin, App, Backbone, Marionette, $, _) ->

  class Signin.User extends App.Views.ModalView
    template: 'user/signin/_user'
    ui:
      cancel: '.cancel-button'
      submit: '.submit-button'
      form: '#signup-form'
    events:
      'click @ui.cancel': 'hideModal'
      'click @ui.submit': 'signIn'

    signIn: ->
      data = @ui.form.serializeObject()
      @model.set(data)
      @model.set
        user: data
      @model.save({},
        success: (model, response, options) =>
          console.log "we've signed in ^^^^ the whales", model, response, options
          App.vent.trigger 'user:status:change'
          @hideModal()
        error: (model, xhr, response) ->
          console.log "THEYRE ALL DEAD", model, xhr, response
        )



