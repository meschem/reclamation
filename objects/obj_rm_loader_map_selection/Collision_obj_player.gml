/// @description Insert description here
// You can write your code in this editor

// TEMP STORING GLOBALS

if (obj_player.equipment.weapon == noone) {
	obj_player.addWeapon(obj_player.defaultWeapon)
}

room_end_store_globals()
	
room_goto(loadRoom)
