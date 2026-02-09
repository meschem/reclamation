///@param {real} seconds	Seconds to convert
///@return {real}
function seconds_to_frames(seconds) {
	return (seconds * game_get_speed(gamespeed_fps))
}

function frames_to_seconds(frames) {
	return (frames / game_get_speed(gamespeed_fps))
}