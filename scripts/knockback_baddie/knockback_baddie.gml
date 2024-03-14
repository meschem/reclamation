/// @description					Pushes a target back
/// @param {id.Instance} target		Target to push back
/// @param {real} distance			Distance in pixels to push target
/// @param {real} angle				Angle in degrees to push it

function knockback_baddie(target, distance, angle) {
	distance -= target.weight
	
	if (distance <= 0) {
		return
	}
	
	var hitForce = get_velocity_from_angle(angle, distance)
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
	
	var extra = target.weight - distance
	var velocityRatio = max(0, extra / target.weight)
	
	target.xVel *= velocityRatio
	target.yVel *= velocityRatio
}