///@param {real} _seconds	Seconds to convert
///@return {real}
function stf(_seconds) {
	return (_seconds * game_get_speed(gamespeed_fps))
}

///@param {real} _frames	Frames to convert
///@return {real}
function fts(_frames) {
	return (_frames / game_get_speed(gamespeed_fps))
}
