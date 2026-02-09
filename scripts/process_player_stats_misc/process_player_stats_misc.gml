///@description   Description
function process_player_stats_misc() {
	//var i, trinketLevel
	var _rollingScalarRecoveryTime = 1
	var _rollingBonusPoisonDamage = 0
	
	var miscStats = [
		
	]

	with (obj_player) {
		var player = id
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusRecoveryTime)) {
					_rollingScalarRecoveryTime += bonusRecoveryTime[level - 1]
				} else {
					_rollingScalarRecoveryTime += bonusRecoveryTime
				}
			}
			
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusPoisonDamage)) {
					_rollingBonusPoisonDamage += bonusPoisonDamage[level - 1]
				} else {
					_rollingBonusPoisonDamage += bonusPoisonDamage
				}
			}
		}
		
		with (obj_ability) {
			if (level > 0 && variable_instance_exists(id, "bonusPoisonDamage")) {
				if (is_array(bonusPoisonDamage)) {
					var _index = min(level - 1, array_length(bonusPoisonDamage))
					_rollingBonusPoisonDamage += bonusPoisonDamage[_index]
				} else {
					_rollingBonusPoisonDamage += bonusPoisonDamage
				}
			}			
		}
	

		bonusRecoveryTime = _rollingScalarRecoveryTime
		bonusPoisonDamage = _rollingBonusPoisonDamage
		invulnFrames = stf(baseRecoveryTime) + stf(bonusRecoveryTime)
	}
}
