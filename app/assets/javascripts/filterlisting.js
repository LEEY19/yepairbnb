$(document).on("turbolinks:load", function () {
   $("#filterlistingdiv").hide();

  $( "#filterlisting" ).click(function() {
    $("#filterlistingdiv").slideToggle();
  });
});

