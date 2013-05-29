App.LessonsEditController = Em.ObjectController.extend
	save: ->
		@store.commit()
		@transitionToRoute 'lessons.show', @content

	cancel: ->
		if @content.isDirty
			@content.rollback()
		@transitionToRoute 'lessons.show', @content

	destroy: ->
	  @content.deleteRecord()
	  @store.commit()
	  @transitionToRoute 'lessons.index'
