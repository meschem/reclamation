/// @description Insert description here
// You can write your code in this editor

loadRoom = rm_combat_dungeon_test

activated = get_map_object_used()

//create_toaster("testing")

mapIcon = spr_poi_generic

if (activated) {
    //create_toaster("destroyed")
	instance_destroy()
}
