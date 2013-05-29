$ ->
  $(document).on "click", ".play_button",  ->
    audioPlayer = $("#lesson_mod_menu")
    $(".footer").css "margin-bottom", "100px"
    audioPlayer.fadeIn()
    $button = $(this)
    thisParent = $button.parent()
    mediaPath =  $button.find(".play_this_lesson_mp3").text()
    titlePath = $button.find(".play_this_lesson_title").text()
    summaryPath = $button.find(".play_this_lesson_summary").text()
    datePath = $button.find(".play_this_lesson_date").text()
    imagePath = thisParent.find(".play_this_lesson_image").attr('src')
    console.log(titlePath)
    console.log(summaryPath)
    console.log(imagePath)
    $(".lesson_mod_info").empty()
    $(".lesson_mod_info").prepend("<h1> "+titlePath+" </h1> <h2> "+summaryPath+" </h2> <h2> "+datePath+" </h2>")
    $(".mod_img").attr("src", imagePath)
    window.player = $("#jquery_jplayer_1").jPlayer
      swfPath: "http://jplayer.org/latest/js"
      supplied: "mp3, oga"
      ready: ->
        player.bind $.jPlayer.event.play, ->
          console.log "play event"
          $button.removeClass "paused"
        player.bind $.jPlayer.event.pause, ->
          console.log "pause event"
          $button.addClass "paused"

    if $button.data("state") == "playing"
      console.log "clicked pause"
      player.jPlayer "pause"
      $button.data "state", "paused"
    else
      console.log "clicked play"
      player.jPlayer "setMedia", {
        mp3: mediaPath
      }
      player.jPlayer "play"
      $button.data "state", "playing"
      $button.removeClass "paused"
