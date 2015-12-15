# @MoviesForLater.module 'Regions', (Regions, App, Backbone, Marionette, $, _) ->

#   class Regions.Modal extends Backbone.Marionette.Region

#     el: '#modal'
#     constructor: ->
#       # _.bindAll @getEl(), @showModal(), @hideModal()
#       Backbone.Marionette.Region::constructor.apply this, arguments
#       @on 'view:show', @showModal, this
#       return

#     getEl: (selector) ->
#       $el = $(selector)
#       $el.on 'hidden', @destroy
#       $el

#     showModal: (view) ->
#       view.on 'close', @hideModal, this
#       @$el.modal 'show'

#     hideModal: ->
#       @$el.modal 'hide'