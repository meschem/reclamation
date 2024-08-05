///@description	Creates a spawner for a level

///@param	{Asset.GMObject}	enemyType	Obj of enemy to spawn
///@param	{Real}				phase		Phase index to start (every 30 seconds)
///@param	{Real}				count		(10) Size of group spawned per period
///@param	{Real}				period		(240)  How often the group is spawned (in frames)
///@return	{Id.Instance}

function setup_spawner(enemyType, phase, count = 10, period = 240) {
	var inst = instance_create_depth(0, 0, 0, obj_spawner)
	var phaseLength = get_spawner_phase_length()
	var initialDelay = seconds_to_frames(4)
	
	inst.enemyTypes[0] = enemyType
	inst.spawnStartFrame = (phase * phaseLength) + initialDelay
	inst.spawnEndFrame = inst.spawnStartFrame + phaseLength
	inst.spawnCount = count
	inst.spawnPeriod = period
	
	return inst
}

///@description						Sets up multiple spawners for a phase
///@param {array<id.Instance>}
function setup_spawners(spawners) {
	
}

///@description								Creates a spawner from a struct
///@param {struct, array<struct>} params	Params to pass on. enemyType, 

//}

function create_spawner(params) {

}