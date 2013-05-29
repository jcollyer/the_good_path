App.LessonsIndexRoute = Em.Route.extend
  model: ->
    App.Lesson.find()

App.LessonsShowRoute = Em.Route.extend
	model: (params) ->
		App.Lesson.find(params.lesson_id)

App.LessonsNewRoute = Em.Route.extend
  model: ->
    App.Lesson.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.LessonsEditRoute = Em.Route.extend
	model: (params) ->
		App.Lesson.find(params.lesson_id)


