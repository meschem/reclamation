///@description				Tests if a point is in the camera view or not
///@param {real} _x
///@param {real} _y
///@param {real} _cushion	Distance the object has to be INSIDE the bounds to be considered "IN"
function is_point_in_camera(_x, _y, _cushion = 20) {
	var _camera = view_camera[0]
	
	var _view_x = camera_get_view_x(_camera)
	var _view_y = camera_get_view_y(_camera)
	var _view_width = camera_get_view_width(_camera)
	var _view_height = camera_get_view_height(_camera)
	
	if (
		_x >= _view_x && 
		_x < _view_x + _view_width &&
		_y >= _view_y &&
		_y < _view_y + _view_height
	) {
		return true
	}
	
	return false
}
