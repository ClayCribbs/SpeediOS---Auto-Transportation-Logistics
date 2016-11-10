
function loadTables() {

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
	},  200);  

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
	},  5000);  

		setTimeout(function() {
		$('#widget').load("dashboard #widget")
	},  5000); 

	setTimeout(function() {
		$('#widget2').load("dashboard #widget")
	},  5000);   
	setTimeout(function() {
		$('#widget3').load("dashboard #widget")
	},  5000);  
	setTimeout(function() {
		$('#widget4').load("dashboard #widget")
	},  5000);  

};

$(document).ready(function() {
  $('#datetimepicker1').datetimepicker();
});