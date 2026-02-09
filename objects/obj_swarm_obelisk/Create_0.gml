/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

//add_map_poi(id, spr_poi_obelisk_red)

eventName = "Swarm Gate"
eventDescription = "Defeat the swarm!"
eventLength = -1
difficultyBoost = 0
difficultyIcon = spr_difficulty_boost_skulls

mapIcon = spr_poi_obelisk_red

var _roll = random(1)

if (_roll > 0.9) {
    difficultyBoost = 2
} else if (_roll > 0.7) {
    difficultyBoost = 1
}

activate = function() {
	var _tracker = instance_create_depth(x, y, depth, obj_swarm_event_tracker)
	var _difficulty = get_curse_difficulty_rating() + difficultyBoost
     
	_tracker.activateSwarm(_difficulty)
	
	event_start(eventName, eventDescription, eventLength)
	
	instance_destroy()
}
