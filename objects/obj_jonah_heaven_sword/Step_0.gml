/// @description Insert description here
// You can write your code in this editor

if (game_is_paused()) {
	return 0
}

age++

depth = depths.enemy - y

if (age >= lifeSpan) {
	instance_destroy()
}
