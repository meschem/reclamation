
if (game_is_paused())
	return 0

if (markForDestroy) {
	instance_destroy()
	
	return 0
}

depth = depths.enemy - y - feetOffset

beginStep()

if (beingSummoned) {
	summoningCd--
	
	image_alpha = 1 - (summoningCd / summoningCdMax)
	
	if (summoningCd <= 0) {
		beingSummoned = false
		
		accel_towards_point(target.x, target.y, accel)
	}
} else {
	age++
	
    if (moveSpeedScalar != 1) { 
        var _mag = point_distance(0, 0, xVel, yVel)
        var _angle = point_direction(0, 0, xVel, yVel)
        
        _mag = clamp(_mag * moveSpeedScalar, 0, moveSpeedMax)
        
        if (_mag < 0.2) {
            _mag = 0
        }
        
        xVel = lengthdir_x(_mag, _angle)
        yVel = lengthdir_y(_mag, _angle)
    } else if (accel != 0) {
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
    
    if (angleSpriteToVelocity) {
        image_angle = point_direction(0, 0, xVel, yVel) 
    }
	
	//if (z == 0 && place_meeting(x, y, obj_player)) {
	//	damage_player(id)
	
	//	instance_destroy()
	
	//	return 0
	//}
}

if (lifeSpan > 0 && age > lifeSpan)
	instance_destroy()
