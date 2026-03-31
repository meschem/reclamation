
if (game_is_paused()) {
    return 0
}

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

// Aim offset


var _screenCenterX = camera_get_view_x(view_camera[0]) + (width / 2)
var _screenCenterY = camera_get_view_y(view_camera[0]) + (height / 2)

var _distToMouse = point_distance(_screenCenterX, _screenCenterY, mouse_x, mouse_y)

var _deadzone = 16
var _maxDist = 180
var _maxOffset = 60
var _aimLerp = 0.08 

var _scaledDist = clamp(_distToMouse - _deadzone, 0, _maxDist - _deadzone)
var _aimStrength = _scaledDist / (_maxDist - _deadzone) // 0 to 1

var _angleToMouse = point_direction(_screenCenterX, _screenCenterY, mouse_x, mouse_y)
var _aimOffsetX = lengthdir_x(_maxOffset * _aimStrength, _angleToMouse)
var _aimOffsetY = lengthdir_y(_maxOffset * _aimStrength, _angleToMouse)

_xOffset += lerp(0, _aimOffsetX, _aimLerp) // lazy follow toward aim
_yOffset += lerp(0, _aimOffsetY, _aimLerp)

center_view(focusObject, _xOffset, _yOffset, _centeringRate)
