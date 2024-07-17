///@description			Init
//useControllerFocus = false
//useMouseFocus = false

enum explicitInputTypes {
	none,
	keyboard,
	mouse,
	controller
}

lastMouseX = mouse_x
lastMouseY = mouse_y

mouseMoveThreshold = 1

movingMouse = false

usingMouse = false
usingKeyboard = false
usingController = false

lastInputType = explicitInputTypes.none

///@description			Updates mouse pos AND checks if moving
///@return {bool}
checkMouseMovement = function() {
	var _movingMouse = false
	var _xDiff = abs(mouse_x - lastMouseX)
	var _yDiff = abs(mouse_y - lastMouseY)
	
	if (
		_xDiff > mouseMoveThreshold ||
		_yDiff > mouseMoveThreshold
	) {
		_movingMouse = true
	}
	
	lastMouseX = mouse_x
	lastMouseY = mouse_y
	
	return _movingMouse
}

lastInputTypeString = function() {
	switch (lastInputType) {
		case explicitInputTypes.none:
			return "None"
		
		case explicitInputTypes.controller:
			return "Controller"
		
		case explicitInputTypes.keyboard:
			return "Keyboard"
		
		case explicitInputTypes.mouse:
			return "Mouse"
	}
}