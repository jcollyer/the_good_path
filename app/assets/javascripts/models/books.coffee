App.Book = DS.Model.extend
  title: DS.attr('string')
  summary: DS.attr('string')
  createdAt: DS.attr('date')

