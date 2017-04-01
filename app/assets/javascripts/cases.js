$.fn.extend({
  fitTextInDiv: function () {
    var siblingHeight = $(this).siblings('.translation').height()
    while( siblingHeight > $(this).height() ) {
      $(this).css('line-height', (parseFloat($(this).css('line-height')) + 0.1) + "px" );
    }
  }
});
$(document).ready(function() {
  $('#switch').on('click', function(){
    if ($(this).text() == 'Show structure') {
      $(this).text('Hide structure');
    } else {
      $(this).text('Show structure');
    };
    $('.original, .translation').toggleClass( "no-background");
    $('.case-colors').toggleClass("hidden");
  });

  $("span").hover( function() {
    var classes = $(this).attr("class").split(' ');
    var className = "." + classes[0] + "." + classes[1];
    if ($(this).parents("div.section").find(".original, .translation").hasClass("no-background")) {
    $(this).parents("div.section").find($(className)).css( {borderBottom: "1px solid #000" } );
    } else {
      $(this).parents("div.section").find($(className)).css( {borderBottom: "3px solid #000" } );
    };
  }, function() {
    var classes = $(this).attr("class").split(' ');
    var className = "." + classes[0] + "." + classes[1];
    if ($(this).parents("div.section").find(".original, .translation").hasClass("no-background")) {
    $(className).css( {borderBottom: "1px solid #fff" } );
    } else {
    $(className).css( {borderBottom: "3px solid #fff" } );
    };
  });
  $(".original").each(function() {
    $(this).fitTextInDiv();
  });
});

