///@description   Description
function player_movement_input(){
	if (isCharging) {
		chargeCurrentFrame++
	
		if (chargeCurrentFrame >= chargeMaxLength) {
			isCharging = false
		} else {
			var chargeSpeed = obj_ability_charge.chargeSpeed
		
			xVel = get_angle_xvel(moveAngle) * chargeSpeed
			yVel = get_angle_yvel(moveAngle) * chargeSpeed	
		
			//if (age % 10 == 0) show_debug_message("charging!")
		}
	} else {
		var moveInput = get_controller_movement()

		if (moveInput[0] == 0 && moveInput[1] == 0) {
			moveInput = get_keyboard_movement()
			
			if (moveInput[0] != 0 || moveInput[1] != 0) {
				inputFocus = enumInputTypes.keyboardMouse
			} 
		} else {
			inputFocus = enumInputTypes.controller
		}
	
		if (moveInput[0] == 0 && moveInput[1] == 0) {
			xVel = 0
			yVel = 0
		} else {
			accelX = moveInput[0] * moveAccel
			accelY = moveInput[1] * moveAccel
	
			moveAngle = point_direction(0, 0, moveInput[0], moveInput[1])
	
			var desiredXVel = xVel + accelX
			var desiredYVel = yVel + accelY
			var mag = sqrt(sqr(desiredXVel) + sqr(desiredYVel))

			if (mag > moveSpeedMax) {
				// normalize
				xVel = (desiredXVel / mag) * moveSpeedMax
				yVel = (desiredYVel / mag) * moveSpeedMax
			} else {
				xVel = desiredXVel
				yVel = desiredYVel
			}
		}
	}
}