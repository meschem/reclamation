if (game_is_paused())
	return 0

if (spawning) {
	return 0
}

age++

if (target == noone ) {
	target = get_first_player()
}

if (floats) {
	set_float_range()
}

if (flashBlendDuration > 0) {
	flashBlendRatio = max(0, 1 - (age / flashBlendDuration))
}

if (flashBlendRatio > 0.25 && flashBlendRatio < 1) {
		if (age % 2 == 0) {
		var _angle = random(360)
		var _mag = random_range(0.4, 1.8)
		var _inst = instance_create_depth(x, y, depth + 10, obj_particle_single_cycle)
		_inst.sprite_index = random(1) < 0.3 ? spr_particle_line_ray_2px_w : spr_particle_line_ray_w
		_inst.image_angle = _angle
		_inst.xVel = angle_xvel(_angle) * _mag
		_inst.yVel = angle_yvel(_angle) * _mag
	}
}

if (!active) {
	if (age >= pickupDelay) {
		active = true
	} else {
		return 0
	}
}

beginStep()

if (player_backpack_is_full()) {
	return 0
}

if (!homingActive && lifeSpan >= 0) {
	if (lifeSpan - age < 120) {
		image_alpha = (age % 6 <= 2) ? 0 : 1
	}

	if (age >= lifeSpan) {
		instance_destroy()
	}
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
