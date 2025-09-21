///@description				Slows the entity down
///@param {real} _amount	Amount to slow down
///@return {real}
function deaccelerate(_amount) {
	if (xVel == 0 && yVel == 0) {
		return 0
	}
	
	var angle = point_direction(0, 0, xVel, yVel)
	var mag = point_distance(0, 0, xVel, yVel)
	
	if (mag <= _amount) {
		xVel = 0
		yVel = 0
		
		return 0
	}
	
	mag -= _amount
	
	xVel = angle_xvel(angle) * mag
	yVel = angle_yvel(angle) * mag
	
	return (mag)
}
