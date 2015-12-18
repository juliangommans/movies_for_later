@MoviesForLater.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  class Views.Layout extends Marionette.LayoutView

  class Views.ModalLayout extends Views.Layout

    onRender: ->
      @showModal()
