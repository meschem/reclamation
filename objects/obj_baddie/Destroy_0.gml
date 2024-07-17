
onDestroy()

for (var i = 0; i < array_length(onDestroyList); i++) {
	onDestroyList[i](id)
}

if (!killedByBounds) {
	deathFx()

	if (soundOnDeath >= 0 && !audio_is_playing(soundOnDeath)) {
		audio_play_sound(soundOnDeath, 1, false)
	}
	
	/// FIXME: Uses obj_player
	add_run_stat_kill(id, obj_player)
	
	/// FIXME: Hack
	obj_player.xp += xp
	obj_player.addUltimateCharge(ultimateCharge)
	
	check_for_level_up()

	for (var i = 0; i < array_length(loot); i++) {
		loot[i].drop()
	
		delete loot[i]
	}

	var _player = get_player_target()

	if (_player.hp < _player.maxHp) {
		if (random(1) < 0.02) {
			instance_create_depth(x, y, depths.enemy, obj_health_globe_sm)
		}
	}
}
