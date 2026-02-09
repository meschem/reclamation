
function talent_is_valid(index) {
	with (obj_game_controller) {
		if (talents[index][talentProps.enabled] == false)
			return false
		//var curLevel = string(talents[index][talentProps.curLevel])
		//var maxLevel = string(talents[index][talentProps.maxLevel])
		//var name = string(talents[index][talentProps.name])
		
		//show_debug_message(name + ": " + curLevel + "/" + maxLevel)
		
		if (talents[index][talentProps.curLevel] >= talents[index][talentProps.maxLevel]) {
			return false
		}

		if (talents[index][talentProps.talentRequirement] != -1) {
			var requiredIndex = talents[index][talentProps.talentRequirement]
			
			if (talents[requiredIndex][talentProps.curLevel] == 0) {
				return false
			}
		}

		return true
	}
}
