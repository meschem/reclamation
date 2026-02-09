/// @description					Pushes a target back
/// @param {id.Instance} target		Target to push back
/// @param {real} distance			Distance in pixels to push target
/// @param {real} angle				Angle in degrees to push it

function knockback_baddie(target, distance, angle) {
	if (target.weight >= baddie_weight_immovable) {
		return 0
	}
	
	distance -= target.weight
	
	if (distance <= 0) {
		return
	}
    
    target.slideRemaining = distance
    target.slideAngle = angle
	target.damagedOn = target.age
    
	target.knockbackSlowRatio = 0
	target.knockbackSlowDuration = 60
	target.knockbackSlowHitFrame = target.age
}
