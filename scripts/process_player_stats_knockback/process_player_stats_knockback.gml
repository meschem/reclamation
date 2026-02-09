///@description			Processes stats for all players

function process_player_stats_knockback() {
	var i, trinketLevel
	
	with (obj_player) {
		var player = id
		var rollingScalar = 0
				
		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusKnockbackScalar) > 0) {
				rollingScalar += trinkets[i].bonusDamageScalar[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusKnockbackScalar)) {
					rollingScalar += bonusKnockbackScalar[level - 1]
				} else {
					rollingScalar += bonusKnockbackScalar
				}
			}
		}
		
		//with (obj_weapon_upgrade) {
			//if (active) {
                //if (is_array(bonusKnockbackScalar)) {
					//rollingScalar += bonusKnockbackScalar[level - 1]
				//} else {
					//rollingScalar += bonusKnockbackScalar
				//}
			//}
		//}
		
		// Process Talents
		
		// Process Items
        
        rollingScalar += (bonusStr + baseStr) / 100
		
		//var addedHp = (baseMaxHp * rollingScalar + rollingStatic) - maxHp
		
		bonusKnockbackMultiplier = rollingScalar
	}
}
