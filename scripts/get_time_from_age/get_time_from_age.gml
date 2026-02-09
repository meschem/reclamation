///@description		Description
///@param {real}		age		Age to convert
///@return {string}

function get_time_from_age(age) {
	var totalSeconds = round(age / 60)
	
	var displaySeconds = totalSeconds % 60	
	
	if (displaySeconds < 10) {
		displaySeconds = "0" + string(displaySeconds)
	} else {
		displaySeconds = string(displaySeconds)
	}
	
	var displayMinutes = string((totalSeconds - displaySeconds) / 60)
	
	return (displayMinutes + ":" + string(displaySeconds))
}
