$(function() {
  $(document).on('turbolinks:load', function() {
    $(".f-title__text__high--share").css({
      left:"-500px",
      opacity:"0.0"
    }).animate({
        left:"500px",
        opacity:"1.0"
    },3000);
    $(".f-title__text__high--idea").css({
      left:"-500px",
      opacity:"0.0"
    }).animate({
        left:"500px",
        opacity:"1.0"
    },5000);
  })
});