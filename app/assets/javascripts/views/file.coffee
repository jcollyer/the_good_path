App.file = Ember.View.extend
  tagName: 'input'
  attributeBindings: ['type', 'id']
  type: 'file'

  change: (e)->
    view = this
    reader = new FileReader()
    reader.onload = (e)->
      view.set('file', e.target.result)
    reader.readAsText(e.target.files[0])
