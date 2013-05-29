App.Lesson = DS.Model.extend
  title: DS.attr('string')
  summary: DS.attr('string')
  image: DS.attr('string')
  imageThumbUrl: DS.attr('string')
  imageMediumUrl: DS.attr('string')
  imageLargeUrl: DS.attr('string')
  createdAt: DS.attr('date')
  mp3: DS.attr('string')
