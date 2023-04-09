/// @description			Sets the game to paused or unpaused
/// @param {bool} pause		Set to true to pause game. False to unpause

function set_game_pause_state(pause) {
	obj_room_controller.isPaused = pause
}