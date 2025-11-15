
#macro screenshake_light 2
#macro screenshake_med 5
#macro screenshake_heavy 8
#macro screenshake_ultra 12

cameraId = 0
viewCamera = view_camera[cameraId]

focusObject = obj_player
focusObjectBoundsX = 50
focusObjectBoundsY = 50

width = camera_get_view_width(viewCamera)
height = camera_get_view_height(viewCamera)

boundsPaddingX = (width * 0.5) - focusObjectBoundsX
boundsPaddingY = (height * 0.5) - focusObjectBoundsY

accel = 0.2
speedMax = 10
xVel = 0
yVel = 0

xPos = 80
yPos = 80

shakeForce = 0
shakeDecay = 0.25

centeringRate = 0.05

///@description						Applies screenshake
///@param {real} _amount			Amount to apply. Try using screenshake_ macros.
applyShake = function(_amount = screenshake_med) {
	shakeForce = _amount
}