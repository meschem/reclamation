///@description						Gets a move location based on obj_baddie_move_point
///@param {real} _index				Index of point to get
///@return {struct.vec2}
function get_move_point_by_index(_index) {
	with (obj_baddie_move_point) {
		if (moveIndex == _index) {
			return new vec2(x, y)
		}
	}
	
	create_toaster($"Move index {_index} not found", errorLevels.error)
	
	return new vec2()
}
