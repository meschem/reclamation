///@description							Setups up a trail for an instance
///@param {real} _width
///@param {real} _length
///@param {constant.Color} _color
function trail_setup(_width, _length, _color) {
	trail = true
	trailSpawnWidth = _width
	trailLength = _length			//Count of segments. not pixels.
	trailSegments = []
	trailColor = _color
}
