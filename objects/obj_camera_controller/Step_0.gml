
if (focusObject == noone) {
	return 0
}
	
var _xOffset = 0
var _yOffset = 0
	
if (shakeForce > 0) {
	var _r = shakeForce * sqrt(random(1))
	var _theta = random(1) * 2 * pi
	
	_xOffset = _r * cos(_theta)
	_yOffset = _r * sin(_theta)
	
	shakeForce -= max(shakeDecay, 0)
}

with (obj_room_controller) {
	_xOffset += cameraOffset.x
	_yOffset += cameraOffset.y
}

var _centeringRate = centeringRate

with (obj_room_controller) {
	if (age < 2) _centeringRate = 1
}

center_view(focusObject, _xOffset, _yOffset, _centeringRate)
