///@description 

function accel_towards_point(xPos, yPos, accel) {
	var angle = point_direction(x, y, xPos, yPos)
	
	//current vector = xVel, yVel
	//add accel vector = accel
	
	var desiredXVel = xVel + (angle_xvel(angle) * accel)
	var desiredYVel = yVel + (angle_yvel(angle) * accel)
	
	xVel = desiredXVel
	yVel = desiredYVel
	
	//var mag = point_distance(0, 0, xVel, yVel)
	
	//if (mag > maxMoveSpeed) {
		//normal...
	//}
	
	
	//mag = min(mag + accel, maxMoveSpeed)	
	//xVel = angle_xvel(angle) * mag
	//yVel = angle_yvel(angle) * mag
}