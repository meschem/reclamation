///@description							Creates a vec2 normal from an x and y
///@param {real} _x						X
///@param {real} _y						Y
///@return {struct.vec2}
function get_vec2_normal(_x, _y) {
	 var _mag = point_distance(0, 0, _x, _y)
	 
	 if (_mag == 0) {
		return (new vec2(0, 0))
	 }
	 
 	 var _normalX = _x / _mag
	 var _normalY = _y / _mag
 
	 return new vec2(_normalX, _normalY)
}