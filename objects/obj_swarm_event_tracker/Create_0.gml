/// @description Insert description here
// You can write your code in this editor

active = false

age = 0

///@description						Activates the swarm. Called after spawn
///@param {real} _difficultyMin		Min difficulty for swarm type
///@param {real} _difficultyMax		Max difficulty for swarm type
activateSwarm = function(_difficultyMin = 0, _difficultyMax = 99) {
	swarm = get_swarm_collection(_difficultyMin, _difficultyMax)
	
	swarm.spawn(id)
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
	
	//create_toaster($"Baddie removed from swarm event, {_left} left")
	
	if (_left == 0) {
		event_end("Swarm Destroyed!")
		
		with (obj_player) {
			instance_create_depth(x + 40, y, depths.enemy, obj_merger_item_chest)
		}
		
		instance_destroy()
	}
}
