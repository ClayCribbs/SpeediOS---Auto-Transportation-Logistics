
function loadTables() {

	setTimeout(function() {
		$('#dashtrucks').load("dashboard #dashtrucks")
		$('#dashcars').load("dashboard #dashcars")
	}, 700);  
}
