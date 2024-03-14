///@description   Description
function setup_level_busy() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 6),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 10),
		spawner.setupSpawn(obj_wraith, 2, 2)
	])

	//spawner.addPhase([
	//	spawner.setupSpawn(obj_skeleton, 14),
	//	spawner.setupSpawn(obj_zombie, 3),
	//])

	//spawner.addPhase([
	//	spawner.setupSpawn(obj_skeleton, 60, 1)
	//])

	//spawner.addPhase([
	//	spawner.setupSpawn(obj_skeleton, 14),
	//	spawner.setupSpawn(obj_burning_skeleton, 12),
	//	spawner.setupSpawn(obj_skeleton_warrior, 3),
	//])

	//spawner.addPhase([
	//	spawner.setupSpawn(obj_wraith, 12, 2)
	//])
}