///@description   Description
function process_player_stats_pickup(){
	var i, trinketLevel
	var rollingScalarRange = 1
	var rollingScalarReward = 1

	with (obj_player) {
		var player = id
		
		// Process Trinkets
		for (i = 0; i < array_length(trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusPickupRange) > 0) {
				rollingScalarRange += trinkets[i].bonusPickupRange[trinketLevel - 1]
			}
			
			if (array_length(trinkets[i].bonusPickupReward) > 0) {
				rollingScalarReward += trinkets[i].bonusPickupReward[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusPickupRange)) {
					rollingScalarRange += bonusPickupRange[level - 1]
				} else {
					rollingScalarRange += bonusPickupRange
				}
				
				if (is_array(bonusPickupReward)) {
					rollingScalarReward += bonusPickupReward[level - 1]
				} else {
					rollingScalarReward += bonusPickupReward
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			if (active) {
				rollingScalarRange += bonusPickupRange
				rollingScalarReward += bonusPickupReward
			}
		}
		
		// Process Talents
		
		// Process Items
		
		//var addedHp = (baseMaxHp * rollingScalar + rollingStatic) - maxHp
		
		bonusPickupRangeScalar = rollingScalarRange
		bonusPickupRewardScalar = rollingScalarReward
		
		show_debug_message("Damage Scalar: " + string(bonusDamageScalar))
	}
}