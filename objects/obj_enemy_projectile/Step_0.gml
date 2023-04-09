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
	
	velocity = get_velocity()
	
	if (velocity < moveSpeedMax) {
		accel_towards_point(x + xVel, y + yVel, accel)
	}

	x += xVel
	y += yVel

	if (place_meeting(x, y, obj_player)) {
		damage_player(id)
	
		instance_destroy()
	
		return 0
	}
}

if (age > lifeSpan)
	instance_destroy()
