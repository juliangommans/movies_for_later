@MoviesForLater.module 'UserApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.User extends App.Views.ItemView
    template: 'user/edit/_edit'

  class Edit.Layout extends App.Views.ModalLayout
    template: 'user/edit/layout'
    ui:
      save: '.submit-button'
      close: '.cancel-button'
    regions:
      editRegion: '#user-edit-region'
    events:
      'click @ui.close': 'hideModal'
    triggers:
      'click @ui.save': 'save:user:details'
