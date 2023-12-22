
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

applyShake = function() {
	shakeForce = 5
}