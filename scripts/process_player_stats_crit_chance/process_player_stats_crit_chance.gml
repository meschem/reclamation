///@description   Description
function process_player_stats_crit_chance() {
	var i, trinketLevel
	var rollingStatic = 0

	with (obj_player) {
		var player = id
		
		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusCritChance) > 0) {
				rollingStatic += trinkets[i].bonusCritChance[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusCritChance)) {
					rollingStatic += bonusCritChance[level - 1]
				} else {
					rollingStatic += bonusCritChance
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			rollingStatic += bonusCritChance
		}
		
		// Process Talents
		
		// Process Items
		
		critChance = baseCritChance + rollingStatic
		
		show_debug_message("Crit Chance: " + string(critChance))
	}
}