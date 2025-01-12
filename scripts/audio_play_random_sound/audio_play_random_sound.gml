///@description   Description
///@param {array<real>} _soundIds
///@param {real} _priority
///@param {bool} _loops
///@param {real} _gain
///@param {real} _offset
///@param {real} _pitch
function audio_play_random_sound(_soundIds, _priority = 1, _loops = false, _gain = 1, _offset = 1, _pitch = 1){
	var _soundId = array_random(_soundIds)
	
	audio_play_sound(
		_soundId,
		_priority,
		_loops,
		_gain,
		_offset,
		_pitch
	)
}