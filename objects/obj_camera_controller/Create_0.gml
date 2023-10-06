
cameraId = 0
viewCamera = view_camera[cameraId]

focusObject = noone
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

isShaking = false

camera_set_view_pos(viewCamera, 16, 16)

getCenterX = function() {
	var xOffset = camera_get_view_x(view_camera[0])
	return xOffset + (width / 2)
}

getCenterY = function() {
	var yOffset = camera_get_view_y(view_camera[0])
	return yOffset + (height / 2)
}

///@return {struct.vec2}
getCenter = function () {
	var center = new vec2()
	
	center.x = getCenterX()
	center.y = getCenterY()
	
	return center
}