///@description						Spawns all stored baddies from the run
///@param {asset.GMRoom} _room		Room to load baddies from. Defaults to current room
function spawn_stored_baddies(_room = room) {
	var _insts = []
	var _inst = noone
	
	with (obj_run_controller) {
		for (var i = 0; i < array_length(storedBaddies); i++) {
			if (storedBaddies[i].rm = room) {
				_inst = spawn_baddie(storedBaddies[i].object)
				_inst[0].hp = storedBaddies[i].hp
			}
		}
	}
}
