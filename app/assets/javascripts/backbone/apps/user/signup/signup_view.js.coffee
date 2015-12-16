@MoviesForLater.module 'UserApp.Signup', (Signup, App, Backbone, Marionette, $, _) ->

  class Signup.User extends App.Views.ModalView
    template: 'user/signup/_signup'
    ui:
      cancel: '.cancel-button'
      submit: '.submit-button'
      form: '#signup-form'
    events:
      'click @ui.cancel': 'hideModal'
      'click @ui.submit': 'saveUser'

    saveUser: ->
      data = @ui.form.serializeObject()
      @model.set(data)
      @model.set
        user: data
          # email: data.email
          # password: data.password
      console.log "data", data
      @model.save({},
        success: (model, response, options) =>
          console.log "we saved the whales", model, response, options
          @hideModal()
        error: (model, xhr, response) ->
          console.log "THEYRE ALL DEAD", model, xhr, response
        )

