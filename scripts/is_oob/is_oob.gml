///@description   Returns if an object if it's fully of of bounds.
///				  This extends beyond visible borders of the room
///				  Sets HP to 0, does no additional processing

///@param {real} _x
///@param {real} _y
///@return {bool}

function is_oob(_x = x, _y = y) {
	var boundsExtension = 256
	
	if (
		_x < -boundsExtension ||
		_y < -boundsExtension ||
		_x > room_width + boundsExtension ||
		_y > room_height + boundsExtension
	) {
		return true
	}
	
	return false
}
