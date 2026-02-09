/// @description Returns a number of available talents. Assumes available talents has been set.
/// @param {real} count

/*
	Grabs indexes for all talents based on obj_game_controller's 
	availableTalents array length. These talents must then be referenced
	by the returned indices
*/

function get_random_talents(count) {
	show_message("Don't use get_random_talents")
	var selectedTalents = []	// Talents that are returned
	//var refIndex = []

	with (obj_game_controller) {
		var length = array_length(availableTalents)
		var i, randomIndex
		
		if (length == 0) {
			return []
		}

		for (i = 0; i < length; i++)
			refIndex[i] = i
			
			
		for (i = 0; i < min(count, length); i++) {
			randomIndex = irandom(array_length(refIndex) - i - 1)

			selectedTalents[i] = availableTalents[refIndex[randomIndex]]
				
			refIndex[randomIndex] = refIndex[array_length(refIndex) - i - 1]
		}
	}
	
	return selectedTalents
}

