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

pressToActivate = true

bouncers = [
    obj_ptb_dest_obelisk_swarm_chunk_a,
    obj_ptb_dest_obelisk_swarm_chunk_a,
    obj_ptb_dest_obelisk_swarm_chunk_a,
    obj_ptb_dest_obelisk_swarm_chunk_a,
    obj_ptb_dest_obelisk_swarm_chunk_a,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_b,
    obj_ptb_dest_obelisk_swarm_chunk_c,
    obj_ptb_dest_obelisk_swarm_chunk_c,
    obj_ptb_dest_obelisk_swarm_chunk_c,
    obj_ptb_dest_obelisk_swarm_chunk_c,
]

deathParticleSpawnRange = new vec2(13, 31)

mapIcon = spr_poi_obelisk_red
chargeMax = 9999999

flashCdCur = 0
flashCdMax = stf(4)
flashSprite = spr_obelisk_flash

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

beginStep = function() {
    flashCdCur++
    
    if (flashCdCur >= flashCdMax) {
        flashCdCur = 0
        
        var _pt = instance_create_depth(x, y, depth - 1, obj_particle_additive_single_cycle)
        _pt.sprite_index = flashSprite
        _pt.image_alpha = 0.75
    }
}
