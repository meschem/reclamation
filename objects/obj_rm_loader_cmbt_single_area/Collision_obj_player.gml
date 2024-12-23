/// @description Insert description here
// You can write your code in this editor

// TEMP STORING GLOBALS

if (obj_player.equipment.weapon == noone) {
	obj_player.addWeapon(obj_weapon_greataxe)
}

room_end_store_globals()
	
obj_run_controller.type = runTypes.singleArea
room_goto(loadRoom)
