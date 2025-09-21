///@description   Description
function process_player_stats_misc() {
	//var i, trinketLevel
	var rollingScalarRecoveryTime = 1

	with (obj_player) {
		var player = id
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusRecoveryTime)) {
					rollingScalarRecoveryTime += bonusRecoveryTime[level - 1]
				} else {
					rollingScalarRecoveryTime += bonusRecoveryTime
				}
			}
		}
	
		bonusRecoveryTime = rollingScalarRecoveryTime
		invulnFrames = stf(baseRecoveryTime) + stf(bonusRecoveryTime)
	}
}
