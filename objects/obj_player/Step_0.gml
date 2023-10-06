if (game_is_paused()) return 0

age++

player_movement_input()

hitWall = player_walk_to_location(xVel, yVel)

if (isCharging) {
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
		isCharging = false
	
		var xOffset = get_angle_xvel(moveAngle) * 6
		var yOffset = get_angle_yvel(moveAngle) * 6
	
		charge_collision(x + xOffset, y + yOffset, moveAngle)
	}	
}

//if (daggerEquipped)
//	daggerCdCur = max(0, daggerCdCur - 1)

//if (warHammerEquipped)
//	warHammerCdCur = max(0, warHammerCdCur - 1)

attackAngle = get_attack_input()

get_ability_input()

if (isAttacking) {
	//for (var i = 0; i < ds_list_size(weaponList); i++) {
	//	//use_weapon(ds_list_find_value(weaponList, i))
	//	weaponList[| i].attack()
	//}
	equipment.weapon.attack()
}

//activate_sidearms()

player_collision()

depth = depths.player - y

if (hp <= 0) {
	set_game_pause_state(true)
	player_death()
}

if (xVel > 0.05) {
	image_xscale = 1
} else if (xVel < -0.05) {
	image_xscale = -1
}
