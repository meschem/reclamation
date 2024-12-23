///@description								Sets up an endless spawner
///@param {asset.GMObject} enemyType		Type of enemy to spawn
///@param {real} _phase						Phase to spawn in (0)
///@param {real} _enemiesPerWave			Number of waves to spawn in a phase (10)
///@param {real} _period					How often to spawn in seconds (1)
///@return {id.Instance}
function setup_spawner_endless(_enemyType, _phase = 0, _enemiesPerWave = 2, _period = 1) {
	var inst = setup_spawner(
		_enemyType,
		_phase,
		_enemiesPerWave,
		seconds_to_frames(_period)
	)
	
	inst.endless = true
	
	return inst
}
