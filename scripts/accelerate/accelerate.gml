///@description					Adds velocity by magnitude using an entity's xVel and yVel
///@param {real}	amount		To accelerate by. Can be negative.

function accelerate(amount) {
	var velocity = point_distance(0, 0, xVel, yVel)
	var angle = point_direction(0, 0, xVel, yVel)
	
	set_velocity_from_angle(id, angle, velocity)
}