///@description   Intended to be on game_controller Step Event

function list_talents() {
	var talentName, talentLevel
	
	for (var i = 0; i < array_length(talents); i++) {
		talentName = string(talents[i][talentProps.name])
		talentLevel = string(talents[i][talentProps.curLevel])
			
		show_debug_message(talentName + ": " + talentLevel)
	}
}