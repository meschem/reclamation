///@description	Creates a spawner for a level

///@param	{Asset.GMObject}	enemyType	Obj of enemy to spawn
///@param	{Real}				phase		Phase index to start (every 30 seconds)
///@param	{Real}				count		(10) Size of group spawned per period
///@param	{Real}				period		(5)  How often the group is spawned (in frames)

///@return	{Id.Instance}

function setup_spawner(enemyType, phase, count = 10, period = 240){
	var inst = instance_create_depth(0, 0, 0, obj_spawner)
	var phaseLength = 60 * 30
	
	inst.enemyTypes[0] = enemyType
	inst.spawnStartFrame = phase * phaseLength
	inst.spawnEndFrame = inst.spawnStartFrame + phaseLength
	inst.spawnCount = count
	inst.spawnPeriod = period
	
	return inst
}