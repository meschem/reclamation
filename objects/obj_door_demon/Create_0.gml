///@description		Init

depth = depths.player - y - 1

onCollision = function(_player) {
	if (array_contains(_player.keys, obj_key_demon)) {
		audio_play_sound(snd_unlock_door, 0, false)
		instance_destroy()
	}
}
