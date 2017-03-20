$(document).ready(function() {
  $('#switch').on('click', function(){
    if ($(this).attr('value') == 'Show structure') {
      $(this).attr('value', 'Hide structure')
    } else {
      $(this).attr('value', 'Show structure')};
    $('.original, .translation').toggleClass( "no-background");
    $('.case-colors').toggleClass("hidden");
  });
  $("span").hover( function() {
    var classes = $(this).attr("class").split(' ');
    var className = "." + classes[0] + "." + classes[1];
    $(this).parents("div.section").find($(className)).css( {borderBottom: "1px solid #000" } );
  }, function() {
    var classes = $(this).attr("class").split(' ');
    var className = "." + classes[0] + "." + classes[1];
    $(className).css( {borderBottom: "none" } );
  });
});
