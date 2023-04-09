if (game_is_paused()) return 0

age++

player_movement_input()

hitWall = player_walk_to_location(xVel, yVel)

if (hitWall && isCharging) {
	isCharging = false
	
	var xOffset = get_angle_xvel(moveAngle) * 6
	var yOffset = get_angle_yvel(moveAngle) * 6
	
	charge_collision(x + xOffset, y + yOffset, moveAngle)
}

if (daggerEquipped)		daggerCdCur = max(0, daggerCdCur - 1)
if (warHammerEquipped)	warHammerCdCur = max(0, warHammerCdCur - 1)

attackAngle = get_attack_input()

get_ability_input()

if (isAttacking) {
	for (var i = 0; i < ds_list_size(weaponList); i++) {
		use_weapon(ds_list_find_value(weaponList, i))
	}
}

activate_sidearms()

player_collision()

depth = depths.player - y

if (hp <= 0) {
	set_game_pause_state(true)
	player_death()
}