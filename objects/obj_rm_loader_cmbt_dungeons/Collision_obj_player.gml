/// @description Insert description here
// You can write your code in this editor

// TEMP STORING GLOBALS

if (obj_player.equipment.weapon == noone) {
	obj_player.addWeapon(obj_weapon_greataxe)
}

var _dungeon = create_dungeon(dungeonBiomes.castle)

obj_run_controller.loadRoom(_dungeon.floors[0].rooms[0])
