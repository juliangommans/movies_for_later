@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends App.Entities.Model
    urlRoot: -> Routes.user_index_path()

  class Entities.UserCollection extends App.Entities.Collection
    model: Entities.User
    url: -> Routes.user_index_path()

  class Entities.NewUser extends App.Entities.Model
    url: -> Routes.user_registration_path()

  class Entities.User extends App.Entities.Model
    url: "/user"

  class Entities.UserSession extends App.Entities.Model
    urlRoot: '/users/sign_in'

  API =
    getUsers: ->
      users = new Entities.UserCollection
      users.fetch
        reset: true
      users
    getUser: ->
      user = new Entities.User
      user.fetch
        async: false
        success: (model) ->
          $('meta[name="csrf-token"]').attr 'content', model.get("csrf_token")
      user
    newUser: ->
      new Entities.NewUser
    getUserSession: ->
      new Entities.UserSession

  App.reqres.setHandler 'user:entities', ->
    API.getUsers()

  App.reqres.setHandler 'user:entity', ->
    API.getUser()

  App.reqres.setHandler 'new:user:entity', ->
    API.newUser()

  App.reqres.setHandler "user:session:entity", ->
    API.getUserSession()
