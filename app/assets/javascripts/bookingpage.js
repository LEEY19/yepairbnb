$( document ).ready(function() {

  var player;

function onYouTubeIframeAPIReady() {
    player = new YT.Player('ytplayer', {
        events: {
            'onReady': onPlayerReady
        }
    });
}

function onPlayerReady(event) {
    player.mute();
    player.playVideo();
}

$( function() {
      var dateToday = new Date();
      from = $( "#bookingstartdate" )
        .datepicker({
          dateFormat: "d MM, y",
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1,
          minDate: dateToday,
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#bookingenddate" ).datepicker({
        dateFormat: "d MM, y",
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        minDate: dateToday,
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
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

  // $( function() {
  //   var availableTags = [
  //     "London",
  //     "Kuala Lumpur",
  //     "Tokyo",
  //     "Singapore",
  //     "Manchester",
  //     "Shah Alam",
  //     "Hanoi",
  //     "Pattaya",
  //     "Bangkok",
  //     "Manila",
  //     "Jakarta",
  //     "Bali",
  //     "Myanmmar",
  //     "New York",
  //     "Minesotta",
  //     "Beijing",
  //     "Costa Rica",
  //     "Athens",
  //     "Barcelona",
  //     "Lisbon",
  //     "Reykjavik",
  //     "Talinn"
  //   ];
  //   $( "#whereto" ).autocomplete({
  //     source: availableTags
  //   });
  // } );



});