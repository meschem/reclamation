/// @description Insert description here
// You can write your code in this editor

//if (state == chestStates.despawning) {
//	instance_create_depth(x, y, depth, obj_chest_despawner)
//	instance_destroy()
//}

if (state == chestStates.spawning) {
	state = chestStates.closed
	active = true
}

sprite_index = spr_treasure_chest
image_speed = 0
image_index = 0
