///@description			Processes stats for all players

function process_player_stats_attack_speed() {
	var i, trinketLevel
	var rollingScalar = 1

	with (obj_player) {
		var player = id				
				
		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusAttackSpeed) > 0) {
				rollingScalar += trinkets[i].bonusAttackSpeed[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusAttackSpeed)) {
					rollingScalar += bonusAttackSpeed[level - 1]
				} else {
					rollingScalar += bonusAttackSpeed
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			if (active) {
				rollingScalar += bonusAttackSpeed
			}
		}
		
		// Process Talents
		
		// Process Items
		
		//var addedHp = (baseMaxHp * rollingScalar + rollingStatic) - maxHp

		attackSpeedScalar = rollingScalar
		
		show_debug_message("Attack Speed Scalar: " + string(attackSpeedScalar))
	}
}

