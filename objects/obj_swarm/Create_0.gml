/// @description Object that represents a swarm of enemies

swarms = []
biomes = []
difficulties = []

valid = false

swarmIconSprite = spr_card_icons

///@description                 Run on map load. A swarm must be initialized to be valid
init = function() {
    for (var i = 0; i < array_length(swarms); i++) {
        for (var j = 0; j <= swarms[i].difficultyMax - swarms[i].difficultyMin; j++) {
            var _difficultyCheck = swarms[i].difficultyMin + j
            
            if (!array_contains(difficulties, _difficultyCheck)) {
                array_push(difficulties, _difficultyCheck)
            }
        }
    }
    
    valid = true
}

///@description                 Checks if this swarm is valid for the requested difficulty
///@param {real} _difficulty    Difficulty level to check for
///@return {bool}
isValidForDifficulty = function(_difficulty) {
    return array_contains(difficulties, _difficulty)
}

///@description                 Checks if this swarm is valid for the requested biome
///@param {real} _biome    Biome to check for
///@return {bool}
isValidForBiome = function(_biome) {
    return array_contains(biomes, _biome)
}

///@description                 Checks for all types of validation
///@param {real} _difficulty    Difficulty level to check for
///@param {real} _biome         Biome to check for
isValid = function(_difficulty, _biome) {
    if (!isValidForDifficulty(_difficulty)) {
        return false
    }
    
    if (!isValidForBiome(_biome)) {
        return false
    }
    
    return true
}

///@description                             Spawns the valid baddies from this swarm
///@param {real} _difficulty                Difficulty used for selection
///@return {array<id.Instance>}
spawn = function(_difficulty) {
    var _countMultiplier = get_baddie_scaling(baddieScalars.spawnCount)
    var _baddies = []
    
    for (var i = 0; i < array_length(swarms); i++) {
        var _roll = random(1)
        
        if (
            _difficulty >= swarms[i].difficultyMin &&
            _difficulty <= swarms[i].difficultyMax &&
            _roll < swarms[i].chanceToSpawn
        ) {
            var _count = swarms[i].count * _countMultiplier
            var _spawns = spawn_baddie_swarm(swarms[i].baddie, swarms[i].count)
            
            _baddies = array_concat(_baddies, _spawns)
        }
    }
    
    return _baddies
}
