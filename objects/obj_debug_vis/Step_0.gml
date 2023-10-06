/// @description Insert description here
// You can write your code in this editor

if (game_is_paused())
	return 0

lifeSpan--

if (lifeSpan < 0) instance_destroy()
