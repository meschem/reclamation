/// @description					Pushes a target back
/// @param {id.Instance} target		Target to push back
/// @param {real} distance			Distance in pixels to push target
/// @param {real} angle				Angle in degrees to push it

function knockback_baddie(target, distance, angle) {
	//var angle = point_direction(0, 0, xVel, yVel)
	var hitForce = get_velocity_from_angle(angle, max(0, (distance - target.weight)))
	var stepVec = normalize_vector(hitForce[0], hitForce[1])

	with (target) {
		for (var i = 0; i < distance; i++) {
			if (
					place_meeting(x + stepVec[0], y + stepVec[1], obj_baddie) ||
					place_meeting(x + stepVec[0], y + stepVec[1], obj_pit)
			) {
				break
			} else {
				x += stepVec[0]
				y += stepVec[1]
			}
		}
	}
		
	target.damagedOn = target.age
	
	target.knockbackSlowRatio = 0
	target.knockbackSlowDuration = 60
	target.knockbackSlowHitFrame = target.age
	
	target.xVel = 0
	target.yVel = 0
}