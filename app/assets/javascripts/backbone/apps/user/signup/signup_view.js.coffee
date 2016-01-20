@MoviesForLater.module 'UserApp.Signup', (Signup, App, Backbone, Marionette, $, _) ->

  class Signup.User extends App.Views.ModalView
    template: 'user/signup/_signup'
    ui:
      cancel: '.cancel-button'
      submit: '.submit-button'
      form: '#signup-form'
      signin: '.sign-in-button'
    events:
      'click @ui.cancel': 'hideModal'
      'click @ui.submit': 'saveUser'
    triggers:
      'click @ui.signin': 'sign:in:user'

    saveUser: ->
      data = @ui.form.serializeObject()
      @model.set(data)
      @model.set
        user: data
      console.log "data", data
      @model.save({},
        success: (model, response, options) =>
          console.log "we saved the whales", model, response, options
          App.vent.trigger 'user:status:change'
          @hideModal()
        error: (model, xhr, response) ->
          alert "There was an error signing-up"
          console.log "THEYRE ALL DEAD", model, xhr, response
        )

