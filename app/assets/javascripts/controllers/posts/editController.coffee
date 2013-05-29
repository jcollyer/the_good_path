App.PostsEditController = Em.ObjectController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'posts.show', @content

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute 'posts.show', @content

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute 'posts.index'
