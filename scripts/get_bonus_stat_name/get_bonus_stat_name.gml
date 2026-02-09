///@description					Gets a readable name from a variable string
///@param {string} statString	String of the variable requested
///@return {string}
function get_bonus_stat_name(statString) {
	var len = string_length(statString)
	var returnString = ""
	var char
	
	// str search starts with 1
	for (var i = 1; i <= len; i++) {
		char = string_char_at(statString, i)

		if (i == 1) {
			returnString += string_upper(char)
		} else {
			if (is_upper(char)) {
				returnString += $" {char}"
			} else {
				returnString += char
			}
		}
	}
	
	return returnString
}
