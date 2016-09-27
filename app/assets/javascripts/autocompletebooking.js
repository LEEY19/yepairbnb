var ready;
ready = function() {
    var numbers = new Bloodhound({
      remote: {url: "/search/autocomplete?query=%QUERY",
                wildcard: "%QUERY"},
      datumTokenizer: function(d) { 
              return Bloodhound.tokenizers.whitespace(d.title); },
      queryTokenizer: Bloodhound.tokenizers.whitespace


});

// initialize the bloodhound suggestion engine

var promise = numbers.initialize();

promise
.done(function() { console.log('success!'); })
.fail(function() { console.log('err!'); });

// instantiate the typeahead UI
$('.typeahead').typeahead(null, {
  displayKey: 'title',
  highlight: true,
  source: numbers.ttAdapter()
});
}

$(document).ready(ready);
$(document).on('page:load', ready);