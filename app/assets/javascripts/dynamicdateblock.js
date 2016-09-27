
$( document ).ready(function() {
 




//PUT HERE FOR LATER REFERENCE WHEN BUILDING RESERVATION
// var d1s = new Date(2016, 7, 1),
//     d1e = new Date(2016, 7, 5),
//     d2s = new Date(2016, 8, 16),
//     d2e = new Date(2016, 8, 20);
//     array = [[d1s,d1e],[d2s,d2e]]
// $(function() {
//   $("#datepicker").datepicker({
//     dateFormat: "dd-mm-yy",
//     showOtherMonths: true,
//     selectOtherMonths: true,
//     beforeShowDay: function(date) {

//       return [(date < d1s || date > d1e) && (date < d2s || date > d2e), ''];
//     },
//     minDate: new Date(2016, 3, 1),
//     maxDate: new Date(2016, 12, 1)
//   });
// });


// $('.bookingcalendar').hide();
// $('.bookbtn').click(
//     function(){
//         $('.bookingcalendar').hide();
//         $('.bookingcalendar').insertAfter($(this));
//         $('.bookingcalendar').slideDown();
//         return false;
//     });

// $( ":visible" ).not( ".bookbtn" ).click(
//     function(){
//       $('.bookingcalendar').slideUp();
//     });

  $( function() {
      var dateToday = new Date();
      from = $( "#start" )
        .datepicker({
          dateFormat: "d MM, y",
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1,
          minDate: dateToday,
          beforeShowDay: DisableSpecificDates
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
          for (i = 0; i < gon.startDates.length; i++) {
            if(getDate(this) < new Date(gon.startDates[i])) {     
              to.datepicker( "option", "maxDate", new Date(gon.startDates[i]));
              i = 100
            }};
        }),
      to = $( "#end" ).datepicker({
        dateFormat: "d MM, y",
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        minDate: dateToday,
        beforeShowDay: DisableSpecificDates
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
        for (i = 0; i < gon.endDates.length; i++) {
          if(getDate(this) > new Date(gon.endDates[i])) {     
            from.datepicker( "option", "minDate", new Date(gon.endDates[i]));
            i = 100
          }};
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( "d MM, y", element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );

function DisableSpecificDates(date) {
    var disableddates = gon.reservations;
    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);

    return [disableddates.indexOf(string) == -1];
  }
  
});
// function checkUnavailable(date, unavailableDates) {

//   // break the selected date to month, year and day to prepare MySQL format       
//   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
//   m = m+1; // because months start from 0
  
//   // add leading zeros 
//   m = m.toString();
//   if(m.length < 2) {
//     m = '0' + m;
//   };
//   d = d.toString();
//   if(d.length < 2) {
//     d = '0' + d; 
//   };
//   debugger;
//   // now go through the array to see if the date is in the array of unavailable dates or not
//   for (i = 0; i < unavailableDates.length; i++) {
//     if(jQuery.inArray(m + '-' + d + '-' + y, unavailableDates) !== -1) {     
//       return [false];
//     }
//     else {
//       return [true];
//     }
//   }};

