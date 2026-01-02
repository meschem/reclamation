///@description			Processes stats for all players

function process_player_stats_max_health() {
	var i, _level
	var rollingScalar = 1
	var rollingStatic = 0

	with (obj_player) {
		var player = id

		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			_level = trinkets[i].level

			if (array_length(trinkets[i].bonusHealth) > 0) {
				rollingStatic += trinkets[i].bonusHealth[_level - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusHealth)) {
					rollingStatic += bonusHealth[level - 1]
				} else {
					rollingStatic += bonusHealth
				}
			}
		}
		
		// Weapon Upgrades
		with (obj_weapon_upgrade) {
			rollingScalar += bonusHealth
		}
		
		// Process Talents
        
        rollingStatic += floor((baseStr + bonusStr) / 10) * 10
		
		var addedHp = (baseMaxHp * rollingScalar + rollingStatic) - maxHp
		
		maxHp = baseMaxHp * rollingScalar + rollingStatic
		//maxHp = baseMaxHp + addedHp
		hp += addedHp
	}
}
