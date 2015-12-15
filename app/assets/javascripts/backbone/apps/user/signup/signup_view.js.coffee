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
    	console.log "data", data, @model
    	@model.save(data)

