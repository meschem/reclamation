///@description   Description
function move_logic_wander() {
	if (wanderTimeCur > 0) {
		wanderTimeCur--
		
		if (wanderTimeCur <= 0) {
			xVel = 0
			yVel = 0
			
			wanderCdCur = wanderCdMax
		}
	} else {
		wanderCdCur--
	
		if (wanderCdCur <= 0) {
			var _angle = random(360)
		
			set_velocity_from_angle(id, _angle, moveSpeedMax)
			wanderTimeCur = wanderTimeMax
		}
	}
}
