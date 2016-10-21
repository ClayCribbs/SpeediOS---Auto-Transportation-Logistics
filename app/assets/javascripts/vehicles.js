function initialize() {

var input = document.getElementById('searchTextField');
var autocomplete = new google.maps.places.Autocomplete(input);

var input2 = document.getElementById('searchTextField2');
var autocomplete2 = new google.maps.places.Autocomplete(input2);
}
$(document).ready(function(){ initMap(); }) 