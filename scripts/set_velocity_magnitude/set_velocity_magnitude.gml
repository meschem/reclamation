//@description	Sets move speed to max using current xVel and yVel for angle
 
function set_velocity_magnitude(magnitude) {
	var normalVector = normalize_vector(xVel, yVel)
	
	xVel = normalVector[vec._x] * magnitude
	yVel = normalVector[vec._y] * magnitude
}