
///@description								Sets up a spawn for an elite enemy
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
function setup_spawn_elite(_baddieType) {
    var _countPerWave = 1
    var _totalWaves = 1
    var _type = spawnerTypes.elite
    
    setup_spawn(_baddieType, _countPerWave, _totalWaves, _type)
}

