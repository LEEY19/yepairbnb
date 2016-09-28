$(document).ready(function() {

  var global = [1];

  $(document).on("focus",".checkavailabledates", function() {
    
    global[0] = (this.name);

      var dateFormat = "mm/dd/yy";
        $( ".checkavailabledates" )
          .datepicker({
            defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            minDate: new Date(),
            beforeShowDay: DisableSpecificDates
          })


  });

  function DisableSpecificDates(date) {
      var disableddates = gon.hashs[global[0]];
      var string = jQuery.datepicker.formatDate('yy-mm-dd', date);

      return [disableddates.indexOf(string) == -1];
    }


});


