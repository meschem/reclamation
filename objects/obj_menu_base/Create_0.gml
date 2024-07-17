///@description			Used by menus to help with some basics

useControllerFocus = false
useMouseFocus = false

lastMousePosition = new vec2(mouse_x, mouse_y)
curMousePosition = lastMousePosition
movingMouse = false
mouseMoveThreshold = 2

checkMouseMovement = function() {
	curMousePosition.x = mouse_x
	curMousePosition.y = mouse_y
	
	var _distance = get_vec2_distance(curMousePosition, lastMousePosition)
	
	if (_distance > mouseMoveThreshold) {
		movingMouse = true
		create_toaster("moving mouse")
	}
	
	lastMousePosition = curMousePosition
}
