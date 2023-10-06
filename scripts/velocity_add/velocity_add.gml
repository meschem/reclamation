///@description						Scales velocity to an amount for any object with xVel and yVel.							
///@param {Asset.GMObject} object	Any object that uses xVel and yVel
///@param {real} amount				Scalar to multiply it by
function velocity_add(object, amount) {
	var angle = point_direction(0, 0, object.xVel, object.yVel)
	var mag = point_distance(0, 0, object.xVel, object.yVel)

	mag += amount

	var move = get_vec2_from_angle_mag(angle, mag)
	
	object.xVel = move.x
	object.yVel = move.y
}
