
if (game_is_paused())
	return 0

if (beingSummoned) {
	summoningCd--
	
	image_alpha = 1 - (summoningCd / summoningCdMax)
	
	if (summoningCd <= 0) {
		beingSummoned = false
		
		accel_towards_point(target.x, target.y, accel)
	}
} else {
	age++
	
	if  (accel != 0) {
		velocity = get_velocity()
	
		if (velocity < moveSpeedMax) {
			accel_towards_point(x + xVel, y + yVel, accel)
		}
	}
		
	if (useZAxis) {
		z = max(z + zVel, 0)
		
		if (z == 0) {
			if (maxBounces > 0) {
				zVel = zVel * bounceRatio
				maxBounces--
			} else {
				instance_destroy()
			}
		} else {
			zVel -= gravAccel
		}		
	}
	
	x += xVel
	y += yVel
	
	//if (z == 0 && place_meeting(x, y, obj_player)) {
	//	damage_player(id)
	
	//	instance_destroy()
	
	//	return 0
	//}
}

if (age > lifeSpan)
	instance_destroy()
