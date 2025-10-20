///@description			Processes stats for all players

function process_player_stats_damage_scalar() {
	var i, trinketLevel
	
	with (obj_player) {
		var player = id
		var rollingScalar = 1
				
		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusDamageScalar) > 0) {
				rollingScalar += trinkets[i].bonusDamageScalar[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusDamageScalar)) {
					rollingScalar += bonusDamageScalar[level - 1]
				} else {
					rollingScalar += bonusDamageScalar
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			if (active) {
				rollingScalar += bonusDamageScalar
			}
		}
		
		// Process Talents
		
		// Process Items
		
		//var addedHp = (baseMaxHp * rollingScalar + rollingStatic) - maxHp
		
		bonusDamageScalar = rollingScalar
		
		show_debug_message("Damage Scalar: " + string(bonusDamageScalar))
	}
}
