var ready = function() {
   $("#filterlistingdiv").hide();

  $( "#filterlisting" ).click(function() {
    $("#filterlistingdiv").slideToggle();
  });
};

$(document).ready(ready);
$(document).on('page:change', ready);