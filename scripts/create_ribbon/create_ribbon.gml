///@description							Sets up a ribbon object for an instance
///@param {id.Instance} _parentInst		Instance to attach the ribbon to (id)
///@param {asset.GMObject} _ribbonObj	Object to use for the ribbon (obj_ribbon)
///@param {real} _length				Overrides the max width of the ribbon (8 for obj_ribbon)
///@param {real} _width					Overrides the length of the ribbon (30 for obj_ribbon)
///@param {constant.Color} _color		Color to use for the ribbon (c_white)
function create_ribbon(_parentInst = id, _ribbonObj = obj_ribbon, _length = -1, _width = -1, _color = c_white) {
	var _ribbon = create_instance(_ribbonObj)
	
	_ribbon.hostId = _parentInst
	
	if (_length > 0) {
		_ribbon.trailLength = _length
	}
	
	if (_width > 0) {
		_ribbon.trailWidthStart = _width
	}
	
	_ribbon.trailColor = _color
	
	return _ribbon
}