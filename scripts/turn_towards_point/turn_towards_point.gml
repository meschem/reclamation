/// @function						turn_towards_point(targetPoint, turnRate);
/// @param {array}	targetPoint		The [x, y] point to turn towards
/// @param {real}	turnRate		Maximum rate the object can turn

function turn_towards_point(targetPoint, turnRate = 180) {
	var desiredAngle = point_direction(x, y, targetPoint[0], targetPoint[1])
	var facingAngle = point_direction(0, 0, xVel, yVel)
	var diff = angle_difference(facingAngle, desiredAngle)
	
	if (abs(diff) <= turnRate) {
		face_angle(desiredAngle)
	} else {
		var turnAmount = sign(-diff) * turnRate
		face_angle(facingAngle + turnAmount)
	}
}