$(document).ready(function(){
  $('.accordian_part').click(function(){
    $('.show_data').css("display", "none");
    $thing = $(this);
    $('.accordian_part').removeClass("active_home_feature");
    $thing.addClass("active_home_feature");
    var name = $thing.attr("data-name");
    if (name === "one"){
      $('#one_box').fadeIn();
    } else if (name === "two"){
      $('#two_box').fadeIn();
    } else if (name === "three"){
      $('#three_box').fadeIn();
    } else if (name === "four"){
      $('#four_box').fadeIn();
    }
    //alert(name);

  });
});
