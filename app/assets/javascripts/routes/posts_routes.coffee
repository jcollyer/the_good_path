App.PostsIndexRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.PostsShowRoute = Em.Route.extend
  model: (params) ->
    App.Post.find(params.post_id)

App.PostsNewRoute = Em.Route.extend
  model: ->
    App.Post.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.PostsEditRoute = Em.Route.extend
  model: (params) ->
    App.Post.find(params.post_id)


