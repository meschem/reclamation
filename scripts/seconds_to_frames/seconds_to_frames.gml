///@param {real} seconds	Seconds to convert
///@return {real}
function seconds_to_frames(seconds) {
	return (seconds * game_get_speed(gamespeed_fps))
}