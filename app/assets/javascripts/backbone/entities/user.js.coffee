@MoviesForLater.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends App.Entities.Model
    urlRoot: -> Routes.user_index_path()

  class Entities.UserCollection extends App.Entities.Collection
    model: Entities.User
    url: -> Routes.user_index_path()

  class Entities.NewUser extends App.Entities.Model
    url: -> Routes.user_registration_path()

  API =
    getUsers: ->
      users = new Entities.UserCollection
      users.fetch
        reset: true
      users
    getUser: (id) ->
      user = new Entities.User
        id: id
      user.fetch()
      user
    newUser: ->
      new Entities.NewUser

  App.reqres.setHandler 'user:entities', ->
    API.getUsers()

  App.reqres.setHandler 'user:entity', (id) ->
    API.getUser id

  App.reqres.setHandler 'new:user:entity', ->
    API.newUser()