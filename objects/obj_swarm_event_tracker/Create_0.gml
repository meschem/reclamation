/// @description Insert description here
// You can write your code in this editor

active = false

age = 0
swarmIcon = spr_card_icons


///@description						Activates the swarm. Called after spawn
///@param {real} _difficulty		Difficulty level of the game
activateSwarm = function(_difficulty = 0) {
	swarm = get_swarm_collection(_difficulty - 4, _difficulty)
	
	swarm.spawn(id, obj_run_controller.spawnEventIndex)
    
    obj_run_controller.spawnEventIndex++
}

///@description						Registers when a baddie in the swarm dies
///@param {id.Instance} _baddie		Baddie that was killed
eventAlertBaddieDeath = function(_baddie) {
	for (var i = 0; i < array_length(swarm.baddies); i++) {
		if (swarm.baddies[i] == _baddie) {
			array_delete(swarm.baddies, i, 1)
			checkBaddieCount()
			return 0
		}
	}
}

///@description						Checks if the event is over based on baddie count
checkBaddieCount = function() {
	var _left = array_length(swarm.baddies)
	
	if (_left == 0) {
		event_end("Swarm Destroyed!")
		
		with (obj_player) {
			instance_create_depth(x + 40, y, depths.enemy, obj_merger_item_chest)
		}
		
		instance_destroy()
	}
}
