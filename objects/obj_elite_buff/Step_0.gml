
if (game_is_paused()) {
	return 0
}

if (owner == noone) {
	return 0
}

if (!instance_exists(owner)) {
	instance_destroy()
	return 0
}

age++
