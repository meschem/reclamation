/// @function						turn_towards_point(targetPoint, turnRate);
/// @param2 {array}	targetPoint		The [x, y] point to turn towards
/// @param2 {real}	turnRate		Maximum rate the object can turn

function turn_towards_point() {
	var target = argument[0]
	var turnRate = argument_count >= 1 ? argument[1] : 180;
	var desiredAngle = point_direction(x, y, target[0], target[1])
	var facingAngle = point_direction(0, 0, xVel, yVel)
	var diff = angle_difference(facingAngle, desiredAngle)
	
	if (abs(diff) <= turnRate) {
		face_angle(desiredAngle)
	} else {
		var turnAmount = sign(-diff) * turnRate
		face_angle(facingAngle + turnAmount)
	}
}