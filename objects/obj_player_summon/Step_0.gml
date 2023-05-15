if (game_is_paused())
	return 0

if (colliding) {
	player_summon_collision()
}

age++

if (
	(lifeSpan > 0 && age >= lifeSpan) || 
	(hp <= 0)
) {
	instance_destroy()
}
