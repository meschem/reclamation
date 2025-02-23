if (game_is_paused())
	return 0

age++

if (target == noone ) {
	target = get_first_player()
}

if (age % 1 == 0) {
	if (target != noone) {
		distanceToTarget = distance_to_object(target)
		angleToTarget = point_direction(x, y, target.x, target.y)
	
		if (!homingActive && drawLocatorArrow) {
			if (is_point_in_camera(x, y)) {
				arrowDrawLocation.x = x + arrowDrawOffset.x
				arrowDrawLocation.y = y + arrowDrawOffset.y
				arrowDrawAngle = 270
			} else {
				arrowDrawLocation = get_screen_edge_pos_for_arrow(id)
				arrowDrawAngle = angleToTarget + 180
			}
		
			//create_toaster($"Arr at ({arrowDrawLocation.x}, {arrowDrawLocation.y})")
		}
	
		if (homesOnPlayer) {
			if (!homingActive && distanceToTarget < homingRadius * target.bonusPickupRangeScalar) {
				homingActive = true
			}
	
			if (homingActive) {
				var mag = point_distance(0, 0, xVel, yVel)
				var angle = angleToTarget

				mag += homingAccel
		
				if (distanceToTarget < mag) {
					xVel = 0
					yVel = 0
					x = target.x
					y = target.y
				} else {
					xVel = angle_xvel(angle) * mag
					yVel = angle_yvel(angle) * mag
				}
			}
		}
	}
}


if (!homingActive && lifeSpan >= 0) {
	if (lifeSpan - age < 120) {
		image_alpha = (age % 6 <= 2) ? 0 : 1
	}

	if (age >= lifeSpan) {
		instance_destroy()
	}
}



x += xVel
y += yVel

var inst = instance_place(x, y, obj_player)

if (inst != noone) {
	//audio_play_sound(snd_soft_click, 1, false)
	onPickup(inst)
	//add_player_health(pickupValue)
	
	//var txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	//txt.fontColor = get_color(colors.red)
	
	//instance_destroy()
}

if (floats) {
	set_float_range()
}