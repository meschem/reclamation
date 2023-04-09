///@description  Checks if an array contains a specified value
///@param {array}	arr
///@param {any}		value
///@return {bool}

function array_contains(arr, value) {
	for (var i = 0; i < array_length(arr); i++) {
		if (arr[i] == value) return true
	}
	
	return false
}