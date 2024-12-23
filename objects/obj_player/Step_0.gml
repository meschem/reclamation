if (game_is_paused()) return 0

age++

if (keyboard_check_pressed(ord("P"))) {
	autoAttack = !autoAttack
	
	var enabledText = autoAttack ? "ENABLED" : "DISABLED"
	
	create_toaster("Auto Attack " + enabledText)
}	

if (inputEnabled) {
	player_movement_input()
}

hitWall = player_walk_to_location(xVel, yVel)

if (hitWall) {
	player_check_doodad_collision(xVel, yVel)
}


if (ultimateChargeDelay > 0) {
	ultimateChargeDelay--
}

if (state == playerStates.charging) {
	if (obj_ability_charge.runes[enumRunes.dreygoth].enabled) {
		chargeShockFrames++
		
		if (age % 4 == 0) {
			var inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
			
			inst.sprite_index = spr_particle_lightning_medium
			inst.image_angle = random(360)
			inst.image_xscale = 0.5
			inst.image_yscale = 0.5
		}
	}
	
	if (hitWall) {
		state = playerStates.idle
	
		var xOffset = get_angle_xvel(moveAngle) * 6
		var yOffset = get_angle_yvel(moveAngle) * 6
	
		charge_collision(x + xOffset, y + yOffset, moveAngle)
	}	
}

if (player_can_attack() && !autoAttack) {
	//if (autoAttack) {
		// isAttacking = true 
	//} else {
		attackAngle = get_attack_input()
	//}
	
}

if (autoAttack) {
	var target = instance_nearest(x, y, obj_baddie)
	
	if (target != noone && point_distance(x, y, target.x, target.y) < autoAttackMaxRange) {
		attackAngle = point_direction(x, y, target.x, target.y)
		isAttacking = true
	} else {
		isAttacking = false
	}
}

if (inputFocus == enumInputTypes.controller) {
	controllerAimingCursorPos = get_vec2_from_angle_mag(attackAngle, controllerAimingCursorOffset)
}

// Currently does not change input context
get_ability_input()

if (isAttacking) {
	if (equipment.weapon == noone) {
		create_toaster("No Weapon. Adding Default.")
		addWeapon(availableWeapons[0])
	} else {		
		equipment.weapon.attack(attackAngle)
	}	
}

//activate_sidearms()

player_collision()

depth = depths.player - y

//if (inputFocus == enumInputTypes.controller) {
//	window_set_cursor(spr_none)
//	cursor_sprite = spr_none
//} else {
//	//window_set_cursor(spr_cursor_aiming)
//	cursor_sprite = spr_cursor_aiming
//}

uiDrawOffset = get_ui_pos(id)

if (hp <= 0) {
	set_game_pause_state(true)
	player_death()
}

image_alpha *= alphaScalar

if (xVel > 0.05) {
	image_xscale = 1
} else if (xVel < -0.05) {
	image_xscale = -1
}

