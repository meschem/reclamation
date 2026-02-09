/// @description                    Spawned with a swarm obelisk is activated

active = false
swarm = []
age = 0
swarmIcon = spr_card_icons
applySwarmSettings = false

///@description						Activates the swarm. Called after spawn
///@param {real} _difficultyMin		Min difficulty to find
///@param {real} _difficultyMax		Min difficulty to find
///@param {real} _biome             Biome being spawned in
activateSwarm = function(_difficultyMin, _difficultyMax = -1, _biome = -1) {
    if (_difficultyMax == -1) {
        _difficultyMax = _difficultyMin
    }
    
    if (instance_number(obj_swarm_controller) == 0) {
        create_toaster("obj_swarm_controller not found")
        
        return 0
    }
    
    swarm = obj_swarm_controller.spawn(_difficultyMin, _difficultyMax, _biome)
    
    for (var i = 0; i < array_length(swarm); i++) {
        swarm[i].swarmIcon = swarmIcon
        swarm[i].swarmIconIndex = obj_run_controller.spawnEventIndex
        swarm[i].eventParent = id
    }
    
    applySwarmSettings = true
}

///@description						Activates the swarm. Called after spawn
///@param {real} _difficultyMin		Min difficulty to find
///@param {real} _difficultyMax		Min difficulty to find
///@param {real} _biome             Biome being spawned in
activateEliteSwarm = function(_difficultyMin, _difficultyMax = -1, _biome = -1) {
    if (_difficultyMax == -1) {
        _difficultyMax = _difficultyMin
    }
    
    swarm = obj_swarm_controller.spawnEliteGroup(_difficultyMin, _difficultyMax, _biome)
    
    for (var i = 0; i < array_length(swarm); i++) {
        swarm[i].swarmIcon = swarmIcon
        swarm[i].swarmIconIndex = obj_run_controller.spawnEventIndex
        swarm[i].eventParent = id
    }  
    
    if (instance_number(obj_swarm_controller) == 0) {
        create_toaster("obj_swarm_controller not found")
        
        return 0
    }
}

///@description						Registers when a baddie in the swarm dies
///@param {id.Instance} _baddie		Baddie that was killed
eventAlertBaddieDeath = function(_baddie) {
	for (var i = 0; i < array_length(swarm); i++) {
		if (swarm[i] == _baddie) {
			array_delete(swarm, i, 1)
			checkBaddieCount()
			return 0
		}
	}
}

///@description						Checks if the event is over based on baddie count
checkBaddieCount = function() {
	var _left = array_length(swarm)
	
	if (_left == 0) {
		event_end("Swarm Destroyed!")
		
		with (obj_player) {
			instance_create_depth(x + 40, y, depths.enemy, obj_merger_item_chest)
		}
		
		instance_destroy()
	}
}
