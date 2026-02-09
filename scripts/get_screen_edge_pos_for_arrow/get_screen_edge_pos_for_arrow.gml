///@description						Gets a position to draw an object on the edge of the screen
///@param {id.Instance} _target		Target to draw towards
function get_screen_edge_pos_for_arrow(_target, _margin = 28) {
	var _camera = view_camera[0]
	var _returnVec = new vec2()
	var _x = _target.x
	var _y = _target.y
	
	var _viewX = camera_get_view_x(_camera)
	var _viewY = camera_get_view_y(_camera)
	var _viewWidth = camera_get_view_width(_camera)
	var _viewHeight = camera_get_view_height(_camera)
    
    // Get the center of the screen
    var _centerX = _viewX + (_viewWidth / 2)
    var _centerY = _viewY + (_viewHeight / 2)
    
    // Calculate the angle between the screen center and the object
    var angle = point_direction(_centerX, _centerY, _x, _y)
    var rad = degtorad(angle)
	var _length = 0
    
    // Calculate the arrow coordinates
	if (_x < _viewX) {
		_returnVec.x = _viewX + _margin
		_length = _centerX - (_viewX + _margin) 
		
		_returnVec.y = clamp(
			_centerY + (_length * tan(rad)),
			_viewY + _margin,
			_viewY + _viewHeight - _margin
		)
	} else if (_x > _viewX + _viewWidth) {
		_returnVec.x = _viewX + _viewWidth - _margin
		_length = _centerX - (_viewX + _margin) 
		
		_returnVec.y = clamp(
			_centerY - (_length * tan(rad)),
			_viewY + _margin,
			_viewY + _viewHeight - _margin
		)
	} else if (_y < _viewY) {
		_returnVec.y = _viewY + _margin
		_length = _centerY - _viewY - _margin
		
		_returnVec.x = clamp(
			_centerX + (_length * cos(rad)),
			_viewX + _margin,
			_viewX + _viewWidth - _margin
		)
	} else if (_y > _viewY + _viewHeight) {
		_returnVec.y = _viewY + _viewHeight - _margin
		_length = (_viewY + _margin) - _centerY
		
		_returnVec.x = clamp(
			_centerX - (_length * cos(rad)),
			_viewX + _margin,
			_viewX + _viewWidth - _margin
		)
	}
	
	return (_returnVec)
}