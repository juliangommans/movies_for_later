@MoviesForLater.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  class Views.ItemView extends Marionette.ItemView

  class Views.ModalView extends Views.ItemView

  	onRender: ->
  		@showModal()

  	showModal: ->
      @listenTo @, 'close', @hideModal, @
      $('#modal').modal 'show'

    hideModal: ->
      $('#modal').modal 'hide'
      @destroy()