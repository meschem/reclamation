///@description								Gets a random swarm collection
///@param {real} _difficultyMin				Minimum difficulty
///@param {real} _difficultyMax				Maximum difficulty
///@return {struct.baddieSwarmCollection}
function get_swarm_collection(_difficultyMin = 0, _difficultyMax = 99) {
	var _swarms = [
		new baddieSwarmCollection(
			[
				new baddieSwarm(
				[
					obj_burning_skeleton,
					obj_cyclo_skeleton,
					obj_skeleton,
					obj_skeleton_warrior
				], 
					90
				)
			],
		),
		
		new baddieSwarmCollection(
			[
				new baddieSwarm([obj_skull_head_frozen], 40),
				new baddieSwarm([obj_skull_head_ruby], 20)
			],
		),
		
		new baddieSwarmCollection(
			[
				new baddieSwarm([obj_slime_green], 80),
				new baddieSwarm([obj_slime_blue], 20)
			],
		),
	]
	
	var _shuffled = array_shuffle(_swarms)
	
	for (var i = 0; i < array_length(_shuffled); i++) {
		if (_shuffled[i].difficulty >= _difficultyMin && _shuffled[i].difficulty <= _difficultyMax) {
			return _shuffled[i]
		}
	}
	
	create_toaster($"No swarm found for difficulty range ({_difficultyMin}, {_difficultyMax})", errorLevels.warning)
	
	return array_random(_swarms)
}

///@description									Baddie swarm used to summon baddies
///@param {array<struct.baddieSwarm>} _swarms	Swarms to usesomething
///@param {real} _difficulty					Difficulty setting when selecting a swarm
function baddieSwarmCollection(_swarms, _difficulty = 1) constructor {
	swarms = _swarms
	
	baddies = []
	
	difficulty = _difficulty
		
	spawn = function(_eventTracker) {
		var _type = obj_none
		
		for (var i = 0; i < array_length(swarms); i++) {
			var _swarm = swarms[i]
			var _count = _swarm.count * get_baddie_scaling(baddieScalars.spawnCount)
			
			for (var j = 0; j < _swarm.count; j++) {
				_type = array_random(_swarm.types)
				
				var _baddies = spawn_baddie(_type, 1, 0, false)
				_baddies[0].eventParent = _eventTracker		
				
				baddies = array_concat(baddies, _baddies)
			}
		}
	}
}

///@description									Baddie swarm used to summon baddies
///@param {array<asset.GMObject>} _types		Type of baddie to spawn
///@param {real} _count							Amount to spawn
function baddieSwarm(_types, _count) constructor {
	types = _types
	count = _count
}
