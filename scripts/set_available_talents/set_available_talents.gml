/// goes through the current list of talents and find which are available for the player

function set_available_talents() {
	with (obj_game_controller) {
		availableTalents = [];
		
		for (var i = 0; i < array_length(talents); i++) {
			var isValid = talent_is_valid(i)
			
			if (isValid) {
				availableTalents[array_length(availableTalents)] = i
			}
		}
	}
}