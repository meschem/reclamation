///@description			Processes stats for all players

function process_player_stats_move_speed() {
	var i, trinketLevel
	var rollingScalar = 1
	var rollingStatic = 0

	with (obj_player) {
		var player = id
		
		// Process Trinkets
		for (i = 0; i < array_length(obj_player.trinkets); i++) {
			trinketLevel = trinkets[i].level

			if (array_length(trinkets[i].bonusMoveSpeed) > 0) {
				rollingScalar += trinkets[i].bonusMoveSpeed[trinketLevel - 1]
			}
		}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusMoveSpeed)) {
					rollingScalar += bonusMoveSpeed[level - 1]
				} else {
					rollingScalar += bonusMoveSpeed
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			rollingScalar += bonusMoveSpeed
		}
		
		// Process Talents
		
		// Process Items
		
		obj_player.moveSpeedMax = obj_player.baseMoveSpeedMax * rollingScalar + rollingStatic
	}
}