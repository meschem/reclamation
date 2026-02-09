/// @description Insert description here
// You can write your code in this editor

if (skipFoodCleanup) {
	return 0
}

if (food != noone && instance_exists(food)) {
	instance_destroy(food)
}
