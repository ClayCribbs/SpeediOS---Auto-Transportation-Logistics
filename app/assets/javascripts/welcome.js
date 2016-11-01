
function loadTables() {

	setTimeout(function() {
		$('#contracts').load("dashboard #contracts")
		$('#widget').load("dashboard #widget")
	}, 500);  
}
