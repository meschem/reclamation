//@description	Sets move speed to max using current xVel and yVel for angle
 
function set_velocity_magnitude(magnitude) {
	//var normalVector = normalize_vector(xVel, yVel)
	
	var mag = point_distance(0, 0, xVel, yVel)
	var normalX = xVel / mag
	var normalY = yVel / mag
	
	xVel = normalX * magnitude
	yVel = normalY * magnitude
}