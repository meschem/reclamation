///@description			Runs through all talents and adds them to the player
///						Used to initialize rooms

function process_all_talents() {
	var i, j, level

	with (obj_game_controller) {
		for (i = 0; i < array_length(talents); i++) {
			level = talents[i][talentProps.curLevel]

			for (j = 0; j < level; j++) {
				add_talent(i)
			}
		}
	}
}