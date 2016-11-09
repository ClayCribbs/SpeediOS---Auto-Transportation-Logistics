
function loadTables() {

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
		$('#order-table').load()
	},  200);  

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
		$('#order-table').load()
	},  5000);  
}


