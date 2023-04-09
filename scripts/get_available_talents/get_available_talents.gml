///@description   Returns a list of talent[] indexes that are valid and available for the player
function get_available_talents(){
	var availableTalents = []

	with (obj_game_controller) {
		for (var i = 0; i < array_length(talents); i++) {
			var isValid = talent_is_valid(i)
			
			if (isValid)
				availableTalents[array_length(availableTalents)] = i
		}
	}
	
	return availableTalents
}