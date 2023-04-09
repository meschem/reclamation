/// @description	Pushes a target back
/// @param {id.object}		target
/// @param {real}			distance
/// @param {real}			angle

function knockback_baddie(target, distance, angle) {
	//var angle = point_direction(0, 0, xVel, yVel)
	var hitForce = get_velocity_from_angle(angle, max(0, (distance - target.weight)))
		
	target.x += hitForce[0]
	target.y += hitForce[1]
		
	target.damagedOn = target.age
	
	target.knockbackSlowRatio = 0
	target.knockbackSlowDuration = 60
	target.knockbackSlowHitFrame = target.age
	
	target.xVel = 0
	target.yVel = 0
}