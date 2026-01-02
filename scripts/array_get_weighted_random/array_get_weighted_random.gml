///@description							Gets a weighted item from an array of structs
///									
///@param {array<Struct>} _structs		Structs MUST contain the property "weight". If 0, cannot select item.
///@return {real}						Returns the INDEX of the selection. Returns -1 if invalid for any reason
function array_get_weighted_random(_structs) {
	var _arr = _structs
	var _total = 0
	
	for (var i = 0; i < array_length(_arr); i++) {
		if (_arr[i].weight > 0) {
			_total += _arr[i].weight
		}
	}
	
	if (_total <= 0) {
		return -1
	}
	
	var _curWeight = 0
	var _roll = random(_total)
	
	for (var i = 0; i < array_length(_arr); i++) {
		if (_arr[i].weight > 0) {
			_curWeight += _arr[i].weight
		}
		
		if (_roll < _curWeight) {
			return i
		}
	}
	
	return -1
}