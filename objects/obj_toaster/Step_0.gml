if (game_is_paused()) {
	return 0
}

age++

if (age >= lifeSpan) instance_destroy()
