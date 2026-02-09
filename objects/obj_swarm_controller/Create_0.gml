
///@description Init

swarmObjects = [
    obj_swarm_boarriers,
    obj_swarm_burning_skeletons,
    obj_swarm_reapers,
    obj_swarm_serpents,
    obj_swarm_skeletons,
    obj_swarm_slimes,
    obj_swarm_zombies,
]

swarms = []

/// Initialize swarms
for (var i = 0; i < array_length(swarmObjects); i++) {
    var _swarm = create_instance(swarmObjects[i])
    
    for (var j = 0; j < array_length(_swarm.swarms); j++) {
        array_push(swarms, _swarm.swarms[j])
    }
    
    instance_destroy(_swarm)
}

///@description                     Spawns the swarms
///@param {real} _difficultyMin     Difficulty min level to find
///@param {real} _difficultyMax     Difficulty max level to find
///@param {real} _biome             Biome to filter for
///@return {array<id.Instance>}
spawn = function(_difficultyMin, _difficultyMax = 999, biome = -1) {
    var _found = false
    var _baddies = []
    
    swarms = array_shuffle(swarms)
    
    for (var i = 0; i < array_length(swarms); i++) {
        if (
            biome != -1 &&
            !array_contains(swarms[i].biomes, biome)
        ) {
            continue   
        }

        if (
            swarms[i].difficulty >= _difficultyMin && 
            swarms[i].difficulty <= _difficultyMax
        ) {
            _baddies = swarms[i].spawn()
            
            return _baddies
        }
    }

    create_toaster($"No swarm found for difficulty min/max of ({_difficultyMin}, {_difficultyMax})")

    return _baddies
}

///@description                     Gets a random baddie type based on swarm setups to spawn an elite pack
///@param {real} _difficultyMin     Difficulty min level to find
///@param {real} _difficultyMax     Difficulty max level to find
///@param {real} _biome             Biome to filter for
///@return {array<id.Instance>}
spawnEliteGroup = function(_difficultyMin, _difficultyMax = 999, biome = -1) {
    var _found = false
    var _baddies = []
    
    swarms = array_shuffle(swarms)
    
    for (var i = 0; i < array_length(swarms); i++) {
        if (
            biome != -1 &&
            !array_contains(swarms[i].biomes, biome)
        ) {
            continue   
        }

        if (
            swarms[i].difficulty >= _difficultyMin && 
            swarms[i].difficulty <= _difficultyMax
        ) {
            _baddies = swarms[i].spawnElite()
            
            return _baddies
        }
    }

    create_toaster($"No swarm found for difficulty min/max of ({_difficultyMin}, {_difficultyMax})")

    return _baddies
}