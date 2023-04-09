///@description		Gets attack input. Returns an angle, sets isAttacking on calling object.

function get_attack_input() {
	isAttacking = false

	if (mouse_check_button(mb_left) || isAlwaysAttacking) {
		var targetY = mouse_y
		var targetX = mouse_x
		
		isAttacking = true
		
		return point_direction(obj_player.x, obj_player.y, targetX, targetY)		
	} 
	
	var rightAxisHor = gamepad_axis_value(controllerIndex, gp_axisrh)
	var rightAxisVert = gamepad_axis_value(controllerIndex, gp_axisrv)
	var deadZone = gamepad_get_axis_deadzone(controllerIndex)

	if (abs(rightAxisHor) < deadZone)
		rightAxisHor = 0
	
	if (abs(rightAxisVert) < deadZone)
		rightAxisVert = 0
			
	isAttacking = !(rightAxisHor == 0 && rightAxisVert == 0)

	if (isAttacking) {
		return point_direction(0, 0, rightAxisHor, rightAxisVert)
	} else {
		return 0
	}
}