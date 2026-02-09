///@description			Processes stats for all players

function process_player_stats_ability_dmg() {
	var i, trinketLevel
	var rollingAmount = 0
	//baseAbilityCooldownScalar
	with (obj_player) {
		var player = id

		// Process Trinkets
		for (i = 0; i < array_length(obj_player.trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusAbilityDamage) > 0) {
				rollingAmount -= trinkets[i].bonusAbilityDamage[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusAbilityDamage)) {
					rollingAmount += bonusAbilityDamage[level - 1]
				} else {
					rollingAmount += bonusAbilityDamage
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			rollingAmount += bonusAbilityDamage
		}
		
		// Process Talents
        
        rollingAmount += (baseInt + bonusInt) / 100
		
		// Process Items

		//show_debug_message("Abil CD Scalar = " + string(obj_player.abilityCooldownScalar))
	}
	
	obj_player.bonusAbilityDamageScalar = rollingAmount
}