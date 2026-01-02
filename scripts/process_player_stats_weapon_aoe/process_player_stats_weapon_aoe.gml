///@description			Processes stats for all players

function process_player_stats_weapon_aoe() {
	var i, trinketLevel
	var rollingScalar = 1
	var rollingStatic = 0

	with (obj_player) {
		var player = id
		
		// Process Trinkets
		for (i = 0; i < array_length(obj_player.trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusWeaponAoe) > 0) {
				rollingScalar += trinkets[i].bonusWeaponAoe[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusWeaponAoe)) {
					rollingScalar += bonusWeaponAoe[level - 1]
				} else {
					rollingScalar += bonusWeaponAoe
				}
			}
		}
		
		//with (obj_weapon_upgrade) {
			//if (active) {
				//rollingScalar += bonusWeaponAoe
			//}
		//}
		
		// Process Talents
		
		// Process Items
		bonusWeaponAoeScalar = rollingScalar + rollingStatic
	}
}