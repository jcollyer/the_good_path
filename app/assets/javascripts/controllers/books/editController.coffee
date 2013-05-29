App.BooksEditController = Em.ObjectController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'books.show', @content

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute 'books.show', @content

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute 'books.index'
