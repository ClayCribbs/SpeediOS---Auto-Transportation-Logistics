
function loadTables() {

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
	},  200);  

	setTimeout(function() {
		$('#widget').load("dashboard #widget")
		$('#contracts').load("dashboard #contracts")
	},  5000);  

		setTimeout(function() {
		$('#widget').load("dashboard #widget")
	},  5000);  
}


