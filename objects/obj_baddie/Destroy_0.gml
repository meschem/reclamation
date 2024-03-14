
onDestroy()

if (!killedByBounds) {
	deathFx()

	if (soundOnDeath >= 0 && !audio_is_playing(soundOnDeath)) {
		audio_play_sound(soundOnDeath, 1, false)
	}

	obj_player.xp += xp

	check_for_level_up()

	for (var i = 0; i < array_length(loot); i++) {
		loot[i].drop()
	
		delete loot[i]
	}

	var player = get_player_target()

	if (player.hp < player.maxHp) {
		if (random(1) < 0.02) {
			instance_create_depth(x, y, depths.enemy, obj_health_globe_sm)
		}
	}
}
