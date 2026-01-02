/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

add_map_poi(id, spr_poi_obelisk)

eventName = "Soul Gate"
eventDescription = "Slay Ghosts in the circle to gain bonus XP"
eventLength = stf(30)

baddies = [
	//obj_skeleton,
	//obj_burning_skeleton,
	//obj_cyclo_skeleton,
	//obj_slime_green,
	//obj_zombie,
	//obj_skully_fly,
	obj_ghost
]

activate = function() {
	var _gate = instance_create_depth(x, y, depth, obj_soul_gate)
	_gate.spawnBaddie = array_random(baddies)
	_gate.lifeSpan = eventLength
	
	event_start(eventName, eventDescription, eventLength)
	
	instance_destroy()
}
