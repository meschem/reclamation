///@description   Description
function process_player_stats_projectile_count() {
	var i, trinketLevel
	var rollingCount = 0

	with (obj_player) {
		var player = id

		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusProjectileCount) > 0) {
				rollingCount += trinkets[i].bonusProjectileCount[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusProjectileCount)) {
					rollingCount += bonusProjectileCount[level - 1]
				} else {
					rollingCount += bonusProjectileCount
				}
			}
		}
		
		//with (obj_weapon_upgrade) {
			//rollingCount += bonusProjectileCount
		//}
		
		// Process Talents
		
		// Process Items
		
		bonusProjectileCount = rollingCount
		
		show_debug_message("Bonus Projectile Count = " + string(bonusProjectileCount))
	}
}
