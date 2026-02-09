/// @description 

if (game_is_paused()) {
	return 0
}

if (state == chestStates.spawning) {
	return 0
}

if (
    get_ui_profile_type() == uiProfileTypes.gameplay
) {
    drawUi = true
} else {
    drawUi = false
}

depth = depths.enemy - y - 5

openingPlayer = noone
drawOpenPrompt = false
drawCantOpen = false

if (state == chestStates.locked) {
	guiPos = get_ui_pos(id)

	with (obj_player) {
		if (
			x > other.x - other.openRange &&
			x < other.x + other.openRange &&
			y > other.y - other.openRange &&
			y < other.y + other.openRange
		) {
			other.openingPlayer = id
		}
	}

	if (openingPlayer != noone) {
		if (openingPlayer.gold >= cost) {
			drawOpenPrompt = true
			
			var _pressingUse = get_input(bindActions.use)
			
			if (
				_pressingUse
			) {
				open()
			}
		} else {
			drawCantOpen = true
		}
	}
}
