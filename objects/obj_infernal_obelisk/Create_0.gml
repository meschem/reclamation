/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

eventName = "Infernal Obelisk"
eventDescription = "Spawns waves of flying monsters until enough are killed"
eventLength = stf(30)
targetKillCount = 100
spawnSize = 12

mapIcon = spr_poi_obelisk

spriteMiddle = spr_infernal_obelisk_middle
spriteTop = spr_infernal_obelisk_top

spriteMiddleHeight = sprite_get_height(spriteMiddle)
spriteTopHeight = sprite_get_height(spriteTop)

init_floating(1, 120)

getBaddieType = function() {
	var _ageMinutes = fts(obj_run_controller.mainRoomAge) / 60
	var _roll = random(1)
	
	if (_ageMinutes < 6) {
		return obj_devil
	}
	
	if (_ageMinutes < 12) {
		return obj_devil
	}
	
	return obj_devil
}

getSpawnSize = function() {
	var _ageMinutes = fts(obj_run_controller.mainRoomAge) / 60
	var _roll = random(1)
	
	if (_ageMinutes < 2) {
		return 4
	} else if (_ageMinutes < 4) {
		return 8
	} else if (_ageMinutes < 6) {
		return 12
	} else if (_ageMinutes < 8) {
		return 8
	} else if (_ageMinutes < 10) {
		return 12
	} else if (_ageMinutes < 12) {
		return 16
	}
		
	return 20
}

activate = function() {
	var _gate = instance_create_depth(x, y, depth, obj_infernal_wave_summoner)
	_gate.spawnBaddie = getBaddieType()
	_gate.spawnSize = getSpawnSize()
	_gate.lifeSpan = eventLength	
	
	event_start(eventName, eventDescription, eventLength)
	
	instance_destroy()
}
