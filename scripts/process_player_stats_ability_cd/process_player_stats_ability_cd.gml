///@description			Processes stats for all players

function process_player_stats_ability_cd() {
	var i, trinketLevel
	var rollingAmount = 1
	//baseAbilityCooldownScalar
	with (obj_player) {
		var player = id

		// Process Trinkets
		for (i = 0; i < array_length(obj_player.trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusAbilityCooldown) > 0) {
				rollingAmount -= trinkets[i].bonusAbilityCooldown[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusAbilityCooldown)) {
					rollingAmount += bonusAbilityCooldown[level - 1]
				} else {
					rollingAmount += bonusAbilityCooldown
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			rollingAmount += bonusAbilityCooldown
		}
		
		// Process Talents
		
		// Process Items

		//show_debug_message("Abil CD Scalar = " + string(obj_player.abilityCooldownScalar))
	}
	
	obj_player.abilityCooldownScalar = rollingAmount
}