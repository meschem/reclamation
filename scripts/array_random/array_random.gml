///@description				Gets a random item from an array
///@param {array} arr
///@return {any}
function array_random(arr) {
	var len = array_length(arr)
	var i = irandom(len - 1)
	
	return arr[i]
}
