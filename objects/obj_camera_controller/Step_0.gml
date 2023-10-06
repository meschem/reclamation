
if (focusObject == noone)
	return 0
	
var centerX = getCenterX()
var centerY = getCenterY()

var distanceX = focusObject.x - centerX
var distanceY = focusObject.y - centerY

//var xPos = camera_get_view_x(cameraId)
//var yPos = camera_get_view_x(cameraId)

show_debug_message("Distance: " + string(distanceX) + ", " + string(distanceY))

//if (distanceX < focusObjectBoundsX) {
//	xPos--
//} else if (distanceX > focusObjectBoundsX) {
//	xPos++
//}

//if (distanceY < focusObjectBoundsY) {
//	yPos--
//} else 

//if (distanceY > focusObjectBoundsY) {
//	yPos++
//	show_debug_message("moving y+")
//}

//camera_set_view_pos(view_camera[0], xPos, yPos)

//show_debug_message("Pos: " + string(xPos) + ", " + string(yPos))
