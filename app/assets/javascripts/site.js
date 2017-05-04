 var refreshRating = function() {
    $(".rating").raty( { path: "/assets", scoreName: "comment[rating]" });
    $(".rated").raty( { path: "/assets", 
      readOnly: true,
      score: function() {
        return $(this).attr("data-score");
      }
    });
};


$( document ).on('turbolinks:load ajaxSuccess', function() {
  $(".alert, .notice").delay(4000).fadeOut(1000);
  refreshRating();
  $(".img-zoom").elevateZoom();
});