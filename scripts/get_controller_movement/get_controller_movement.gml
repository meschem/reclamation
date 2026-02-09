// Script assets have changed for v2.3.0 see

function get_controller_movement() {
	var leftAxisHor = gamepad_axis_value(controllerIndex, gp_axislh)
	var leftAxisVert = gamepad_axis_value(controllerIndex, gp_axislv)
	var deadZone = gamepad_get_axis_deadzone(controllerIndex)

	if (abs(leftAxisHor) < deadZone)
		leftAxisHor = 0
	
	if (abs(leftAxisVert) < deadZone)
		leftAxisVert = 0
		
	return [leftAxisHor, leftAxisVert]
}