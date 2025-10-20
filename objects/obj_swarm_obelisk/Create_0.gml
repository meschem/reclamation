/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

mapIcon = spr_poi_obelisk_red

eventName = "Swarm Gate"
eventDescription = "Defeat the swarm!"
eventLength = -1

activate = function() {
	var _gate = instance_create_depth(x, y, depth, obj_swarm_event_tracker)
	
	_gate.activateSwarm()
	
	event_start(eventName, eventDescription, eventLength)
	
	instance_destroy()
}
