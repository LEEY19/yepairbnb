$("#filterlistingdiv").hide();

$( "#filterlisting" ).click(function() {

  $("#filterlistingdiv").slideToggle();
});

//PUT HERE FOR LATER REFERENCE WHEN BUILDING RESERVATION
var d1s = new Date(2016, 7, 1),
    d1e = new Date(2016, 7, 5),
    d2s = new Date(2016, 8, 16),
    d2e = new Date(2016, 8, 20);
$(function() {
  $("#datepicker").datepicker({
    dateFormat: "dd-mm-yy",
    showOtherMonths: true,
    selectOtherMonths: true,
    beforeShowDay: function(date) {
      return [(date < d1s || date > d1e) && (date < d2s || date > d2e), ''];
    },
    minDate: new Date(2016, 3, 1),
    maxDate: new Date(2016, 12, 1)
  });
});

$('.bookingcalendar').hide();
$('.bookbtn').click(
    function(){
        $('.bookingcalendar').hide();
        $('.bookingcalendar').insertAfter($(this));
        $('.bookingcalendar').slideDown();
        return false;
    });

$( ":visible" ).not( ".bookbtn" ).click(
    function(){
      $('.bookingcalendar').slideUp();
    });
// $( "body" ).click(function( event ) {
//   $var = event.target;
//   debugger;
// });