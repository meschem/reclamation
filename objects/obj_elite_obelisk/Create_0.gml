
event_inherited()

//remove_map_poi()
//add_map_poi(id, spr_poi_obelisk_red_sectional)

spriteMiddle = spr_infernal_obelisk_middle
spriteTop = spr_infernal_obelisk_top

spriteMiddleHeight = sprite_get_height(spriteMiddle)
spriteTopHeight = sprite_get_height(spriteTop)

mapIcon = spr_poi_obelisk_red_sectional

init_floating(1, 120)

activate = function() {
	var _tracker = instance_create_depth(x, y, depth, obj_swarm_event_tracker)
	var _difficulty = get_curse_difficulty_rating() + difficultyBoost
     
	_tracker.activateEliteSwarm(_difficulty)
	
	event_start(eventName, eventDescription, eventLength)
	
	instance_destroy()
}

///@description Returns if an object can be partitioned for dormancy
///@return {bool}
canPartition = function() {
    return true
}
