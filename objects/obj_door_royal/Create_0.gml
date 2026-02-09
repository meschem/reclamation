///@description		Init

depth = depths.player - y

onCollision = function(_player) {
	if (array_contains(_player.keys, obj_key_royal)) {
		audio_play_sound(snd_unlock_door, 0, false)
		instance_destroy()
	}
}
