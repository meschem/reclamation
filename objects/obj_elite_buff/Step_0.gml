
if (game_is_paused()) {
	return 0
}

if (owner == noone) {
	return 0
}

for (var i = array_length(minions) - 1; i >= 0; i--) {
	if (!instance_exists(minions[i])) {
    	array_delete(minions, i, 1)
    }
}

if (!instance_exists(owner)) {
	instance_destroy()
	return 0
}

age++
