App.BooksIndexRoute = Em.Route.extend
  model: ->
    App.Book.find()

App.BooksShowRoute = Em.Route.extend
  model: (params) ->
    App.Book.find(params.book_id)

App.BooksNewRoute = Em.Route.extend
  model: ->
    App.Book.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.BooksEditRoute = Em.Route.extend
  model: (params) ->
    App.Book.find(params.book_id)


