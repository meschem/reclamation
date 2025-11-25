///@description   Sets crit chance for each player object
function process_player_stats_aoe_scalar() {
	var i, trinketLevel
	var rollingScalar = 0

	with (obj_player) {
		var player = id
		
		// Process Equipment
		with (obj_equipment) {
			if (owner == player && equipped) {
				if (is_array(bonusAreaOfEffect) && array_length(bonusAreaOfEffect) > 0) {
					i = min(level - 1, array_length(bonusAreaOfEffect) - 1)
					rollingScalar += bonusAreaOfEffect[i]
				} else if (bonusAreaOfEffect != 0) {
					rollingScalar += bonusAreaOfEffect
				}
			}
		}
		
		bonusAreaOfEffectScalar = rollingScalar

		show_debug_message("AOE Scalar: " + string(bonusAreaOfEffectScalar))
		
	}
}
