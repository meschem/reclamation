
if (game_is_paused() || ability == noone ) {
	return 0
}

age++

if (age >= castDelay) {
	ability.use()
	
	instance_destroy()
}
