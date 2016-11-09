
function loadTables() {

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
		$('#order-table').load()
	},  200);  

	setTimeout(function() {
		$('#order-table').load()
		$('#widget').load("dashboard #widget")
		$('#contracts').load("dashboard #contracts")
	},  5000);  

		setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
		$('#order-table').load()
	},  8000);  
}


