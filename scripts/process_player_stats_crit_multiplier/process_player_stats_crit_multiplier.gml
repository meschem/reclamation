///@description   Sets crit chance for each player object
function process_player_stats_crit_multiplier() {
	var i, trinketLevel
	var rollingStatic = 0

	with (obj_player) {
		var player = id
		
		// Process Equipment
		with (obj_equipment) {
			if (owner == player && equipped) {
				if (is_array(bonusCritMultiplier) && array_length(bonusCritMultiplier) > 0) {
					i = min(level - 1, array_length(bonusCritMultiplier) - 1)
					rollingStatic += bonusCritMultiplier[i]
				} else if (bonusCritMultiplier != 0) {
					rollingStatic += bonusCritMultiplier
				}
			}
		}
		
		with (obj_weapon_upgrade) {
			rollingStatic += bonusCritMultiplier
		}
		
		// Process Talents
		critMultiplier = baseCritMultiplier + rollingStatic
		
		show_debug_message("Crit Multiplier: " + string(critMultiplier))
	}
}