
onDestroy()

for (var i = 0; i < array_length(onDestroyList); i++) {
	onDestroyList[i](id)
}

if (roomBoss) {
	/// FIXME: Perf? Ugly Code. May be OK.
	var _complete = true
	var _self = id
	
	with (obj_baddie) {
		if (id != _self && roomBoss) {
			_complete = false
		}
	}
	
	if (_complete) {
		with (obj_baddie) {
			if (id != _self) {
				instance_destroy()
			}
		}
		
		with (obj_spawner) {
			instance_destroy()
		}
	}
}

if (!killedByBounds) {
	deathFx()

	if (soundOnDeath >= 0 && !audio_is_playing(soundOnDeath)) {
		audio_play_sound(soundOnDeath, 1, false)
	}
	
	if (eventParent != noone) {
		eventParent.eventAlertBaddieDeath(id)
	}
	
	if (provideKillRewards) {
		/// FIXME: Uses obj_player
		add_run_stat_kill(id, get_first_player())
		add_run_stat(enumRunStats.xpGained, xp)
	
		/// FIXME: Hack
		obj_player.xp += xp
		obj_player.addUltimateCharge(ultimateCharge)
	
		check_for_level_up()
	
		check_for_soul_gate()

		for (var i = 0; i < array_length(loot); i++) {
			loot[i].drop()
	
			delete loot[i]
		}
	}
	
	if (roomBoss) {
		with (obj_spawner) {
			instance_destroy()
		}
		
		with (obj_baddie) {
			instance_destroy()
		}
	}
}
