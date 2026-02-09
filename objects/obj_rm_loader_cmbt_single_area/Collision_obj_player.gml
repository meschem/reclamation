/// @description Insert description here
// You can write your code in this editor

// TEMP STORING GLOBALS

if (obj_player.equipment.weapon == noone) {
	obj_player.addWeapon(obj_player.defaultWeapon)
}

start_single_room_run(loadRoom)

room_goto(loadRoom)
