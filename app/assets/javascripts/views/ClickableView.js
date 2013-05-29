App.EditLesson = Ember.View.extend({
  click: function() {
    var theID = $('#edit_button_id').text();
    window.location = "/lessons/"+theID+"/edit"
    //alert(URL);
  }
});
