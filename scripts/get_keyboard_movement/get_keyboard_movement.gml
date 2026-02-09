// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_keyboard_movement() {
	var xInput = 0
	var yInput = 0

	if (keyboard_check(ord("A")))
		xInput += -1
	
	if (keyboard_check(ord("D")))
		xInput += 1
		
	if (keyboard_check(ord("W")))
		yInput += -1
	
	if (keyboard_check(ord("S")))
		yInput += 1
		
	if (xInput == 1 && yInput == 1) {
		xInput = 0.71
		yInput = 0.71
	} else if (xInput == 1 && yInput == -1) {
		xInput = 0.71
		yInput = -0.71
	} else if (xInput == -1 && yInput == 1) {
		xInput = -0.71
		yInput = 0.71
	} else if (xInput == -1 && yInput == -1) {
		xInput = -0.71
		yInput = -0.71
	}
		
	return [xInput, yInput]
}